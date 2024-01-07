require("nvim-treesitter.configs").setup({
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
        ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
        ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
        ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

        -- works for javascript/typescript files (custom capture created by josean in after/queries/ecma/textobjects.scm)
        ["a;"] = { query = "@property.outer", desc = "Select outer part of an object property" },
        ["i;"] = { query = "@property.inner", desc = "Select inner part of an object property" },
        ["l;"] = { query = "@property.lhs", desc = "Select left part of an object property" },
        ["r;"] = { query = "@property.rhs", desc = "Select right part of an object property" },

        ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
        ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

        ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
        ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

        ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
        ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

        ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
        ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

        ["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
        ["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },

        ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>na"] = "@parameter.inner", -- swap parameters/argument with next
        ["<leader>n;"] = "@property.outer", -- swap object property with next
        ["<leader>nm"] = "@function.outer", -- swap function with next
      },
      swap_previous = {
        ["<leader>pa"] = "@parameter.inner", -- swap parameters/argument with prev
        ["<leader>p;"] = "@property.outer", -- swap object property with prev
        ["<leader>pm"] = "@function.outer", -- swap function with previous
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]f"] = { query = "@call.outer", desc = "Next function call start" },
        ["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
        ["]c"] = { query = "@class.outer", desc = "Next class start" },
        ["]i"] = { query = "@conditional.inner", desc = "Next conditional start" },
        ["]l"] = { query = "@loop.outer", desc = "Next loop start" },
        ["]a"] = { query = "@parameter.inner", desc = "Next parameter start" },
        ["]="] = { query = "@assignment.outer", desc = "Next assignment start" },
        ["];"] = { query = "@property.outer", desc = "Next property start" },
        ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope start" },
        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold start" },
      },
      goto_next_end = {
        ["]F"] = { query = "@call.outer", desc = "Next function call end" },
        ["]M"] = { query = "@function.outer", desc = "Next method/function def end" },
        ["]C"] = { query = "@class.outer", desc = "Next class end" },
        ["]I"] = { query = "@conditional.inner", desc = "Next conditional end" },
        ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
        ["]A"] = { query = "@parameter.inner", desc = "Next parameter end" },
        ["]+"] = { query = "@assignment.outer", desc = "Next assignment end" },
        ["]:"] = { query = "@property.outer", desc = "Next property end" },
        ["]S"] = { query = "@scope", query_group = "locals", desc = "Next scope end" },
        ["]Z"] = { query = "@fold", query_group = "folds", desc = "Next fold end" },
      },
      goto_previous_start = {
        ["[f"] = { query = "@call.outer", desc = "Prev function call start" },
        ["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
        ["[c"] = { query = "@class.outer", desc = "Prev class start" },
        ["[i"] = { query = "@conditional.inner", desc = "Prev conditional start" },
        ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
        ["[a"] = { query = "@parameter.inner", desc = "Prev parameter start" },
        ["[="] = { query = "@assignment.outer", desc = "Prev assignment start" },
        ["[;"] = { query = "@property.outer", desc = "Prev property start" },
        ["[s"] = { query = "@scope", query_group = "locals", desc = "Prev scope start" },
        ["[z"] = { query = "@fold", query_group = "folds", desc = "Prev fold start" },
      },
      goto_previous_end = {
        ["[F"] = { query = "@call.outer", desc = "Prev function call end" },
        ["[M"] = { query = "@function.outer", desc = "Prev method/function def end" },
        ["[C"] = { query = "@class.outer", desc = "Prev class end" },
        ["[I"] = { query = "@conditional.inner", desc = "Prev conditional end" },
        ["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
        ["[A"] = { query = "@parameter.inner", desc = "Prev parameter end" },
        ["[+"] = { query = "@assignment.outer", desc = "Prev assignment end" },
        ["[:"] = { query = "@property.outer", desc = "Prev property end" },
        ["[S"] = { query = "@scope", query_group = "locals", desc = "Prev scope end" },
        ["[Z"] = { query = "@fold", query_group = "folds", desc = "Prev fold end" },
      },
    },
    lsp_interop = {
      enable = true,
      border = "rounded",
      floating_preview_opts = {},
      peek_definition_code = {
        ["<leader>k"] = "@function.outer",
        ["<leader>K"] = "@class.outer",
      },
    },
  },
})

local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

vim.keymap.set({ "n", "x", "o" }, "<A-)>", function()
  ts_repeat_move.repeat_last_move_next()
  vim.api.nvim_feedkeys("zz", "n", true)
end)

vim.keymap.set({ "n", "x", "o" }, "<A-(>", function()
  ts_repeat_move.repeat_last_move_previous()
  vim.api.nvim_feedkeys("zz", "n", true)
end)
