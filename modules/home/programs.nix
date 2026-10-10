{
  lib,
  pkgs,
  inputs,
  config,
  hostName,
  ...
}:
let
  uniqueApps =
    if hostName == "desktop" then
      with pkgs;
      [
        osu-lazer
        spotify
        prismlauncher
        discord
        orca-slicer
        stoat-desktop
        pkgsRocm.blender
        claude-code
      ]
    else
      with pkgs;
      [
        power-profiles-daemon
        blender
      ];
in
{
  imports = [
    inputs.zen-browser.homeModules.twilight
    inputs.nix4nvchad.homeManagerModules.default
  ]; # Browsers
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
  };
  programs.zen-browser.enable = true;
  programs.chromium.enable = true;

  # CLI
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

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "y";
  };

  programs.git = {
    enable = true;
    settings = {
      init = {
        defaultBranch = "main";
      };
      user = {
        name = "Leonardo Saito";
        email = "leosaito632@gmail.com";
      };
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };

  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-toolsai.jupyter
    ];
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  home.packages =
    with pkgs;
    [
      # Gera Gerall
      # --- Dev Tools ---
      gcc
      cargo
      nodejs
      zed-editor
      gnumake
      unzip
      ripgrep
      fd
      lua
      jetbrains.rider
      # jetbrains.clion
      javaPackages.compiler.openjdk21
      python3
      glib

      # --- Formatters / LSP / Type checker ---
      stylua
      shfmt
      nixfmt
      nixd
      pyright
      black
      prettier
      tree-sitter

      # --- CLI Utils ---
      wget
      microfetch
      (btop.override { rocmSupport = true; })
      xclip
      csvlens
      bitwarden-cli
      tree
      grc
      bat

      # --- Desktop Apps ---
      whatsie
      libreoffice-qt-stable
      nautilus
      pinta
      # mendeley
      loupe
      krita

      # --- Networking ---
      # openfortivpn
      # openfortivpn-webview

      # --- Hyprland Core ---
      # hyprland
      hypridle
      hyprpicker
      hyprshot

      # --- System Utilities ---
      kdePackages.qtwayland
      kdePackages.qt6ct
      wl-clipboard
      libnotify
      pavucontrol
      networkmanagerapplet
      killall
      gparted
      gpu-screen-recorder

      # --- Fonts ---
      nerd-fonts.jetbrains-mono

      # --- Custom Scripts ---
      (import ../../scripts/quicknote.nix { inherit pkgs; })
      (import ../../scripts/toggle_monitor.nix { inherit pkgs; })
    ]
    ++ uniqueApps;
}
