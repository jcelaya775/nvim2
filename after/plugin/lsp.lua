local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"rust_analyzer",
	"actionlint",
	"apex_ls",
	"bashls",
	"black",
	"clang-format",
	"clangd",
	"cmake",
	"cmakelang",
	"cpplint",
	"csharp_ls",
	"csharpier",
	"cssls",
	"cssmodules_ls",
	"debugpy",
	"docker_compose_language_service",
	"dockerls",
	"emmet_language_server",
	"eslint",
	"eslint_d",
	"google-java-format",
	"gradle_ls",
	"graphql",
	"groovyls",
	"html",
	"jdtls",
	"jsonls",
	"jsonlint",
	"lua_ls",
	"luau_lsp",
	"markdownlint",
	"markuplint",
	"mypy",
	"omnisharp",
	"powershell_es",
	"prettierd",
	"pyright",
	"r_language_server",
	"ruff",
	"rust_analyzer",
	"rustfmt",
	"shellcheck",
	"shfmt",
	"sql-formatter",
	"sqlfluff",
	"sqlls",
	"stylelint",
	"stylua",
	"tailwindcss",
	"tsserver",
	"vimls",
	"visualforce_ls",
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local copilot_suggestion = require("copilot.suggestion")
local luasnip = require("luasnip")

local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.confirm({ select = true })
		elseif copilot_suggestion.is_visible() then
			copilot_suggestion.accept()
		elseif luasnip.in_snippet() then
			luasnip.jump(1)
		else
			fallback()
		end
	end),
	["<S-Tab>"] = cmp.mapping(function(fallback)
		if luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end),
	[""] = cmp.mapping(function(fallback)
		if copilot_suggestion.is_visible() then
			copilot_suggestion.accept_word()
		else
			fallback()
		end
	end),
	["<A-l>"] = cmp.mapping(function(fallback)
		if copilot_suggestion.is_visible() then
			copilot_suggestion.accept_line()
		else
			fallback()
		end
	end),
	-- ["<Enter>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
	["<C-j>"] = cmp.mapping.complete(),
	["<C-k>"] = cmp.mapping.close(),
})
cmp_mappings["<C-y>"] = nil

function cmp_mappings:complete()
	if copilot_suggestion.is_visible() then
		copilot_suggestion.accept()
	else
		cmp.mapping.complete()
	end
end

vim.keymap.set("n", "<leader>m", ":Mason<CR>")

lsp.setup_nvim_cmp({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp_mappings,
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
		{ name = "path" },
	},
	sorting = {
		comparators = {
			-- cmp.config.compare.offset,
			-- cmp.config.compare.exact,
			-- cmp.config.compare.score,
			-- cmp.config.compare.kind,
			-- cmp.config.compare.sort_text,
			-- cmp.config.compare.length,
			-- cmp.config.compare.order,
		},
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover() -- TODO: only run when hover is available
	end, opts)
	vim.keymap.set("n", "<leader>ws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>d", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>rr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = false,
})
