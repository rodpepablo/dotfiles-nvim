vim.keymap.set("n", "<leader>rlf", ":PlenaryBustedFile %<CR>")

return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-python",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python")({
						dap = { justMyCode = false },
						runner = "pytest",
						python = function()
							return vim.fn.trim(vim.fn.system("poetry env info -p")) .. "/bin/python"
						end,
					}),
				},
			})
			vim.keymap.set("n", "<leader>rt", function()
				require("neotest").run.run()
			end)

			vim.keymap.set("n", "<leader>rf", function()
				require("neotest").run.run(vim.fn.expand("%"))
			end)

			vim.keymap.set("n", "<leader>sto", function()
				require("neotest").output.open({ enter = true })
			end)
		end,
	},
}
