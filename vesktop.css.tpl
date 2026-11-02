/**
 * @name Omarchy
 * @author T3lluz
 * @version 1.0.1
 * @description Follows your Omarchy theme colors, Hyprland corner rounding and Omarchy font. Keeps Discord's close button.
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
  --om-muted: {{ muted }};
  --om-red: {{ bright_red }};
  --om-green: {{ green }};
  --om-yellow: {{ yellow }};
  --om-blue: {{ blue }};
  --om-magenta: {{ magenta }};
  --om-cyan: {{ cyan }};

  /* Derived shades. Mixing toward the foreground works in light and dark themes. */
  --om-surface-1: color-mix(in oklab, var(--om-bg), var(--om-fg) 4%);
  --om-surface-2: color-mix(in oklab, var(--om-bg), var(--om-fg) 7%);
  --om-surface-3: color-mix(in oklab, var(--om-bg), var(--om-fg) 11%);
  --om-surface-4: color-mix(in oklab, var(--om-bg), var(--om-fg) 16%);

  --om-text-strong: var(--om-fg);
  --om-text: color-mix(in oklab, var(--om-fg) 88%, var(--om-bg));
  --om-text-subtle: color-mix(in oklab, var(--om-fg) 68%, var(--om-bg));
  --om-text-muted: color-mix(in oklab, var(--om-fg) 48%, var(--om-bg));
  --om-on-accent: var(--om-bg);

  --om-hover: color-mix(in oklab, var(--om-fg) 6%, transparent);
  --om-active: color-mix(in oklab, var(--om-fg) 11%, transparent);
  --om-border: color-mix(in oklab, var(--om-fg) 10%, transparent);
  --om-border-strong: color-mix(in oklab, var(--om-fg) 18%, transparent);

  --om-accent-hover: color-mix(in oklab, var(--om-accent), var(--om-fg) 15%);
  --om-accent-active: color-mix(in oklab, var(--om-accent), var(--om-bg) 15%);
  --om-accent-soft: color-mix(in oklab, var(--om-accent) 16%, transparent);
  --om-accent-faint: color-mix(in oklab, var(--om-accent) 8%, transparent);
  --om-red-hover: color-mix(in oklab, var(--om-red), var(--om-fg) 15%);
  --om-red-soft: color-mix(in oklab, var(--om-red) 16%, transparent);
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
  --bg-surface-overlay-tmp: var(--om-surface-2);
  --app-frame-background: var(--om-bg-darker);
  --app-frame-border: var(--om-border);
  --background-accent: var(--om-surface-3);
  --background-brand: var(--om-accent);
  --background-code: var(--om-bg-darker);
  --background-code-addition: color-mix(in oklab, var(--om-green) 18%, transparent);
  --background-code-deletion: color-mix(in oklab, var(--om-red) 18%, transparent);
  --background-feedback-critical: var(--om-red-soft);
  --background-feedback-info: color-mix(in oklab, var(--om-blue) 16%, transparent);
  --background-feedback-positive: color-mix(in oklab, var(--om-green) 16%, transparent);
  --background-feedback-warning: color-mix(in oklab, var(--om-yellow) 16%, transparent);
  --background-feedback-notification: var(--om-red);
  --background-mod-subtle: var(--om-hover);
  --background-mod-muted: var(--om-hover);
  --background-mod-normal: var(--om-active);
  --background-mod-strong: var(--om-surface-4);
  --background-secondary-alt: var(--om-bg-dark);
  --background-scrim: color-mix(in oklab, var(--om-bg-darker) 75%, transparent);
  --chat-background-default: var(--om-bg);
  --home-background: var(--om-bg);
  --modal-background: var(--om-surface-1);
  --modal-footer-background: var(--om-surface-1);
  --card-background-default: var(--om-surface-1);
  --card-secondary-bg: var(--om-surface-2);
  --embed-background: var(--om-surface-1);
  --embed-background-alternate: var(--om-surface-2);
  --input-background-default: var(--om-bg-darker);
  --channeltextarea-background: var(--om-surface-1);
  --user-profile-overlay-background: var(--om-surface-1);
  --user-profile-overlay-background-hover: var(--om-hover);
  --user-profile-toolbar-background: var(--om-surface-2);
  --user-profile-background-hover: var(--om-hover);
  --user-profile-border: var(--om-border);
  --user-profile-toolbar-border: var(--om-border);
  --user-profile-note-background-focus: var(--om-bg-darker);

  /* Names Discord dropped but Vencord's own CSS still reads */
  --background-modifier-hover: var(--om-hover);
  --interactive-hover: var(--om-text);
  --brand-experiment: var(--om-accent);
  --channels-default: var(--om-text-subtle);
  --channel-icon: var(--om-text-subtle);

  /* Text */
  --text-strong: var(--om-text-strong);
  --text-default: var(--om-text);
  --text-subtle: var(--om-text-subtle);
  --text-muted: var(--om-text-muted);
  --text-brand: var(--om-accent);
  --text-link: var(--om-accent);
  --text-invert: var(--om-bg);
  --text-overlay-light: var(--om-on-accent);
  --text-feedback-critical: var(--om-red);
  --text-feedback-positive: var(--om-green);
  --text-feedback-warning: var(--om-yellow);
  --text-feedback-info: var(--om-blue);
  --text-status-online: var(--om-green);
  --text-status-idle: var(--om-yellow);
  --text-status-dnd: var(--om-red);
  --text-status-offline: var(--om-text-muted);
  --chat-text-muted: var(--om-text-muted);
  --channel-text-area-placeholder: var(--om-text-muted);
  --input-placeholder-text-default: var(--om-text-muted);
  --input-text-default: var(--om-text);
  --textbox-markdown-syntax: var(--om-text-muted);
  --app-message-embed-secondary-text: var(--om-text-subtle);

  /* Icons */
  --icon-strong: var(--om-text-strong);
  --icon-default: var(--om-text-subtle);
  --icon-subtle: var(--om-text-subtle);
  --icon-muted: var(--om-text-muted);
  --icon-link: var(--om-accent);
  --icon-feedback-critical: var(--om-red);
  --icon-feedback-positive: var(--om-green);
  --icon-feedback-warning: var(--om-yellow);
  --icon-feedback-info: var(--om-blue);
  --icon-voice-muted: var(--om-red);
  --icon-status-online: var(--om-green);
  --icon-status-idle: var(--om-yellow);
  --icon-status-dnd: var(--om-red);
  --icon-status-offline: var(--om-text-muted);

  /* Interactive rows: channels, members, menu items */
  --interactive-background-hover: var(--om-hover);
  --interactive-background-active: var(--om-active);
  --interactive-background-selected: var(--om-active);
  --interactive-text-default: var(--om-text-subtle);
  --interactive-text-hover: var(--om-text);
  --interactive-text-active: var(--om-text-strong);
  --interactive-icon-default: var(--om-text-subtle);
  --interactive-icon-hover: var(--om-text);
  --interactive-icon-active: var(--om-text-strong);
  --interactive-muted: var(--om-text-muted);

  /* Borders */
  --border-subtle: var(--om-border);
  --border-muted: var(--om-border);
  --border-normal: var(--om-border);
  --border-strong: var(--om-border-strong);
  --border-focus: var(--om-accent);
  --border-feedback-critical: var(--om-red);
  --input-border-default: var(--om-border);
  --input-border-hover: var(--om-border-strong);
  --input-border-active: var(--om-accent);
  --input-border-error-default: var(--om-red);

  /* Buttons */
  --control-primary-background-default: var(--om-accent);
  --control-primary-background-hover: var(--om-accent-hover);
  --control-primary-background-active: var(--om-accent-active);
  --control-primary-text-default: var(--om-on-accent);
  --control-primary-text-hover: var(--om-on-accent);
  --control-primary-text-active: var(--om-on-accent);
  --control-primary-icon-default: var(--om-on-accent);
  --control-primary-icon-hover: var(--om-on-accent);
  --control-primary-icon-active: var(--om-on-accent);
  --control-primary-border-default: transparent;
  --control-primary-border-hover: transparent;
  --control-primary-border-active: transparent;
  --control-secondary-background-default: var(--om-surface-2);
  --control-secondary-background-hover: var(--om-surface-3);
  --control-secondary-background-active: var(--om-surface-4);
  --control-secondary-text-default: var(--om-text);
  --control-secondary-text-hover: var(--om-text-strong);
  --control-secondary-text-active: var(--om-text-strong);
  --control-secondary-icon-default: var(--om-text);
  --control-secondary-icon-hover: var(--om-text-strong);
  --control-secondary-icon-active: var(--om-text-strong);
  --control-secondary-border-default: var(--om-border);
  --control-secondary-border-hover: var(--om-border);
  --control-secondary-border-active: var(--om-border);
  --control-critical-primary-background-default: var(--om-red);
  --control-critical-primary-background-hover: var(--om-red-hover);
  --control-critical-primary-background-active: var(--om-red);
  --control-critical-primary-text-default: var(--om-on-accent);
  --control-critical-primary-text-hover: var(--om-on-accent);
  --control-critical-primary-text-active: var(--om-on-accent);
  --control-critical-primary-icon-default: var(--om-on-accent);
  --control-critical-primary-icon-hover: var(--om-on-accent);
  --control-critical-primary-icon-active: var(--om-on-accent);
  --control-critical-primary-border-default: transparent;
  --control-critical-primary-border-hover: transparent;
  --control-critical-primary-border-active: transparent;
  --control-critical-secondary-background-default: var(--om-surface-2);
  --control-critical-secondary-background-hover: var(--om-red-soft);
  --control-critical-secondary-background-active: var(--om-red-soft);
  --control-critical-secondary-text-default: var(--om-red);
  --control-critical-secondary-text-hover: var(--om-red);
  --control-critical-secondary-text-active: var(--om-red);
  --control-critical-secondary-icon-default: var(--om-red);
  --control-critical-secondary-icon-hover: var(--om-red);
  --control-critical-secondary-icon-active: var(--om-red);
  --control-icon-only-background-hover: var(--om-hover);
  --control-icon-only-background-active: var(--om-active);
  --control-icon-only-icon-default: var(--om-text-subtle);
  --control-icon-only-icon-hover: var(--om-text);
  --control-icon-only-icon-active: var(--om-text-strong);
  --control-brand-foreground: var(--om-accent);
  --button-outline-primary-text: var(--om-text);

  /* Toggles, checkboxes, radios, sliders */
  --switch-background-default: var(--om-surface-4);
  --switch-background-hover: var(--om-surface-4);
  --switch-background-selected-default: var(--om-accent);
  --switch-background-selected-hover: var(--om-accent-hover);
  --switch-border-default: var(--om-border);
  --switch-border-selected-default: transparent;
  --checkbox-background-default: var(--om-surface-2);
  --checkbox-background-hover: var(--om-surface-3);
  --checkbox-background-selected-default: var(--om-accent);
  --checkbox-background-selected-hover: var(--om-accent-hover);
  --checkbox-border-default: var(--om-border-strong);
  --checkbox-border-hover: var(--om-border-strong);
  --checkbox-border-selected-default: var(--om-accent);
  --checkbox-border-selected-hover: var(--om-accent-hover);
  --checkbox-icon-active: var(--om-on-accent);
  --radio-background-default: var(--om-surface-2);
  --radio-background-hover: var(--om-surface-3);
  --radio-background-selected-default: var(--om-accent);
  --radio-background-selected-hover: var(--om-accent-hover);
  --radio-border-default: var(--om-border-strong);
  --radio-border-selected-default: var(--om-accent);
  --radio-thumb-background-active: var(--om-on-accent);
  --slider-track-background: var(--om-surface-3);
  --progressbar-track-background: var(--om-surface-3);
  --progressbar-indicator-background: var(--om-accent);

  /* Messages, mentions, reactions */
  --message-background-hover: color-mix(in oklab, var(--om-fg) 3%, transparent);
  --message-mentioned-background-default: color-mix(in oklab, var(--om-yellow) 8%, transparent);
  --message-mentioned-background-hover: color-mix(in oklab, var(--om-yellow) 12%, transparent);
  --message-highlight-background-default: var(--om-accent-faint);
  --message-highlight-background-hover: var(--om-accent-soft);
  --mention-background: var(--om-accent-soft);
  --mention-foreground: var(--om-accent);
  --reaction-background-default: var(--om-surface-1);
  --reaction-background-hover: var(--om-surface-2);
  --reaction-background-active: var(--om-surface-3);
  --reaction-background-reacted-default: var(--om-accent-soft);
  --reaction-background-reacted-hover: var(--om-accent-soft);
  --reaction-border-default: var(--om-border);
  --reaction-border-hover: var(--om-border-strong);
  --reaction-border-reacted-default: var(--om-accent);
  --reaction-text-default: var(--om-text-subtle);
  --reaction-text-hover: var(--om-text);
  --reaction-text-reacted-default: var(--om-text-strong);
  --polls-voted-fill: var(--om-accent-soft);
  --polls-victor-fill: color-mix(in oklab, var(--om-green) 16%, transparent);
  --spine-default: var(--om-border-strong);

  /* Badges, statuses, notices */
  --badge-background-default: var(--om-accent);
  --badge-text-default: var(--om-on-accent);
  --badge-notification-background: var(--om-red);
  --status-online: var(--om-green);
  --status-danger: var(--om-red);
  --status-positive: var(--om-green);
  --status-positive-background: var(--om-green);
  --status-warning: var(--om-yellow);
  --status-speaking: var(--om-green);
  --notice-background-info: var(--om-blue);
  --notice-background-positive: var(--om-green);
  --notice-background-warning: var(--om-yellow);
  --notice-background-critical: var(--om-red);
  --notice-text-info: var(--om-on-accent);
  --notice-text-positive: var(--om-on-accent);
  --notice-text-warning: var(--om-on-accent);
  --notice-text-critical: var(--om-on-accent);

  /* Scrollbars */
  --scrollbar-auto-thumb: var(--om-surface-4);
  --scrollbar-auto-track: transparent;
  --scrollbar-thin-thumb: var(--om-surface-4);
  --scrollbar-thin-track: transparent;

  /* Raw palette slots that older UI and some Vencord plugins read directly */
  --brand-260: var(--om-accent-hover);
  --brand-360: var(--om-accent);
  --brand-500: var(--om-accent);
  --brand-560: var(--om-accent-hover);
  --brand-600: var(--om-accent-active);
  --blurple-50: var(--om-accent);
  --red-400: var(--om-red);
  --red-500: var(--om-red);
  --green-360: var(--om-green);
  --yellow-300: var(--om-yellow);
}

::selection {
  background-color: var(--om-selection);
}

/* Code block syntax colors */
.hljs {
  color: var(--om-text);
}
.hljs-comment,
.hljs-quote {
  color: var(--om-text-muted);
  font-style: italic;
}
.hljs-keyword,
.hljs-selector-tag,
.hljs-built_in {
  color: var(--om-magenta);
}
.hljs-string,
.hljs-addition,
.hljs-regexp {
  color: var(--om-green);
}
.hljs-number,
.hljs-literal,
.hljs-symbol {
  color: var(--om-yellow);
}
.hljs-title,
.hljs-section,
.hljs-function {
  color: var(--om-blue);
}
.hljs-attr,
.hljs-attribute,
.hljs-variable,
.hljs-template-variable,
.hljs-type {
  color: var(--om-cyan);
}
.hljs-deletion,
.hljs-meta {
  color: var(--om-red);
}

/* Hyprland manages windows, so keep only Discord's close button, at the top
   right. Minimize and maximize are hidden. Matching the close button by class
   and falling back to the last child keeps this working when Discord renames
   its hashes. */
[class*="winButtons_"] {
  width: auto !important;
  min-width: 0 !important;
  overflow: visible !important;
  visibility: visible !important;
  pointer-events: auto !important;
}
[class*="winButtons_"] > *:not([class*="winButtonClose"]):not(:last-child) {
  display: none !important;
}
[class*="winButtonsWithDivider"]::before {
  display: none !important;
}
