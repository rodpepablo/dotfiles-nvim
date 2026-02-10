return {
	"luukvbaal/statuscol.nvim",
	opts = function()
		local builtin = require("statuscol.builtin")
		vim.opt.foldcolumn = "1"
		vim.opt.fillchars = {
			foldopen = "",
			foldclose = "",
			foldsep = " ",
		}

		return {
			setopt = true,
			ft_ignore = { "oil" },
			segments = {
				{
					text = { builtin.lnumfunc, " " },
					condition = { true, builtin.not_empty },
					click = "v:lua.ScLa",
				},
				{ text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
			},
		}
	end,
}
