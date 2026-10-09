-- editor options/settings
require("core.opts")

-- plugin manager, plugin specs
require("core.manager")

-- LSP configurations; laoded after plugins are loaded,
-- since it extends the capabilities of autocompletion plugins
require("core.lsp_config")
