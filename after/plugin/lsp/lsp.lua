-- TODO: Disable emmet for text files

local lsp = require("lsp-zero")
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local copilot_suggestion = require("copilot.suggestion")
local luasnip = require("luasnip")
local lspconfig = require("lspconfig")

lsp.preset("recommended")

lsp.ensure_installed({
  "tsserver",
  "rust_analyzer",
  "bashls",
  "clangd",
  "cssls",
  "cssmodules_ls",
  "eslint",
  "gradle_ls",
  "groovyls",
  "html",
  "emmet_ls",
  "jdtls",
  "jsonls",
  "lua_ls",
  "luau_lsp",
  "powershell_es",
  "pyright",
  "rust_analyzer",
  "sqlls",
  "tailwindcss",
  "tsserver",
  "vimls",
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  ["<Enter>"] = cmp.mapping.confirm({ select = true }),
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
  ["<C-A-l>"] = cmp.mapping(function(fallback)
    if copilot_suggestion.is_visible() then
      copilot_suggestion.accept_line()
    else
      fallback()
    end
  end),
  ["<C-j>"] = cmp.mapping(function()
    if not cmp.visible() then
      cmp.complete()
    else
      cmp.close()
    end
  end),
})
cmp_mappings["<C-y>"] = nil -- used for copilot

lsp.setup_nvim_cmp({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp_mappings,
  sources = {
    { name = "nvim_lsp" },
    { name = "tsserver" },
    { name = "eslint" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "emmet_ls" },
    { name = "buffer" },
    { name = "path" },
    { name = "fake" },
  },
  sorting = {
    -- TODO: Implement sorting
    -- * Favor functions w/ less params
    -- * Lower emmet priority
    comparators = {
      function(entry1, entry2)
        local score1 = entry1.completion_item.label
        local score2 = entry2.completion_item.label

        local file = io.open("tmp.txt", "a")
        if file == nil then
          print("Error opening file")
          return
        end

        file:write("New test:\n\n")

        file:write(score1 .. "\n")
        file:write(score2 .. "\n")

        file:write("\n\nDone.\n\n")

        --   if score1 == score2 then
        --     return cmp.entry_cmp(entry1, entry2)
        --   end
        --   return score1 > score2
      end,
    },
  },
})

-- io.output(file)
-- io.write(entry1.name)
-- io.write(entry2.name)

local builtin = require("telescope.builtin")
lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function()
    builtin.lsp_definitions()
  end, opts)
  vim.keymap.set("n", "gi", function()
    builtin.lsp_implementations()
  end, opts)
  -- vim.keymap.set("n", "K", function()
  --   vim.lsp.buf.hover()
  -- end, opts)
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
