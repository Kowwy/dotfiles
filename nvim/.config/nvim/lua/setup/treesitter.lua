require('nvim-treesitter.configs').setup({
    ensure_instaled = "maintained",
	sync_install = false,
	highlight = { enable = true },
	incremental_selection = { enable = true },
	textobjects = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil
	}
	})
	
