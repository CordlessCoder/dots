local gl = require("galaxyline")
local gls = gl.section
gl.short_line_list = { "LuaTree", "vista", "dbui", "NvimTree" }

local colors = {
	bg = "#1A1B26",
	fg = "#C0CAF5",
	black = "#11121D",
	gray = "#414868",
	lgray = "#A9B1D6",
	color1 = "#EC7188",
	color2 = "#759BEC",
	color3 = "#78C6F3",
	color4 = "#97C566",
	color5 = "#D6A764",
	color6 = "#B393EC",
	color7 = "#D6A764",
	color8 = "#97C566",
}

local buffer_not_empty = function()
	if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
		return true
	end
	return false
end

local bg_buffer = function()
	if buffer_not_empty() then
		return colors.gray
	end
	return colors.fg
end

gls.left[1] = {
	FirstElement = {
		provider = function()
			return "▋"
		end,
		highlight = { colors.bg, colors.lgray },
	},
}
gls.left[2] = {
	ViMode = {
		provider = function()
			local alias =
				{ n = "NORMAL", i = "INSERT", c = "COMMAND", v = "VISUAL", V = "VISUAL LINE", [""] = "VISUAL BLOCK" }
			return alias[vim.fn.mode()]
		end,
		separator = "",
		separator_highlight = {
			colors.lgray,
			bg_buffer,
		},
		highlight = { colors.black, colors.lgray, "bold" },
	},
}
gls.left[3] = {
	FileIcon = {
		provider = "FileIcon",
		condition = buffer_not_empty,
		highlight = { require("galaxyline.provider_fileinfo").get_file_icon_color, colors.gray },
		separator = "▋",
		separator_highlight = {
			colors.gray,
			colors.bg,
		},
	},
}

gls.left[4] = {
	FileName = {
		provider = { "FileName", "FileSize" },
		condition = buffer_not_empty,
		separator = "▋",
		separator_highlight = { colors.bg, colors.gray },
		highlight = { colors.fg, colors.bg },
	},
}

gls.left[5] = {
	GitIcon = {
		provider = function()
			return "  "
		end,
		condition = buffer_not_empty,
		highlight = { colors.fg, colors.gray },
		separator = "",
		separator_highlight = {
			colors.gray,
			colors.fg,
		},
	},
}

gls.left[6] = {
	GitBranch = {
		provider = "GitBranch",
		condition = buffer_not_empty,
		highlight = { colors.black, colors.fg },
	},
}

local checkwidth = function()
	local squeeze_width = vim.fn.winwidth(0) / 2
	return squeeze_width > 40 and buffer_not_empty()
end

local curbg = colors.rg
gls.left[7] = {
	DiffAdd = {
		provider = "DiffAdd",
		condition = checkwidth,
		icon = " ",
		highlight = { colors.color4, curbg },
	},
}
gls.left[8] = {
	DiffModified = {
		provider = "DiffModified",
		condition = checkwidth,
		icon = " ",
		highlight = { colors.color2, curbg },
	},
}
gls.left[9] = {
	DiffRemove = {
		provider = "DiffRemove",
		condition = checkwidth,
		icon = " ",
		highlight = { colors.color1, curbg },
	},
}
gls.left[10] = {
	LeftEnd = {
		condition = buffer_not_empty,
		provider = function()
			return "▋"
		end,
		-- separator = "▋",
		-- separator_highlight = { colors.fg, colors.bg },
		highlight = { colors.fg, colors.bg },
	},
}
gls.left[11] = {
	DiagnosticError = {
		provider = "DiagnosticError",
		icon = "  ",
		highlight = { colors.color1, colors.bg },
	},
}
gls.left[12] = {
	Space = {
		provider = function()
			return " "
		end,
	},
}
gls.left[13] = {
	DiagnosticWarn = {
		provider = "DiagnosticWarn",
		icon = "  ",
		highlight = { colors.color2, colors.bg },
	},
}
gls.right[1] = {
	FileFormat = {
		provider = "FileFormat",
		separator = "▋",
		separator_highlight = {
			colors.bg,
			colors.gray,
		},
		highlight = { colors.purple, colors.gray, "bold" },
	},
}
gls.right[2] = {
	LineInfo = {
		provider = "LineColumn",
		separator = " |",
		separator_highlight = { colors.color6, colors.gray },
		highlight = { colors.grey, colors.gray },
	},
}
gls.right[3] = {
	PerCent = {
		provider = "LinePercent",
		separator = "",
		separator_highlight = { colors.lgray, colors.gray },
		highlight = { colors.black, colors.lgray, "bold" },
	},
}
gls.right[4] = {
	ScrollBar = {
		provider = "ScrollBar",
		highlight = { colors.lgray, colors.bg },
	},
}

gls.short_line_left[1] = {
	FirstElement = {
		provider = function()
			return "▋"
		end,
		highlight = { colors.black, colors.lgray },
	},
}
gls.short_line_left[2] = {
	BufferType = {
		provider = "FileTypeName",
		separator = "",

		separator_highlight = {
			colors.lgray,
			colors.bg,
		},
		highlight = { colors.black, colors.lgray, "bold" },
	},
}

gls.short_line_right[1] = {
	BufferIcon = {
		provider = "BufferIcon",
		separator = "",
		separator_highlight = { colors.lgray, colors.bg },
		highlight = { colors.bg, colors.lgray },
	},
}
