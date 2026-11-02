# Omarchy theme for Vesktop

A Vencord theme for [Vesktop](https://github.com/Vencord/Vesktop) that follows your [Omarchy](https://omarchy.org) setup. Switch Omarchy themes and Discord switches with it, no restart.

It takes:

- colors from the current Omarchy theme's `colors.toml`, light themes included
- corner rounding from Hyprland's `decoration:rounding`, the same value the Omarchy shell reads. 0 gives square corners, 8 gives stock Discord.
- the font from `fc-match monospace`, which is what `omarchy font set` changes

It also hides Discord's minimize, maximize and close buttons, since Hyprland handles windows. The inbox and help icons move to the right edge.

| Tokyo Night | Flexoki Light | Solitude, rounding 10 |
|---|---|---|
| ![Tokyo Night](screenshots/tokyo-night.png) | ![Flexoki Light](screenshots/flexoki-light.png) | ![Solitude](screenshots/solitude-rounded.png) |

## Install

```sh
git clone https://github.com/T3lluz/omarchy-vesktop.git
cd omarchy-vesktop
./install.sh
```

Then open Vesktop, go to Settings > Themes and turn on "Omarchy".

It also writes the theme for Flatpak Vesktop, Vencord on regular Discord, and Equibop if their config folders exist.

## What updates it

| Change | Trigger |
|---|---|
| `omarchy theme set` | `~/.config/omarchy/hooks/theme-set.d/vesktop` |
| `omarchy font set` | `~/.config/omarchy/hooks/font-set.d/vesktop` |
| Rounding changed in `looknfeel.lua` or another Hyprland config | `omarchy-vesktop.service` reruns the sync on Hyprland's `configreloaded` event |

Vencord watches its themes folder, so each rewrite shows up in a second or two.

## Settings

Optional, in `~/.config/omarchy/vesktop.conf`:

```ini
font=all       # Omarchy font everywhere (default)
# font=code    # only in code blocks
# font=none    # keep Discord's fonts
rounding=yes   # "no" keeps Discord's own corner radii
```

Run `omarchy-vesktop-sync` after editing it.

## How it works

- `vesktop.css.tpl` maps Omarchy's palette onto Discord's color variables. The installer puts it in `~/.config/omarchy/themed/`, and Omarchy renders it into the current theme on every switch. A theme that ships its own `vesktop.css` overrides it.
- `omarchy-vesktop-sync` adds rounding and font to those colors and writes `omarchy.theme.css` into the Vencord themes folders.
- `omarchy-vesktop-watch` runs as a user service and listens on Hyprland's event socket for config reloads.

The theme only sets Discord's CSS variables, plus one rule for the window buttons that matches by class prefix. Discord renames its hashed class names often, and variables survive that.

## Remove

```sh
./uninstall.sh
```

Then turn the theme off in Vesktop, or leave it. Without the file it does nothing.

## License

MIT
