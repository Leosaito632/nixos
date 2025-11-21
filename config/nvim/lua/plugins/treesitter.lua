
return {
  "nvim-treesitter/nvim-treesitter",
  -- Comando para instalar e atualizar os "parsers" (as gramáticas das linguagens)
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup({
      -- Lista de linguagens para instalar os parsers.
      -- Comece com estas, você pode adicionar mais depois (ex: "javascript", "html")
      ensure_installed = { "python", "lua", "vim", "vimdoc" },

      -- Instala parsers automaticamente para linguagens que você abrir (requer 'git' e um compilador C)
      auto_install = true,

      -- O mais importante: HABILITA o módulo de highlighting
      highlight = {
        enable = true,
      },
    })
  end,
}

