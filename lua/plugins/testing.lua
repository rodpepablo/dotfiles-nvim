vim.keymap.set("n", "<leader>rlf", ":PlenaryBustedFile %<CR>")

return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neotest/nvim-nio",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-python",
			"Issafalcon/neotest-dotnet",
		},
		config = function()
			local neotest = require("neotest")

			neotest.setup({
				adapters = {
					require("neotest-python")({
						dap = { justMyCode = false },
						runner = "pytest",
						python = function()
							return vim.fn.trim(vim.fn.system("poetry env info -p")) .. "/bin/python"
						end,
					}),
					require("neotest-dotnet")({
						dap = { justMyCode = false },
					}),
				},
			})

			vim.keymap.set("n", "<leader>rt", function()
				require("neotest").run.run()
			end)

			vim.keymap.set("n", "<leader>ra", function()
				require("neotest").run.run(vim.fn.expand("%"))
			end)

			vim.keymap.set("n", "<leader>sto", function()
				require("neotest").output.open({ enter = true })
			end)
		end,
	},
}
