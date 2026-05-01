# Omarchy The Navigator Theme

The Navigator is an Omarchy theme built around a set of old maps of the world: warm terracotta land, slate-blue oceans, parchment route lines, and the hard geometry of a polar projection. It turns the desktop into an operations room surface: dark map ink, field-stone text, brass-toned accents, tight spacing, sharp corners, and no glow.

## Preview

![Theme preview](preview.png)

## Install

Use the Omarchy theme installer:

```bash
omarchy-theme-install https://github.com/OldJobobo/omarchy-the-navigator-theme
```

## What's Included

The theme includes the usual Omarchy surfaces plus a few focused extras:

- **Shell surfaces** for Hyprland, Hyprlock, Waybar, Walker, Mako, SwayOSD, and GTK.
- **Terminal palettes** for Alacritty, Foot, Ghostty, Kitty, and Warp.
- **Editor themes** for Zed, VS Code, and Neovim via the bundled Aether-based configuration.
- **Application themes** for Btop, Chromium, Vencord, and Zellij.
- **Base24 palette source** in `the-navigator-base24.yaml` for regenerating or porting the color system.

## Wallpapers

<table>
  <tr>
    <td><img src="backgrounds/01-celestial-globe.jpg" width="220" alt="Celestial Globe"></td>
    <td><img src="backgrounds/02-great-circle.jpg" width="220" alt="Great Circle"></td>
    <td><img src="backgrounds/03-cyrillic-time.jpg" width="220" alt="Cyrillic Time"></td>
  </tr>
  <tr>
    <td align="center">Celestial Globe</td>
    <td align="center">Great Circle</td>
    <td align="center">Cyrillic Time</td>
  </tr>
</table>

## Design Notes

The palette is intentionally narrow: `#232220` map ink for the base, `#a9a49f` field stone for primary text, and `#d1b187` parchment gold as the single focus color. Semantic colors stay map-derived: oxide red for errors, olive for success, ochre for warnings, and slate teal for live or informational state.

The full design rationale lives in `DESIGN.md`.

## Requirements

- **BlexMono Nerd Font** for terminals, launcher, notifications, OSD, and lockscreen text.

On Arch-based systems:

```bash
yay -S ttf-blexmono-nerd
```

## Attribution

- Palette derived from *Lost Century* by [surrealember](https://lospec.com/surrealember) on Lospec.
