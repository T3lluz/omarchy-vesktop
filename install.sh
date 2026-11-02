#!/bin/bash

# Installs the Omarchy theme for Vesktop. Run it again after editing any file here.

set -euo pipefail
cd "$(dirname "$0")"

install -Dm644 vesktop.css.tpl "$HOME/.config/omarchy/themed/vesktop.css.tpl"
install -Dm755 omarchy-vesktop-sync "$HOME/.local/bin/omarchy-vesktop-sync"
install -Dm755 omarchy-vesktop-watch "$HOME/.local/bin/omarchy-vesktop-watch"
install -Dm755 hook "$HOME/.config/omarchy/hooks/theme-set.d/vesktop"
install -Dm755 hook "$HOME/.config/omarchy/hooks/font-set.d/vesktop"
install -Dm644 omarchy-vesktop.service "$HOME/.config/systemd/user/omarchy-vesktop.service"

# Omarchy only renders templates on the next theme switch, so render the current
# theme's colors now. The sync script falls back to the template on its own,
# but writing vesktop.css keeps the current theme looking like a switched one.
theme="$HOME/.local/state/omarchy/current/theme"
if [[ -f $theme/colors.toml ]]; then
  omarchy-theme-color --file "$theme/colors.toml" --all |
    while IFS=$'\t' read -r key value; do printf 's|{{ %s }}|%s|g\n' "$key" "$value"; done |
    sed -f - vesktop.css.tpl >"$theme/vesktop.css"
fi

systemctl --user daemon-reload
systemctl --user enable --now omarchy-vesktop.service
systemctl --user restart omarchy-vesktop.service

"$HOME/.local/bin/omarchy-vesktop-sync"

echo "Installed. In Vesktop open Settings > Themes and turn on \"Omarchy\"."
