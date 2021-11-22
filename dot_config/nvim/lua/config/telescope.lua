local function setup()
	require("telescope").setup({
		defaults = {
			border = false,
			layout_strategy = "center",
			layout_config = {
				preview_cutoff = 0,
				height = 999,
				width = 999,
			},
			mappings = {
				i = {
					["<esc>"] = require("telescope.actions").close,
				},
			},
		},
	})
	require("mappings").telescope()
end

return { setup = setup }
