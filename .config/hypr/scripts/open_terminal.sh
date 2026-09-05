#!/usr/bin/env bash

SPECIAL_NAME="terminal"
SPECIAL_FULL="special:terminal"
CLASS="com.mitchellh.ghostty"

# Get the focused monitor
monitor=$(hyprctl -j monitors | jq '.[] | select(.focused == true)')
current_special=$(echo "$monitor" | jq -r '.specialWorkspace.name // empty')

# If already in the special workspace → toggle out and stop
if [[ "$current_special" == "$SPECIAL_FULL" ]]; then
    hyprctl dispatch "hl.dsp.workspace.toggle_special(\"$SPECIAL_NAME\")"
    exit 0
fi

# Toggle into the special workspace
hyprctl dispatch "hl.dsp.workspace.toggle_special(\"$SPECIAL_NAME\")"

# Check if Ghostty already exists (anywhere)
if hyprctl -j clients | jq -e \
    ".[] | select(
        .initialClass == \"$CLASS\"
        and (.workspace.name == \"$SPECIAL_FULL\" or .workspace.name == \"$SPECIAL_NAME\")
    )" \
    >/dev/null; then
        :
else
    # Spawn Ghostty into the special workspace
    hyprctl dispatch "hl.dsp.exec_cmd('ghostty', { workspace = \"$SPECIAL_FULL\" })"
fi
