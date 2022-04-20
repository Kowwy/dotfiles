require("catppuccin").setup({
	styles = {
		comments = "italic",
		functions = "italic",
		keywords = "italic",
		strings = "NONE",
		variables = "italic",
	},
	integrations = {
		which_key = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		ts_rainbow = true,
	},
})
