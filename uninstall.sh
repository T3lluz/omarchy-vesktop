#!/bin/bash

# Removes everything install.sh added. Vesktop keeps working with its default theme.

systemctl --user disable --now omarchy-vesktop.service 2>/dev/null
rm -f "$HOME/.config/systemd/user/omarchy-vesktop.service" \
  "$HOME/.local/bin/omarchy-vesktop-sync" \
  "$HOME/.local/bin/omarchy-vesktop-watch" \
  "$HOME/.config/omarchy/hooks/theme-set.d/vesktop" \
  "$HOME/.config/omarchy/hooks/font-set.d/vesktop" \
  "$HOME/.config/omarchy/themed/vesktop.css.tpl" \
  "$HOME/.local/state/omarchy/current/theme/vesktop.css"
for dir in ~/.config/vesktop/themes ~/.var/app/dev.vencord.Vesktop/config/vesktop/themes ~/.config/Vencord/themes ~/.config/equibop/themes; do
  rm -f "$dir/omarchy.theme.css"
done
systemctl --user daemon-reload
