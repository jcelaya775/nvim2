require("lspconfig").apex_ls.setup({
	apex_jar_path = vim.fn.expand("$HOME/apex-jorje-lsp.jar"),
	apex_enable_semantic_errors = true,
	apex_enable_completion_statistics = true,
})

vim.cmd([[
augroup FileTypeGroup
	au!
	au BufRead,BufNewFile *.cls,*.trigger,*.apex set filetype=apex | set syntax=apex
augroup END
]])
