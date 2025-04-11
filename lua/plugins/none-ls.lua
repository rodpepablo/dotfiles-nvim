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
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.isort,
					require("none-ls.diagnostics.eslint_d"),
				},
			})

			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

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
