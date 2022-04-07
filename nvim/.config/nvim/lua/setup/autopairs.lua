local npairs = require('nvim-autopairs')

npairs.setup({
	check_ts = true,
	ts_config = {
		lua = {'string'},
		javascript = {'template_string'},
		java = false,
	},
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
