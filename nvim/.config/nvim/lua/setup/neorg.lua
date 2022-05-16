require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.norg.qol.toc"] = {},
		["core.export"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					notes = "~/notes",
				},
			},
		},
		["core.norg.concealer"] = {
			config = {
				icon_preset = "varied",
			},
		},
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.integrations.nvim-cmp"] = {},
	},
})
