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
  ["<C-space>"] = cmp.mapping(function()
    if not cmp.visible() then
      cmp.complete()
    else
      cmp.close()
    end
  end),
})
cmp_mappings["<C-y>"] = nil -- use for copilot, instead

lsp.setup_nvim_cmp({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp_mappings,
  -- NOTE: If there are lsp and luasnip *snippet* suggestions, then favor luasnip.
  -- Else, if *only* luasnip snippets are available, then favor lsp
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  sorting = {
    -- TODO: Implement sorting
    --  - [x] Favor functions w/ less params
    --  - [ ] Lower emmet priority
    comparators = {
      function(entry1, entry2)
        local file = io.open("~/.config/nvim/output.txt", "a")
        if file ~= nil then
          file:write("cmp-sorting entry1" .. entry1.source.name .. "\n")
          file:write("cmp-sorting entry2" .. entry2.source.name .. "\n")
        else
          print("file is nil")
        end

        local is_emmet1 = entry1.source.name == "emmet"
        local is_emmet2 = entry2.source.name == "emmet"

        -- Deprioritize emmet-lsp suggestions
        if is_emmet1 and not is_emmet2 then
          return false
        elseif not is_emmet1 and is_emmet2 then
          return true
        end

        -- If neither are emmet-lsp suggestions, maintain the default order
        return entry1:get_sort_text() < entry2:get_sort_text()

        -- -- local file = io.open("output.txt", "a")
        --
        -- local result = vim.stricmp(entry1.completion_item.label, entry2.completion_item.label)
        -- local source1 = entry1.source.name
        --
        -- -- if file ~= nil then
        -- --   print("file is open")
        -- --   file.write("cmp-sorting entry1" .. entry1.completion_item.label)
        -- --   file.write("cmp-sorting entry2" .. entry2.completion_item.label)
        -- --   file.write("cmp-sorting result" .. result)
        -- -- else
        -- --   print("file is nil")
        -- -- end
        -- -- print("cmp-sorting result" .. result)
        -- --
        --
        -- if result == 0 then
        --   return true
        -- end
      end,
      cmp.locality,
      cmp.recently_used,
      cmp.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
      cmp.offset,
      cmp.order,
      cmp.length,
      -- cmp.config.compare.offset,
      -- cmp.config.compare.exact,
      -- cmp.config.compare.score,
      -- cmp.config.compare.kind,
      -- cmp.config.compare.sort_text,
      -- cmp.config.compare.length,
      -- cmp.config.compare.order,
    },
    -- confirm_opts = {
    --   behavior = cmp.ConfirmBehavior.Replace,
    --   select = false,
    -- },
    -- experimental = {
    --   ghost_text = false,
    -- },
  },
})

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
