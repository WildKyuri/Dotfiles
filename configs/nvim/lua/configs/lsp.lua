local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
    -- format on save
        if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	        vim.api.nvim_create_autocmd("BufWritePre", {
		    group = augroup,
		    buffer = bufnr,
		    callback = function()
		    vim.lsp.buf.format()
            end,
	})
    end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- TypeScript
nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- CSS
nvim_lsp.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Tailwind
nvim_lsp.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- HTML
nvim_lsp.html.setup({
	on_attach = on_attach,
	capabilities = capabilities, 
})

-- JSON
nvim_lsp.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Eslint
nvim_lsp.eslint.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Python
nvim_lsp.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- C/C++
nvim_lsp.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- C#
nvim_lsp.csharp_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- PHP
nvim_lsp.intelephense.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
