local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")
	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)
	vim.keymap.set("n", "l", api.node.open.edit, opts("Close"))
	vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Close"))
	vim.keymap.set("n", "o", api.node.open.edit, opts("Close"))
	vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close"))
end

nvim_tree.setup({
	on_attach = my_on_attach,
	sort_by = "extension",

	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	renderer = {
		root_folder_modifier = ":t",
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	view = {
		width = 30,
		side = "left",
	},
})
