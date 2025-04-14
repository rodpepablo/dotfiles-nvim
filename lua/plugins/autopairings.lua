return {
	{
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup({})
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
}
