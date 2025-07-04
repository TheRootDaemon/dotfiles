return {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
        local jdtls = require("jdtls")

        -- Find the root directory of the Java project
        local root_markers = { "gradlew", ".git", "mvnw", "pom.xml", "build.gradle", ".project" }
        local root_dir = vim.fs.dirname(vim.fs.find(root_markers, { upward = true })[1])

        -- If no project root found, use current directory or create a temp workspace
        if not root_dir then
            root_dir = vim.fn.getcwd()
        end

        -- Create workspace folder name
        local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
        if project_name == "" or project_name == "." then
            project_name = "temp"
        end

        local workspace_folder = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

        -- Path to jdtls installation
        local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"

        -- Check if jdtls is installed
        if vim.fn.isdirectory(jdtls_path) == 0 then
            vim.notify("jdtls not found. Please install it via Mason (:Mason)", vim.log.levels.ERROR)
            return
        end

        -- Get system information for proper jdtls launcher
        local system = vim.loop.os_uname().sysname
        local config_name = "config_linux"
        if system == "Darwin" then
            config_name = "config_mac"
        elseif system == "Windows_NT" then
            config_name = "config_win"
        end

        -- Find the actual launcher jar file
        local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
        if launcher_jar == "" then
            vim.notify("jdtls launcher jar not found", vim.log.levels.ERROR)
            return
        end

        -- Enhanced capabilities for Java
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_nvim_lsp.default_capabilities()
        )

        -- Enhanced on_attach function for Java-specific features
        local on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, silent = true, noremap = true }

            -- Standard LSP keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover" }))
            vim.keymap.set(
                "n",
                "gd",
                vim.lsp.buf.definition,
                vim.tbl_extend("force", opts, { desc = "Go to Definition" })
            )
            vim.keymap.set(
                "n",
                "gr",
                vim.lsp.buf.references,
                vim.tbl_extend("force", opts, { desc = "Go to References" })
            )
            vim.keymap.set(
                "n",
                "<leader>ca",
                vim.lsp.buf.code_action,
                vim.tbl_extend("force", opts, { desc = "Code Action" })
            )
            vim.keymap.set("n", "<leader>F", function()
                vim.lsp.buf.format({ async = true })
            end, vim.tbl_extend("force", opts, { desc = "Format" }))

            -- Java-specific keymaps
            vim.keymap.set(
                "n",
                "<leader>jo",
                jdtls.organize_imports,
                vim.tbl_extend("force", opts, { desc = "Organize Imports" })
            )
            vim.keymap.set(
                "n",
                "<leader>jv",
                jdtls.extract_variable,
                vim.tbl_extend("force", opts, { desc = "Extract Variable" })
            )
            vim.keymap.set(
                "n",
                "<leader>jc",
                jdtls.extract_constant,
                vim.tbl_extend("force", opts, { desc = "Extract Constant" })
            )
            vim.keymap.set("v", "<leader>jm", function()
                jdtls.extract_method(true)
            end, vim.tbl_extend("force", opts, { desc = "Extract Method" }))
            vim.keymap.set("n", "<leader>jt", jdtls.test_class, vim.tbl_extend("force", opts, { desc = "Test Class" }))
            vim.keymap.set(
                "n",
                "<leader>jn",
                jdtls.test_nearest_method,
                vim.tbl_extend("force", opts, { desc = "Test Nearest Method" })
            )
        end

        -- JDTLS configuration
        local config = {
            cmd = {
                "java",
                "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                "-Dosgi.bundles.defaultStartLevel=4",
                "-Declipse.product=org.eclipse.jdt.ls.core.product",
                "-Dlog.protocol=true",
                "-Dlog.level=ERROR",
                "-Xmx1g",
                "--add-modules=ALL-SYSTEM",
                "--add-opens",
                "java.base/java.util=ALL-UNNAMED",
                "--add-opens",
                "java.base/java.lang=ALL-UNNAMED",
                "-jar",
                launcher_jar,
                "-configuration",
                jdtls_path .. "/" .. config_name,
                "-data",
                workspace_folder,
            },
            root_dir = root_dir,
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                java = {
                    eclipse = {
                        downloadSources = true,
                    },
                    configuration = {
                        updateBuildConfiguration = "interactive",
                        runtimes = {
                            -- Add your Java runtimes here if needed
                            -- {
                            --     name = "JavaSE-11",
                            --     path = "/path/to/java-11",
                            -- },
                            -- {
                            --     name = "JavaSE-17",
                            --     path = "/path/to/java-17",
                            -- },
                        },
                    },
                    maven = {
                        downloadSources = true,
                    },
                    implementationsCodeLens = {
                        enabled = true,
                    },
                    referencesCodeLens = {
                        enabled = true,
                    },
                    references = {
                        includeDecompiledSources = true,
                    },
                    format = {
                        enabled = true,
                        settings = {
                            url = vim.fn.stdpath("config") .. "/lang-servers/intellij-java-google-style.xml",
                            profile = "GoogleStyle",
                        },
                    },
                },
                signatureHelp = {
                    enabled = true,
                },
                completion = {
                    favoriteStaticMembers = {
                        "org.hamcrest.MatcherAssert.assertThat",
                        "org.hamcrest.Matchers.*",
                        "org.hamcrest.CoreMatchers.*",
                        "org.junit.jupiter.api.Assertions.*",
                        "java.util.Objects.requireNonNull",
                        "java.util.Objects.requireNonNullElse",
                        "org.mockito.Mockito.*",
                    },
                    importOrder = {
                        "java",
                        "javax",
                        "com",
                        "org",
                    },
                },
                extendedClientCapabilities = jdtls.extendedClientCapabilities,
                sources = {
                    organizeImports = {
                        starThreshold = 9999,
                        staticStarThreshold = 9999,
                    },
                },
                codeGeneration = {
                    toString = {
                        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                    },
                    useBlocks = true,
                },
            },
            flags = {
                allow_incremental_sync = true,
            },
            init_options = {
                bundles = {},
            },
        }

        -- Start or attach to jdtls
        jdtls.start_or_attach(config)
    end,
}
