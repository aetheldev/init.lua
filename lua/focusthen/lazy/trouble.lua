return {
	{
		"folke/trouble.nvim",
		keys = {
			{ "<leader>tt", desc = "Toggle Trouble diagnostics" },
			{ "[t", desc = "Previous Trouble item" },
			{ "]t", desc = "Next Trouble item" },
		},
		config = function()
			require("trouble").setup({
				icons = {},
			})

		vim.keymap.set("n", "<leader>tt", function()
			require("trouble").toggle("diagnostics")
		end)

		vim.keymap.set("n", "[t", function()
			require("trouble").prev({ skip_groups = true, jump = true })
		end)

		vim.keymap.set("n", "]t", function()
			require("trouble").next({ skip_groups = true, jump = true })
		end)
		end,
	},
}
