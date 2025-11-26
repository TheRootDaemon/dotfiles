local module = {}

function module.isBufEmpty()
    return vim.fn.bufname() ~= "" and vim.bo.buftype == ""
end

function module.getBufId(index)
    local buffers = vim.fn.getbufinfo({ buflisted = 1 })
    return buffers[index] and buffers[index].bufnr or nil
end

function module.getBufIndex(bufnr)
    local buffers = vim.fn.getbufinfo({ buflisted = 1 })

    for i, buf in ipairs(buffers) do
        if buf.bufnr == bufnr then
            return i
        end
    end

    return 1
end

return module
