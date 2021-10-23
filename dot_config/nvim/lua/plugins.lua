return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("config.treesitter")
		end,
		run = ":TSUpdate",
		-- branch = "0.5-compat",
	})
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("RRethy/nvim-treesitter-textsubjects")
	use("nvim-treesitter/playground")
	-- use("windwp/nvim-autopairs")
	-- use("windwp/nvim-ts-autotag")
	use("kyazdani42/nvim-web-devicons")
	-- use { 'ibhagwan/fzf-lua', requires = { 'vijaymarupudi/nvim-fzf' } }
	use("itchyny/vim-cursorword")
	use("lewis6991/gitsigns.nvim")
	use("romgrk/barbar.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("folke/tokyonight.nvim")
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use({ "ms-jpq/coq_nvim", branch = "coq" })
	use({ "ms-jpq/coq.artifacts", branch = "artifacts" })
	use("ray-x/lsp_signature.nvim")
	use("sbdchd/neoformat")
	use("tpope/vim-commentary")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("tommcdo/vim-lion")
	use("nacro90/numb.nvim")
	use("p00f/nvim-ts-rainbow")
	use({ "glepnir/galaxyline.nvim", config = "require('config.galaxyline')" })
	use("norcalli/nvim-colorizer.lua")
	-- use({ "rrethy/vim-hexokinase", run = "make hexokinase", cmd = "HexokinaseTurnOn" })
	use("nvim-telescope/telescope.nvim")
	use("AndrewRadev/sideways.vim")
	use("AndrewRadev/splitjoin.vim")
	use("matze/vim-move")
	-- use("tpope/vim-abolish")
	-- use("tpope/vim-surround")
	-- use("terryma/vim-expand-region")
	use("inside/vim-search-pulse")
	use("is0n/fm-nvim")
	use("kana/vim-textobj-user")
	use("rhysd/vim-textobj-anyblock")
	use("chaoren/vim-wordmotion")
	use("kana/vim-arpeggio")
	use("andymass/vim-matchup")
	-- use("ggandor/lightspeed.nvim")
end)
