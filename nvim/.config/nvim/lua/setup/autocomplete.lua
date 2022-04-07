local cmp = require('cmp')
local lspkind = require('lspkind')
local cmp_buffer = require('cmp_buffer')


vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
		{
			name = 'buffer',
			option = {
				get_bufnrs = function ()
					return vim.api.nvim_list_bufs()
				end
			}
		},
		{ name = 'path' },
		{ name = 'nvim_lsp_signature_help' }
	}),

	sorting = {
		comparators = {
			function (...) return cmp_buffer:compare_locality(...) end,
		}
	},

	formatting = {
		format = lspkind.cmp_format({
			mode = 'text_symbol',
			maxwidth = 50,
			before = function (entry, vim_item)
				return vim_item
			end
		})
	},
})


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
