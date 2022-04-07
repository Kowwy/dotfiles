local lsp_installer = require("nvim-lsp-installer")

function common_on_attach(client, bufnr)

end

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {
		on_attach = common_on_attach,
	}

	if server.name == "eslint" then
		opts.on_attach = function (client, bufnr)
			client.resolved_capabilities.document_formatting = true
			common_on_attach(client, bufnr)
		end
		opts.settings = {
			format = { enable = true },
		}
	end


    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
