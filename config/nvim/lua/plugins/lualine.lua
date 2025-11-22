return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto", -- Tenta seguir seu colorscheme
        component_separators = '|',
        section_separators = '',
      },
    })
  end,
}
