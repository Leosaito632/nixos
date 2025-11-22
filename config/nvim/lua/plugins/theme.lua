return {
	lazy = false,

	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	--"EdenEast/nightfox.nvim",
	-- priority = 1000,
	--
	config = function()
		vim.cmd("catppuccin-mocha")
	end,
}
