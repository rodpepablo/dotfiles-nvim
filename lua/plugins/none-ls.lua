local CONSTANTS = require("../config/constants")

return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua, -- Lua
					null_ls.builtins.formatting.black, -- Python
					-- null_ls.builtins.diagnostics.flake8, -- Python
					null_ls.builtins.formatting.biome, -- TS/JS
					null_ls.builtins.formatting.csharpier,
				},
			})

			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
			vim.keymap.set({ "n", "v" }, "<leader>sd", function()
				vim.diagnostic.open_float(nil, { focusable = false })
			end, {})

			local group = vim.api.nvim_create_augroup(CONSTANTS.EVENT_GROUPS.PRE_SAVE, { clear = false })

			vim.api.nvim_create_autocmd("BufWritePre", {
				group = group,
				pattern = "*",
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end,
	},
}
