require("nvim-ts-autotag").setup()
require("nvim-autopairs").setup({
	map_complete = true, -- it will auto insert `(` after select function or method item
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
