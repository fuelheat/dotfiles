local function setup()
	-------------------- neovim/nvim-lspconfig
	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer
	local function on_attach(client, buffer)
		require("mappings").lspconfig(buffer)

		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			update_in_insert = true,
			virtual_text = {
				source = "if_many",
				prefix = "",
			},
		})

		local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

		for type, icon in pairs(signs) do
			local hl = "LspDiagnosticsSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl })
		end
	end

	local function on_attach_eslint(client, buffer)
		client.resolved_capabilities.document_formatting = true
		on_attach(client, buffer)
	end

	local function on_attach_tsserver(client, buffer)
		client.resolved_capabilities.document_formatting = false
		on_attach(client, buffer)
	end

	-------------------- williamboman/nvim-lsp-installer
	require("nvim-lsp-installer").on_server_ready(function(server)
		local opts = {}
		opts.on_attach = on_attach
		opts.flags = { debounce_text_changes = 100 }

		-- (optional) Customize the options passed to the server
		-- if server.name == "tsserver" then
		--     opts.root_dir = function() ... end
		-- end

		if server.name == "eslint" then
			opts.on_attach = on_attach_eslint
			opts.settings = { format = { enable = true } }
		end

		if server.name == "tsserver" then
			opts.on_attach = on_attach_tsserver
			opts.settings = { format = { enable = false } }
		end

		-- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
		server:setup(require("coq").lsp_ensure_capabilities(opts))
		vim.cmd([[ do User LspAttachBuffers ]])
	end)
end

return { setup = setup }
