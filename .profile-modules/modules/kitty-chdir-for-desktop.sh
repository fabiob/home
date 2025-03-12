# only runs if we are initializing bash directly from kitty
if [[ $(pstree -s $$) == *---kitty---bash---pstree ]]; then
  # tries to extract a name from the currently selected virtual desktop
  SUBDIR="$(wmctrl -d 2>/dev/null | awk '/[0-9]+\s+\*/ { print $10 }')"
  if [[ -n $SUBDIR ]]; then
    # if it manages to extract a name and that name is a subdirectory of ~/Projects,
    # switch to that dir
    DIR="$HOME/Projects/$SUBDIR"
    [[ -d "$DIR" ]] && cd "$DIR"
  fi
fi
