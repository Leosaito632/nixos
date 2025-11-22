{ pkgs, ... }:
pkgs.writeShellScriptBin "quicknote" ''
  NOTE_FILE="$HOME/Documents/quicknote.md"
  mkdir -p "$(dirname "$NOTE_FILE")"

  # Se o arquivo não existir, cria
  touch "$NOTE_FILE"

  # Abre o 'foot' com um título e ID específicos rodando o nvim
  # --app-id é crucial para a regra do Hyprland funcionar
  ${pkgs.foot}/bin/foot --app-id="quicknote_float" --title="QuickNote" -W "800x500" -e nvim "$NOTE_FILE"
''
