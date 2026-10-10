{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.nix4nvchad.homeManagerModules.default
  ];

  programs.zed-editor = {
    enable = true;
  };

  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-toolsai.jupyter
    ];
  };

  programs.nvchad = {
    enable = true;
    chadrcConfig = ''
      local M = {}
      M.base46 = {
        theme = "gruvbox",
      }
      return M
    '';
    extraConfig = ''
      local autocmd = vim.api.nvim_create_autocmd
      autocmd("BufEnter", {
         callback = function()
            if vim.api.nvim_buf_get_option(0, "buftype") ~= "terminal" then
               vim.cmd "lcd %:p:h"
            end
         end,
      })
      require("nvim-treesitter").install { "python", "lua", "vim", "vimdoc", "nix" }
    '';
    extraPlugins = ''
      return {
        {
          "neovim/nvim-lspconfig",
          config = function()
            require "configs.lspconfig"

            local flake = '(builtins.getFlake "${config.home.homeDirectory}/.dotfiles")'
            local nixos = flake .. ".nixosConfigurations." .. vim.uv.os_gethostname()
            vim.lsp.config("nixd", {
              settings = {
                nixd = {
                  nixpkgs = { expr = "import " .. flake .. ".inputs.nixpkgs { }" },
                  options = {
                    nixos = { expr = nixos .. ".options" },
                    ["home-manager"] = {
                      expr = nixos .. ".options.home-manager.users.type.getSubOptions []",
                    },
                  },
                },
              },
            })

            vim.lsp.enable { "nixd", "pyright" }
          end,
        },
        {
          "stevearc/conform.nvim",
          event = { "BufWritePre" },
          cmd = { "ConformInfo" },
          opts = {
            formatters_by_ft = {
              lua = { "stylua" },
              python = { "black" },
              javascript = { "prettier" },
              typescript = { "prettier" },
              javascriptreact = { "prettier" },
              typescriptreact = { "prettier" },
              html = { "prettier" },
              css = { "prettier" },
              json = { "prettier" },
              jsonc = { "prettier" },
              nix = { "nixfmt" },
              sh = { "shfmt" },
              bash = { "shfmt" },
            },
            format_on_save = {
              timeout_ms = 500,
              lsp_fallback = true,
            },
          },
        },
      }
    '';
  };

}
