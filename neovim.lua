return {
	{
		"bjarneo/aether.nvim",
		branch = "v2",
		name = "aether",
		priority = 1000,
		opts = {
			transparent = false,
			colors = {
				-- Background colors
				bg = "#232220",
				bg_dark = "#1d1c1a",
				bg_highlight = "#2e2c2a",

				-- Foreground colors
				-- fg: Object properties, builtin types, builtin variables, member access, default text
				fg = "#a9a49f",
				-- fg_dark: Inactive elements, statusline, secondary text
				fg_dark = "#8c8884",
				-- comment: Line highlight, gutter elements, disabled states
				comment = "#5c5a57",

				-- Accent colors
				-- red: Errors, diagnostics, tags, deletions, breakpoints
				red = "#cb704f",
				-- orange: Constants, numbers, current line number, git modifications
				orange = "#c87252",
				-- yellow: Types, classes, constructors, warnings, numbers, booleans
				yellow = "#bfaa48",
				-- green: Comments, strings, success states, git additions
				green = "#8a8d4c",
				-- cyan: Parameters, regex, preprocessor, hints, properties
				cyan = "#61928b",
				-- blue: Functions, keywords, directories, links, info diagnostics
				blue = "#d1b187",
				-- purple: Storage keywords, special keywords, identifiers, namespaces
				purple = "#b08c52",
				-- magenta: Function declarations, exception handling, tags
				magenta = "#b08c52",
			},
		},
		config = function(_, opts)
			require("aether").setup(opts)
			vim.cmd.colorscheme("aether")

			-- Enable hot reload
			require("aether.hotreload").setup()
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "aether",
		},
	},
}
