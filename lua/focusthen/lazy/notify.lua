return {
	"rcarriga/nvim-notify",
	lazy = false, -- Load early since it's used by other plugins
	priority = 100, -- Load before most plugins
	config = function()
		require("notify").setup({
			background_colour = "#000000",
		})

		vim.notify = require("notify")
	end,
}
