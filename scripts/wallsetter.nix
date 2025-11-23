{ pkgs, ... }:

pkgs.writeShellScriptBin "wallsetter" ''
  TIMEOUT=600

  for pid in $(pidof -o %PPID -x wallsetter); do
      kill $pid
  done

  if ! [ -d ~/Pictures/Wallpapers ]; then 
      notify-send -u critical "Erro Wallsetter" "~/Pictures/Wallpapers não encontrado" && exit 1
  fi

  while true; do
      WALLPAPER=$(find -L ~/Pictures/Wallpapers -type f -iregex ".*\.\(jpg\|jpeg\|png\)" | shuf -n 1)

      if [ -z "$WALLPAPER" ]; then
          notify-send "Wallsetter" "Nenhuma imagem encontrada em ~/Pictures/Wallpapers"
          continue
      fi

      if [ "$WALLPAPER" == "$PREVIOUS" ] && [ $(ls -1 ~/Pictures/Wallpapers | wc -l) -gt 1 ]; then
          continue
      fi

      PREVIOUS=$WALLPAPER

      ${pkgs.imagemagick}/bin/magick "$WALLPAPER" ~/.cache/current_wallpaper.png
      ${pkgs.swww}/bin/swww img "$WALLPAPER" --transition-type random --transition-step 10 --transition-fps 60
      
      sleep $TIMEOUT
  done
''
