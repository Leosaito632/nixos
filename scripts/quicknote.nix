{ pkgs, ... }:
pkgs.writeShellScriptBin "quicknote" ''
    # Define caminhos
    NOTE_DIR="$HOME/repos/notes"
    NOTE_FILE="$NOTE_DIR/quicknote.md"
    APP_ID="quicknote_float"

    # Lógica de Clone
    if [ ! -d "$NOTE_DIR/.git" ]; then
        # Cria o diretório pai se necessário (ex: ~/repos)
        mkdir -p "$(dirname "$NOTE_DIR")"
        # Clona
        git clone https://github.com/Leosaito632/notes.git "$NOTE_DIR"
    fi
    
    # Garante que o arquivo existe (caso o repo tenha sido clonado vazio)
    if [ ! -f "$NOTE_FILE" ]; then
        touch "$NOTE_FILE"
    fi

    sync_pull() {
        cd "$NOTE_DIR" || exit
        # Redireciona output para não sujar o terminal, mas espera completar
        git pull --rebase --autostash > /dev/null 2>&1
    }

    sync_push() {
        cd "$NOTE_DIR" || exit
        # Verifica se houve mudança antes de tentar commitar
        if [ -n "$(git status --porcelain)" ]; then
            git add .
            git commit -m "Auto-save: $(date '+%Y-%m-%d %H:%M')"
            git push > /dev/null 2>&1
        fi
    }

  # --- LÓGICA DE JANELA ---

    if hyprctl clients | grep -q "$APP_ID"; then
        # Alterna visibilidade (scratchpad)
        hyprctl dispatch togglespecialworkspace quicknote
    else
        # Abre a nota
        sync_pull
        
        # Abre o terminal (Foot)
        # O script vai PAUSAR nesta linha até você fechar a janela do Foot
        ${pkgs.foot}/bin/foot --app-id="$APP_ID" --title="QuickNote" -W "800x500" -e nvim "$NOTE_FILE"
        
        # Assim que você fechar a janela, esta linha roda:
        sync_push
    fi
''
