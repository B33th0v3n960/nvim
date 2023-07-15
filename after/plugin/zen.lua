local status_ok, zen = pcall(require, "true-zen")
if not status_ok then
	return
end

zen.setup({
	modes = {
		ataraxis = {
			shade = "dark",
			backdrop = 0,
			minimum_writing_area = {
				width = 70,
				height = 44,
			},
			quit_untoggles = true,
			padding = {
				left = 50,
				right = 50,
				top = 0,
				bottom = 0,
			},
			callbacks = {
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil,
			},
		},
		minimalist = {
			ignored_buf_types = { "nofile" },
			options = {
				number = true,
				relativenumber = true,
				showtabline = 0,
				signcolumn = "no",
				statusline = "",
				cmdheight = 1,
				laststatus = 0,
				showcmd = false,
				showmode = false,
				ruler = false,
				numberwidth = 1,
			},
			callbacks = {
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil,
			},
		},
		narrow = {
			folds_style = "informative",
			run_ataraxis = true,
			callbacks = {
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil,
			},
		},
		focus = {
			callbacks = {
				open_pre = nil,
				open_pos = nil,
				close_pre = nil,
				close_pos = nil,
			},
		},
	},
	integrations = {
		tmux = true,
		kitty = {
			enabled = true,
			font = "+3",
		},
		twilight = false,
		lualine = true,
	},
})
