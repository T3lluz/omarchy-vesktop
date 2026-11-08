/**
 * @name Omarchy
 * @author T3lluz
 * @version 2.0.0
 * @description Follows your Omarchy theme colors, Hyprland corner rounding and Omarchy font. Keeps Discord's close button.
 */

/*
 * How the colors work
 *
 * Omarchy's palette goes in as --om-* below. Everything else is derived from
 * it, so any theme, dark or light, gets the same treatment:
 *
 * - "text" variants of the accent and palette colors are pushed away from the
 *   background until they read as text. Batou's dark grey accent, for one,
 *   would otherwise disappear on its near-black background.
 * - "fill" variants are capped at OKLab lightness 0.56, about 4.5:1 against
 *   white. Discord hardcodes white text on brand, red and green fills in
 *   dozens of places, and pastel accents like Catppuccin's leave that text
 *   unreadable.
 * - Text over video, images and gradients (the stream PiP, media viewers,
 *   banners) uses Discord's own overlay colors and is never themed.
 * - Status colors stay Discord's own: presence, connection quality, Voice
 *   Connected, notification badges, notices, errors and mentions.
 */

/* Raw palette from the current Omarchy theme's colors.toml */
:root {
  --om-mode: {{ mode }};
  --om-bg: {{ background }};
  --om-bg-dark: {{ dark_background }};
  --om-bg-darker: {{ darker_background }};
  --om-fg: {{ foreground }};
  --om-accent: {{ accent }};
  --om-selection: {{ selection_background }};
  --om-red: {{ bright_red }};
  --om-green: {{ green }};
  --om-yellow: {{ yellow }};
  --om-blue: {{ blue }};
  --om-magenta: {{ magenta }};
  --om-cyan: {{ cyan }};
  --om-ansi-0: {{ color0 }};
  --om-ansi-1: {{ color1 }};
  --om-ansi-2: {{ color2 }};
  --om-ansi-3: {{ color3 }};
  --om-ansi-4: {{ color4 }};
  --om-ansi-5: {{ color5 }};
  --om-ansi-6: {{ color6 }};
  --om-ansi-7: {{ color7 }};
  --om-ansi-8: {{ color8 }};
  --om-ansi-9: {{ color9 }};
  --om-ansi-10: {{ color10 }};
  --om-ansi-11: {{ color11 }};
  --om-ansi-12: {{ color12 }};
  --om-ansi-13: {{ color13 }};
  --om-ansi-14: {{ color14 }};
  --om-ansi-15: {{ color15 }};

  /* Dark themes push text colors lighter, light themes darker. Light
     backgrounds lose contrast faster, so their quiet text tiers sit closer
     to the foreground. */
  --om-dir: 1;
  --om-floor: 0.72;
  --om-subtle-mix: 76%;
  --om-muted-mix: 62%;

  color-scheme: {{ mode }};
}
@container style(--om-mode: light) {
  body {
    --om-dir: -1;
    --om-floor: -0.5;
    --om-subtle-mix: 86%;
    --om-muted-mix: 78%;
  }
}

/* Derived colors. Mixing toward the foreground works in light and dark themes.
   Declared on the root too, so variables read from <html> resolve. */
:root,
body {
  --om-surface-1: color-mix(in oklab, var(--om-bg), var(--om-fg) 4%);
  --om-surface-2: color-mix(in oklab, var(--om-bg), var(--om-fg) 7%);
  --om-surface-3: color-mix(in oklab, var(--om-bg), var(--om-fg) 11%);
  --om-surface-4: color-mix(in oklab, var(--om-bg), var(--om-fg) 16%);

  --om-text: color-mix(in oklab, var(--om-fg) 90%, var(--om-bg));
  --om-text-subtle: color-mix(in oklab, var(--om-fg) var(--om-subtle-mix), var(--om-bg));
  --om-text-muted: color-mix(in oklab, var(--om-fg) var(--om-muted-mix), var(--om-bg));

  --om-hover: color-mix(in oklab, var(--om-fg) 6%, transparent);
  --om-active: color-mix(in oklab, var(--om-fg) 11%, transparent);
  --om-border: color-mix(in oklab, var(--om-fg) 10%, transparent);
  --om-border-strong: color-mix(in oklab, var(--om-fg) 20%, transparent);

  /* Text: lightness at least 0.72 on dark themes, at most 0.5 on light ones */
  --om-accent-text: oklch(from var(--om-accent) calc(var(--om-dir) * max(var(--om-dir) * l, var(--om-floor))) c h);
  --om-red-text: oklch(from var(--om-red) calc(var(--om-dir) * max(var(--om-dir) * l, var(--om-floor))) c h);
  --om-green-text: oklch(from var(--om-green) calc(var(--om-dir) * max(var(--om-dir) * l, var(--om-floor))) c h);
  --om-yellow-text: oklch(from var(--om-yellow) calc(var(--om-dir) * max(var(--om-dir) * l, var(--om-floor))) c h);
  --om-blue-text: oklch(from var(--om-blue) calc(var(--om-dir) * max(var(--om-dir) * l, var(--om-floor))) c h);
  --om-magenta-text: oklch(from var(--om-magenta) calc(var(--om-dir) * max(var(--om-dir) * l, var(--om-floor))) c h);
  --om-cyan-text: oklch(from var(--om-cyan) calc(var(--om-dir) * max(var(--om-dir) * l, var(--om-floor))) c h);

  /* Fills that carry white text */
  --om-accent-fill: oklch(from var(--om-accent) min(l, 0.56) c h);
  --om-accent-fill-hover: oklch(from var(--om-accent) calc(min(l, 0.56) - 0.04) c h);
  --om-accent-fill-active: oklch(from var(--om-accent) calc(min(l, 0.56) - 0.08) c h);
  --om-red-fill: oklch(from var(--om-red) min(l, 0.56) c h);
  --om-red-fill-hover: oklch(from var(--om-red) calc(min(l, 0.56) - 0.04) c h);
  --om-green-fill: oklch(from var(--om-green) min(l, 0.56) c h);
  --om-green-fill-hover: oklch(from var(--om-green) calc(min(l, 0.56) - 0.04) c h);
  /* Yellow carries dark text instead, so it stays light */

  --om-accent-soft: color-mix(in oklab, var(--om-accent) 18%, transparent);
  --om-accent-faint: color-mix(in oklab, var(--om-accent) 9%, transparent);
  --om-red-soft: color-mix(in oklab, var(--om-red) 16%, transparent);
  --om-green-soft: color-mix(in oklab, var(--om-green) 16%, transparent);
}

/* Two classes of specificity so these win over Discord's .visual-refresh.theme-* rules */
body,
.theme-dark:not(.custom-user-profile-theme),
.theme-darker:not(.custom-user-profile-theme),
.theme-midnight:not(.custom-user-profile-theme),
.theme-light:not(.custom-user-profile-theme) {
  /* Backgrounds: server list, channel list, chat, then raised surfaces */
  --background-base-lowest: var(--om-bg-darker);
  --background-base-lower: var(--om-bg-dark);
  --background-base-low: var(--om-bg);
  --background-surface-high: var(--om-surface-1);
  --background-surface-higher: var(--om-surface-2);
  --background-surface-highest: var(--om-surface-3);
  --bg-surface-raised: var(--om-surface-1);
  --app-frame-background: var(--om-bg-darker);
  --app-frame-border: var(--om-border);
  --background-accent: var(--om-surface-3);
  --background-brand: var(--om-accent-fill);
  --background-code: var(--om-bg-darker);
  --background-code-addition: color-mix(in oklab, var(--om-green) 18%, transparent);
  --background-code-deletion: color-mix(in oklab, var(--om-red) 18%, transparent);
  --background-mod-subtle: var(--om-hover);
  --background-mod-muted: var(--om-hover);
  --background-mod-normal: var(--om-active);
  --background-mod-strong: var(--om-surface-4);
  --background-secondary-alt: var(--om-bg-dark);
  --background-scrim: rgb(0 0 0 / 0.6);
  --chat-background-default: var(--om-bg);
  --home-background: var(--om-bg);
  --modal-background: var(--om-surface-1);
  --modal-footer-background: var(--om-surface-1);
  --card-background-default: var(--om-surface-1);
  --card-secondary-bg: var(--om-surface-2);
  --card-primary-pressed-bg: var(--om-surface-2);
  --card-border-default: var(--om-border);
  --embed-background: var(--om-surface-1);
  --embed-background-alternate: var(--om-surface-2);
  --input-background-default: var(--om-bg-darker);
  --channeltextarea-background: var(--om-surface-1);
  --user-profile-overlay-background: var(--om-surface-1);
  --user-profile-overlay-background-hover: var(--om-hover);
  --user-profile-toolbar-background: var(--om-surface-2);
  --user-profile-activity-toolbar-background: var(--om-surface-2);
  --user-profile-background-hover: var(--om-hover);
  --user-profile-border: var(--om-border);
  --user-profile-toolbar-border: var(--om-border);
  --user-profile-note-background-focus: var(--om-bg-darker);
  --spoiler-hidden-background: var(--om-surface-4);
  --spoiler-hidden-background-hover: var(--om-surface-3);
  --spoiler-revealed-background: var(--om-surface-2);
  --datepicker-range-background-default: var(--om-accent-soft);
  --datepicker-range-background-hover: var(--om-accent-soft);

  /* Names Discord dropped but Vencord's own CSS still reads */
  --background-modifier-hover: var(--om-hover);
  --interactive-hover: var(--om-text);
  --brand-experiment: var(--om-accent-fill);
  --channels-default: var(--om-text-subtle);
  --channel-icon: var(--om-text-subtle);

  /* Text */
  --text-strong: var(--om-fg);
  --text-default: var(--om-text);
  --text-subtle: var(--om-text-subtle);
  --text-muted: var(--om-text-muted);
  --text-brand: var(--om-accent-text);
  --text-link: var(--om-accent-text);
  --text-invert: var(--om-bg);
  --text-code: var(--om-text);
  --chat-text-muted: var(--om-text-muted);
  --channel-text-area-placeholder: var(--om-text-muted);
  --input-placeholder-text-default: var(--om-text-muted);
  --input-text-default: var(--om-text);
  --input-text-error-default: var(--om-text);
  --textbox-markdown-syntax: var(--om-text-muted);
  --app-message-embed-secondary-text: var(--om-text-subtle);

  /* Icons */
  --icon-strong: var(--om-fg);
  --icon-default: var(--om-text-subtle);
  --icon-subtle: var(--om-text-subtle);
  --icon-muted: var(--om-text-muted);
  --icon-brand: var(--om-accent-text);
  --icon-link: var(--om-accent-text);
  --icon-invert: var(--om-bg);

  /* Interactive rows: channels, members, menu items */
  --interactive-background-hover: var(--om-hover);
  --interactive-background-active: var(--om-active);
  --interactive-background-selected: var(--om-active);
  --interactive-text-default: var(--om-text-subtle);
  --interactive-text-hover: var(--om-text);
  --interactive-text-active: var(--om-fg);
  --interactive-icon-default: var(--om-text-subtle);
  --interactive-icon-hover: var(--om-text);
  --interactive-icon-active: var(--om-fg);
  --interactive-muted: var(--om-text-muted);

  /* Borders */
  --border-subtle: var(--om-border);
  --border-muted: var(--om-border);
  --border-normal: var(--om-border);
  --border-strong: var(--om-border-strong);
  --border-focus: var(--om-accent-text);
  --input-border-default: var(--om-border);
  --input-border-hover: var(--om-border-strong);
  --input-border-active: var(--om-accent-text);
  --input-border-readonly: var(--om-border);

  /* Buttons */
  --control-primary-background-default: var(--om-accent-fill);
  --control-primary-background-hover: var(--om-accent-fill-hover);
  --control-primary-background-active: var(--om-accent-fill-active);
  --control-primary-text-default: #fff;
  --control-primary-text-hover: #fff;
  --control-primary-text-active: #fff;
  --control-primary-icon-default: #fff;
  --control-primary-icon-hover: #fff;
  --control-primary-icon-active: #fff;
  --control-primary-border-default: transparent;
  --control-primary-border-hover: transparent;
  --control-primary-border-active: transparent;
  --control-secondary-background-default: var(--om-surface-2);
  --control-secondary-background-hover: var(--om-surface-3);
  --control-secondary-background-active: var(--om-surface-4);
  --control-secondary-text-default: var(--om-text);
  --control-secondary-text-hover: var(--om-fg);
  --control-secondary-text-active: var(--om-fg);
  --control-secondary-icon-default: var(--om-text);
  --control-secondary-icon-hover: var(--om-fg);
  --control-secondary-icon-active: var(--om-fg);
  --control-secondary-border-default: var(--om-border);
  --control-secondary-border-hover: var(--om-border-strong);
  --control-secondary-border-active: var(--om-border-strong);
  --control-critical-primary-background-default: var(--om-red-fill);
  --control-critical-primary-background-hover: var(--om-red-fill-hover);
  --control-critical-primary-background-active: var(--om-red-fill-hover);
  --control-critical-primary-text-default: #fff;
  --control-critical-primary-text-hover: #fff;
  --control-critical-primary-text-active: #fff;
  --control-critical-primary-icon-default: #fff;
  --control-critical-primary-icon-hover: #fff;
  --control-critical-primary-icon-active: #fff;
  --control-critical-primary-border-default: transparent;
  --control-critical-primary-border-hover: transparent;
  --control-critical-primary-border-active: transparent;
  --control-critical-secondary-background-default: var(--om-surface-2);
  --control-critical-secondary-background-hover: var(--om-red-soft);
  --control-critical-secondary-background-active: var(--om-red-soft);
  --control-critical-secondary-text-default: var(--om-red-text);
  --control-critical-secondary-text-hover: var(--om-red-text);
  --control-critical-secondary-text-active: var(--om-red-text);
  --control-critical-secondary-icon-default: var(--om-red-text);
  --control-critical-secondary-icon-hover: var(--om-red-text);
  --control-critical-secondary-icon-active: var(--om-red-text);
  --control-critical-secondary-border-default: var(--om-border);
  --control-critical-secondary-border-hover: var(--om-border);
  --control-critical-secondary-border-active: var(--om-border);
  --control-connected-background-default: var(--om-green-fill);
  --control-connected-background-hover: var(--om-green-fill-hover);
  --control-connected-background-active: var(--om-green-fill-hover);
  --control-connected-text-default: #fff;
  --control-connected-text-hover: #fff;
  --control-connected-text-active: #fff;
  --control-connected-border-default: transparent;
  --control-connected-border-hover: transparent;
  --control-connected-border-active: transparent;
  --control-icon-only-background-hover: var(--om-hover);
  --control-icon-only-background-active: var(--om-active);
  --control-icon-only-icon-default: var(--om-text-subtle);
  --control-icon-only-icon-hover: var(--om-text);
  --control-icon-only-icon-active: var(--om-fg);
  --control-icon-only-border-hover: transparent;
  --control-icon-only-border-active: transparent;
  --control-brand-foreground: var(--om-accent-text);
  --control-brand-foreground-new: var(--om-accent-text);
  --button-outline-primary-text: var(--om-text);
  --button-outline-brand-background-hover: var(--om-accent-fill);
  --button-outline-brand-border-active: var(--om-accent-fill-active);
  --togglebutton-background-selected: var(--om-accent-soft);
  --togglebutton-background-selected-hover: var(--om-accent-soft);
  --togglebutton-background-selected-active: var(--om-accent-soft);
  --togglebutton-border-selected: var(--om-accent-text);

  /* Toggles, checkboxes, radios, sliders */
  --checkbox-background-default: var(--om-surface-2);
  --checkbox-background-hover: var(--om-surface-3);
  --checkbox-background-selected-default: var(--om-accent-fill);
  --checkbox-background-selected-hover: var(--om-accent-fill-hover);
  --checkbox-border-default: var(--om-border-strong);
  --checkbox-border-hover: var(--om-border-strong);
  --checkbox-border-selected-default: var(--om-accent-fill);
  --checkbox-border-selected-hover: var(--om-accent-fill-hover);
  --checkbox-icon-active: #fff;
  --radio-background-default: var(--om-surface-2);
  --radio-background-hover: var(--om-surface-3);
  --radio-background-selected-default: var(--om-accent-fill);
  --radio-background-selected-hover: var(--om-accent-fill-hover);
  --radio-border-default: var(--om-border-strong);
  --radio-border-hover: var(--om-border-strong);
  --radio-border-selected-default: var(--om-accent-fill);
  --radio-border-selected-hover: var(--om-accent-fill-hover);
  --radio-thumb-background-active: #fff;
  --slider-track-background: var(--om-surface-3);
  --progressbar-track-background: var(--om-surface-3);
  --progressbar-indicator-background: var(--om-accent-fill);
  --tabs-indicator-default: var(--om-accent-text);

  /* Messages, mentions, reactions */
  --message-background-hover: color-mix(in oklab, var(--om-fg) 3%, transparent);
  --message-highlight-background-default: var(--om-accent-faint);
  --message-highlight-background-hover: var(--om-accent-soft);
  --mention-background: var(--om-accent-soft);
  --mention-foreground: var(--om-accent-text);
  --reaction-background-default: var(--om-surface-1);
  --reaction-background-hover: var(--om-surface-2);
  --reaction-background-active: var(--om-surface-3);
  --reaction-background-reacted-default: var(--om-accent-soft);
  --reaction-background-reacted-hover: var(--om-accent-soft);
  --reaction-border-default: var(--om-border);
  --reaction-border-hover: var(--om-border-strong);
  --reaction-border-active: var(--om-border-strong);
  --reaction-border-reacted-default: var(--om-accent-text);
  --reaction-text-default: var(--om-text-subtle);
  --reaction-text-hover: var(--om-text);
  --reaction-text-active: var(--om-fg);
  --reaction-text-reacted-default: var(--om-fg);
  --polls-voted-fill: var(--om-accent-soft);
  --polls-victor-fill: var(--om-green-soft);
  --spine-default: var(--om-border-strong);

  /* Badges. Status colors (presence, connection quality, Voice Connected,
     notification badges, notices, errors, mentions) are left to Discord:
     they carry meaning, and a theme's green or red can be a shade of grey. */
  --badge-background-default: var(--om-accent-fill);
  --badge-text-default: #fff;
  --badge-primary-background: var(--om-accent-fill);
  --badge-primary-text: #fff;
  --badge-primary-border: transparent;
  --badge-secondary-background: var(--om-active);
  --badge-secondary-text: var(--om-fg);
  --badge-secondary-border: transparent;

  /* Code blocks: syntax colors from the theme, ANSI from the terminal palette */
  --text-code-comment: var(--om-text-muted);
  --text-code-keyword: var(--om-magenta-text);
  --text-code-type: var(--om-cyan-text);
  --text-code-title: var(--om-blue-text);
  --text-code-variable: var(--om-text);
  --text-code-attribute: var(--om-cyan-text);
  --text-code-property: var(--om-cyan-text);
  --text-code-decorator: var(--om-yellow-text);
  --text-code-number: var(--om-yellow-text);
  --text-code-builtin: var(--om-yellow-text);
  --text-code-operator: var(--om-text-subtle);
  --text-code-string: var(--om-green-text);
  --text-code-regexp: var(--om-green-text);
  --text-code-tag: var(--om-red-text);
  --text-code-section: var(--om-blue-text);
  --text-code-bullet: var(--om-accent-text);
  --text-code-link: var(--om-accent-text);
  --text-code-namespace: var(--om-blue-text);
  --text-code-escape: var(--om-magenta-text);
  --text-code-error: var(--om-red-text);
  --text-code-addition: var(--om-green-text);
  --text-code-deletion: var(--om-red-text);
  --ansi-black: var(--om-ansi-0);
  --ansi-red: var(--om-ansi-1);
  --ansi-green: var(--om-ansi-2);
  --ansi-yellow: var(--om-ansi-3);
  --ansi-blue: var(--om-ansi-4);
  --ansi-magenta: var(--om-ansi-5);
  --ansi-cyan: var(--om-ansi-6);
  --ansi-white: var(--om-ansi-7);
  --ansi-bright-black: var(--om-ansi-8);
  --ansi-bright-red: var(--om-ansi-9);
  --ansi-bright-green: var(--om-ansi-10);
  --ansi-bright-yellow: var(--om-ansi-11);
  --ansi-bright-blue: var(--om-ansi-12);
  --ansi-bright-magenta: var(--om-ansi-13);
  --ansi-bright-cyan: var(--om-ansi-14);
  --ansi-bright-white: var(--om-ansi-15);

  /* Flat like Hyprland: floating layers get a 1px edge instead of a blurred
     shadow, which is also cheaper to paint. */
  --shadow-border: 0 0 0 1px var(--om-border);
  --shadow-low: 0 0 0 1px var(--om-border);
  --shadow-low-hover: 0 0 0 1px var(--om-border-strong);
  --shadow-low-active: 0 0 0 1px var(--om-border-strong);
  --shadow-medium: 0 0 0 1px var(--om-border-strong);
  --shadow-high: 0 0 0 1px var(--om-border-strong);
  --shadow-ledge: none;
  --shadow-top-ledge: none;
  --shadow-top-low: none;
  --shadow-top-high: none;
  --shadow-button-overlay: none;
  --elevation-stroke: 0 0 0 1px var(--om-border);
  --elevation-low: 0 0 0 1px var(--om-border);
  --elevation-medium: 0 0 0 1px var(--om-border-strong);
  --elevation-high: 0 0 0 1px var(--om-border-strong);

  /* Scrollbars */
  --scrollbar-auto-thumb: var(--om-surface-4);
  --scrollbar-auto-track: transparent;
  --scrollbar-auto-scrollbar-color-thumb: var(--om-surface-4);
  --scrollbar-auto-scrollbar-color-track: transparent;
  --scrollbar-thin-thumb: var(--om-surface-4);
  --scrollbar-thin-track: transparent;

  /* Raw palette slots that older UI and some Vencord plugins read directly.
     Discord pairs these with white text. */
  --brand-260: var(--om-accent-text);
  --brand-360: var(--om-accent-text);
  --brand-500: var(--om-accent-fill);
  --brand-560: var(--om-accent-fill-hover);
  --brand-600: var(--om-accent-fill-active);
  --blurple-50: var(--om-accent-fill);
}

/* Set on the root only. Descendants inherit highlight styles, and a bare
   ::selection rule would be checked against every element in the app. */
:root::selection {
  background-color: var(--om-selection);
}

/* Discord's switches paint their color inline from JavaScript, so variables
   can't reach them. Off is translucent black, so anything else is on, pressed
   or mid-animation and gets the accent. Hover keeps its own shade. */
[data-mana-component="switch"]:not([style*="rgba(0, 0, 0"]) {
  background-color: var(--om-accent-fill) !important;
}
[data-mana-component="switch"][style*="68, 82, 187"] {
  background-color: var(--om-accent-fill-hover) !important;
}

/* Hyprland manages windows, so keep only Discord's close button, at the top
   right. Each selector matches one element by its own class prefix, which
   survives Discord's hash renames. A child or descendant combinator here
   would make Chrome recheck children on every class change in the app. */
[class*="winButtons_"] {
  width: auto !important;
  min-width: 0 !important;
  overflow: visible !important;
  visibility: visible !important;
  pointer-events: auto !important;
}
[class*="winButtonMinMax_"] {
  display: none !important;
}
[class*="winButtonsWithDivider_"]::before {
  display: none !important;
}
