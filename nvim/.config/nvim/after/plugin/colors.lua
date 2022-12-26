function DoColor(color)
	color = color or "dracula"
	vim.cmd.colorscheme(color)
end

DoColor()
