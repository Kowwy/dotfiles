require("telescope").setup({
	defaults = {
		mappings = {},
	},
})

--Enable telescope fzf native
require("telescope").load_extension("fzf")
