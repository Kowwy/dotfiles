
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

--nvim-cmp setup
local lspkind = require("lspkind")
local cmp_buffer = require("cmp_buffer")
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "text_symbol",
			maxwidth = 50,
			before = function(entry, vim_item)
				return vim_item
			end,
			dup = 0,
			menu = {
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				treesitter = "[TS]",
				latex_symbols = "[Latex]",
			},
		}),
	},
	sorting = {
		--comparators = {
		--	function (...) return cmp_buffer:compare_locality(...) end,
		--	}
	},
	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "treesitter" },
		{ name = "nvim_lsp_signature_help" },
		--{
		--	name = 'buffer',
		--	option = {
		--		get_bufnrs = function() return { vim.api.nvim_get_current_buf() } end
		--	},
		--},
		{ name = "path" },
	},
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"
