{ pkgs, ... }:
let
  script = pkgs.writeShellScriptBin "quicknote" ''
    # Define caminhos
    NOTE_DIR="$HOME/repos/notes"
    NOTE_FILE="$NOTE_DIR/quicknote.md"
    APP_ID="quicknote_float"
    LOCK_FILE="/tmp/quicknote.lock"

    if hyprctl activewindow | grep -q "class: $APP_ID"; then
        hyprctl dispatch togglespecialworkspace quicknote
        exit 0
    fi

    if hyprctl clients | grep -q "$APP_ID"; then
      hyprctl dispatch togglespecialworkspace quicknote
      sleep 0.1
      hyprctl dispatch centerwindow
      exit 0
    fi

    if [ -f "$LOCK_FILE" ]; then
        exit 0
    fi

    touch "$LOCK_FILE"
    trap "rm -f $LOCK_FILE" EXIT

    if [ ! -d "$NOTE_DIR/.git" ]; then
      mkdir -p "$(dirname "$NOTE_DIR")"
      git clone https://github.com/Leosaito632/notes.git "$NOTE_DIR"
    fi

    if [ ! -f "$NOTE_FILE" ]; then
      touch "$NOTE_FILE"
    fi

    sync_pull() {
      cd "$NOTE_DIR" || exit
      git pull --rebase --autostash > /dev/null 2>&1
    }

    sync_push() {
      cd "$NOTE_DIR" || exit
      if [ -n "$(git status --porcelain)" ]; then
        git add .
        git commit -m "Auto-save: $(date '+%Y-%m-%d %H:%M')"
        git push > /dev/null 2>&1
      fi
    }

    sync_pull
    ${pkgs.foot}/bin/foot --app-id="$APP_ID" --title="QuickNote" -e nvim "$NOTE_FILE"
    sync_push
  '';

  # Coloca um ícone
  desktopItem = pkgs.makeDesktopItem {
    name = "quicknote";
    desktopName = "QuickNote";
    exec = "quicknote";
    icon = "foot";
    startupWMClass = "quicknote_float";
    categories = [
      "Utility"
      "TextEditor"
    ];
  };

in

pkgs.symlinkJoin {
  name = "quicknote";
  paths = [
    script
    desktopItem
  ];
}
