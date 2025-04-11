local M = {}

function M.header()
	return {
		"",
		"",
		"",
		"",
		"",
		"",
		"                                                     ",
		"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
		"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
		"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
		"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
		"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
		"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
		"                                                     ",
		"",
		"",
	}
end

function M.buttons(dashboard)
	return {
		dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("f", "󰈞  > Find file", ":cd $HOME/Documentos/code | Telescope find_files<CR>"),
		dashboard.button("p", "  > Find in project", ":Telescope git_files<CR>"),
		dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
		dashboard.button("u", "󰚰  > Update plugins", ":Lazy update<CR>"),
		dashboard.button(
			"s",
			"  > Settings",
			":e $MYVIMRC | :cd %:p:h | wincmd k | :Neotree filesystem reveal left<CR> | pwd<CR>"
		),
		dashboard.button("q", "󰅚  > Quit NVIM", ":qa<CR>"),
	}
end

function M.footer()
	local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
	local version = vim.version()
	local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

	return datetime .. nvim_version_info
end

return M
