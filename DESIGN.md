# DESIGN.md — omarchy-worldmap-theme

## Concept

**The Navigator's Brief.**

The wallpaper is a WWII-era *Air Map of the World* — an azimuthal equidistant projection centered on the North Pole, printed for military air navigation. The land masses are warm terracotta, dusty rose, olive, and ochre. The ocean and atmosphere are slate-blue. Red great circle routes arc across theaters of operation. The corners hold dense text blocks of strategic annotation.

The desktop inherits this world: a dark operations room where paper maps are spread across a bakelite-instrument table under amber lamplight. Information is precise and functional. Nothing decorates for its own sake. The interface is a tool of strategic intelligence, not an aesthetic object.

Material language: **aged ink, printing press registration, map grid lines, field dispatch cards, brass instrument panels.**

---

## Carbon Design System Alignment

The Navigator's Brief concept maps cleanly onto IBM's Carbon Design System. Carbon was built for dense, functional, enterprise data interfaces — the same design values this theme requires. Where Carbon principles apply, they are the default decision framework. Where they conflict with the analog/pre-digital material story, the map concept takes precedence.

### Adopted Carbon Principles

**Flat surfaces.** Carbon uses 0px border radius across panel components, buttons, and data tables. This theme enforces `border-radius: 0` everywhere — both choices share the same rationale: visual precision, not decoration.

**1px structural borders.** Carbon's panel borders, input borders, and table dividers are 1px. This theme uses 1px for all UI widget borders and dividers, 2px only for active window borders and notification card edges (the one point of emphasis).

**Single interactive accent.** Carbon designates exactly one interactive color per theme (`$interactive` token). This theme uses parchment gold `#d1b187` in the same role — one color means "focus/active/selection," nothing else competes.

**Left-border active indicator.** Carbon's Side Navigation uses a 2px left-border rule to mark the active item (the `$link-primary` fill on the left edge). Walker's selected-row treatment mirrors this exactly. Name this pattern explicitly when designing new menu or list components: not a row fill, a left-rule mark.

**Semantic color vocabulary.** Carbon enforces that color communicates status, not decoration: one success color (green), one warning (yellow), one error (red), one info (blue), one interactive (brand blue). This theme's semantic palette maps to the same intent with map-derived hues: olive `#8a8d4c` for success, ochre `#bfaa48` for warning, oxide red `#cb704f` for error, parchment gold `#d1b187` for functions/links/info, slate teal `#61928b` for hints/live state.

**Dense component sizing.** Carbon's "sm" (small) size class targets ~32px interactive row height for compact data contexts. Walker rows target 32–34px for the same reason: maximum data density at comfortable legibility.

**4px spacing grid.** Carbon's spacing tokens are multiples of 4px (`$spacing-01` = 4px through `$spacing-13` = 96px). All spacing in this theme — padding, margins, gaps — should align to multiples of 4px. Use 8px and 16px as the two primary values; 4px for fine inner separations; 24px for section breaks.

### Surface Layer Model

*Precedent: omarchy-breaking-bad-theme — Carbon `$background` / `$layer-01` / `$layer-02` mapped to an operations room concept.*

Three surface temperatures define depth in this theme. Each layer is slightly darker than the one above it, creating a reading hierarchy without any glow or blur.

| Layer | Role | Hex | Carbon analogy |
|---|---|---|---|
| **Map void** | Desktop base, terminals | `#232220` | `$background` |
| **Operations panel** | Overlay containers — Walker, SwayOSD | `#1c1b19` | `$layer-01` |
| **Instrument surface** | Deepest inset — search strip, trough, keybind chips | `#141312` | `$layer-02` |

Design intent:
- The map void is the world itself — the lit surface everything rests on
- The operations panel floats above it — the workbench, the overlay, the thing being used
- The instrument surface is cut *into* the panel — the physical recess of a readout, an input slot, a trough

Rules:
- Walker container and SwayOSD container sit at operations panel (`#1c1b19`)
- Walker search strip and OSD progress trough sit at instrument surface (`#141312`)
- Terminal backgrounds stay at map void (`#232220`) — they are the world, not an overlay
- GTK app surfaces stay solid at map void — no transparency, no layering needed at that scale
- Lockscreen input field uses `rgba(35, 34, 32, 0.66)` — the only semi-transparent surface

### BlexMono Nerd Font

This theme uses BlexMono Nerd Font across all surfaces — terminals, launcher, notifications, and OSD. BlexMono is the Nerd Fonts-patched build of IBM Plex Mono, preserving its narrow technical precision while adding the full Nerd Fonts glyph set.

- **BlexMono Nerd Font Mono** — terminal emulators (Kitty, Ghostty, Alacritty, Foot): the fixed-cell variant keeps icon glyphs at one column width
- **BlexMono Nerd Font** — launcher (Walker), notifications (Mako), OSD (SwayOSD), lockscreen labels: the standard variant for UI surfaces

Using a single monospace typeface across all surfaces reinforces the instrument-readout material language — every element reads like a coordinate, a field annotation, or a gauge label. There is no humanist-sans contrast; the entire desktop speaks one typographic register.

### Carbon Motion: Productive Style

Carbon defines two motion styles. Use **productive motion** only — never expressive.

| Element | Duration | Easing |
|---|---|---|
| Small elements (row highlight, border flash) | 100ms | `cubic-bezier(0.2, 0, 0.38, 0.9)` (Carbon ease-in for exit) |
| Medium elements (overlay open, panel slide) | 150ms | `cubic-bezier(0, 0, 0.38, 0.9)` (Carbon ease-out for enter) |
| Large elements (window open/close) | 240ms | `cubic-bezier(0, 0, 0.38, 0.9)` |

Carbon productive motion is fast, intentional, and never playful. This matches the mechanical animation philosophy already defined for this theme.

### Where Carbon Does Not Apply

- **Palette values**: Carbon's official palette is IBM Blue / Cool Gray. This theme's hues are map-derived. Do not substitute Carbon token values for the map palette.
- **Rounded "expressive" components**: Carbon's expressive tier uses rounding and larger sizing. Ignore those tiers — this theme is productive only.
- **Carbon's light-background default**: Carbon's default surface is `$background: #ffffff`. This theme runs dark. Treat Carbon's dark-mode layer tokens as the reference tier when Carbon guidance is relevant.

---

## Color Palette

### Canonical Source
`colors.toml` is the single source of truth for all palette values.

### Full Palette

| Role | Hex | Name | Source |
|---|---|---|---|
| Background | `#232220` | Map Ink | Warm dark charcoal with slight brown undertone — printing press ink at night |
| Foreground | `#a9a49f` | Field Stone | Worn map surface, aged paper mid-tone — all primary text |
| Muted | `#5c5a57` | Smudged Ink | Faded print — inactive borders, grid lines, disabled text |
| Accent / Focus | `#d1b187` | Parchment Gold | Aged map paper, sand-route ink — active/selected/focus signal |
| Active Emphasis | `#e0c99e` | Aged Linen | Peak brightness on active/focused elements |
| Cursor | `#cac5be` | Worn Stone | Warm light grey — clean, no color shift |
| Selection BG | `#d1b187` | Parchment Gold | Selection echoes the focus accent |
| Selection FG | `#232220` | Map Ink | Dark text on parchment selection |
| ANSI Red | `#cb704f` | Oxide Red | Error / fault — warm orange-red, map boundary severity |
| ANSI Green | `#8a8d4c` | Olive | Vegetation zone — success, enabled |
| ANSI Yellow | `#bfaa48` | Ochre | Desert/parchment zone — warning, attention |
| ANSI Blue | `#d1b187` | Parchment Gold | Warm map route — functions, links, info (echoes accent) |
| ANSI Magenta | `#b08c52` | Amber Bronze | Instrument brass — keywords, secondary accent |
| ANSI Cyan | `#61928b` | Slate Teal | Open ocean — live/healthy state, hints |
| ANSI White | `#a9a49f` | Field Stone | Primary text |
| Bright Black | `#5c5a57` | Smudged Ink | Muted / inactive / disabled — comments, ghost UI |
| Bright Red | `#c87252` | Terracotta | Bright error / destructive |
| Bright Green | `#909048` | Olive Bright | Bright success / confirmed |
| Bright Yellow | `#d8c85a` | Amber | Bright warning / ochre light |
| Bright Blue | `#e0c99e` | Aged Linen | Bright parchment — active border, emphasis |
| Bright Magenta | `#c9a464` | Bronze Light | Bright amber bronze / instrument face |
| Bright Cyan | `#608e8a` | Ocean Slate | Bright teal / informational |
| Bright White | `#8aacaa` | Aqua Stone | Bright warm teal — highlights |

### Semantic Role Summary

- **One focus color**: parchment gold `#d1b187` carries focus, selection, and active borders. Nothing else competes with it.
- **One muted neutral**: smudged ink `#5c5a57` for inactive borders, dividers, disabled text, and comments.
- **Field stone foreground**: `#a9a49f` throughout — all primary text across all surfaces.
- **Map ink background**: `#232220` — warm dark charcoal with slight brown undertone. Not blue-black. Not neutral grey. Preserve it — it is the strongest identity marker in the theme.
- **Success / live**: olive `#8a8d4c` — vegetation zone, healthy signal.
- **Warning**: ochre `#bfaa48` — like a sand desert zone on the map.
- **Error**: oxide red `#cb704f` — clear fault signal without alarming neon.
- **Functions / info / links**: parchment gold `#d1b187` — warm route color, occupies the blue ANSI slot.
- **Types / labels**: ochre `#bfaa48` — structural annotation, same as warning but distinct by role context.
- **Keywords**: amber bronze `#b08c52` — secondary accent, warm instrument tone.

---

## Surface Language

### Corner Treatment
**Sharp. Always.** `border-radius: 0` everywhere. Maps are grids, not organic forms. GTK `gtk.css` already enforces this globally via `* { border-radius: 0; }`. Do not introduce radius anywhere — not in `walker.css`, not in `mako.ini`, not in `swayosd.css`.

*Carbon alignment: Carbon's productive tier uses 0px radius on panels, inputs, data tables, and notifications. This is not coincidental overlap — it is the same design rationale: precision over personality.*

### Border Weight
**Thin. 1–2px.** Map grid lines are precise, not decorative. Active window borders: 2px. UI widget borders: 1px. Notification card: 2px. Nothing heavier. Heavy borders make a map look like a cartoon.

*Carbon alignment: Carbon uses 1px `$border-subtle` for container and input borders. This theme matches exactly.*

### Spacing Grid
**4px base.** All padding, margin, and gap values must be multiples of 4px. Use Carbon's spacing tokens as the reference: 4px, 8px, 12px, 16px, 24px, 32px. The two primary spacing values are **8px** (compact/inner) and **16px** (standard/outer). Do not use 10px, 14px, or other non-grid values in new work.

*Walker and SwayOSD have been updated to `8px 16px`. Flag any new values that deviate from multiples of 4px during code review.*

### Information Density
**Dense but readable.** Maps pack maximum data into minimum space. Launcher rows should be compact. Notifications should feel like dispatch cards, not billboards. Waybar should read like instrument gauges.

*Carbon alignment: Carbon was designed for enterprise data interfaces — high information density at comfortable legibility is a first principle, not a tradeoff.*

### Glow and Neon
**None.** This is a pre-digital world. No neon, no bloom, no text shadows, no accent glows. The only brightness comes from parchment text on a dark surface — ambient lamplight, not electric glow.

*Carbon alignment: Carbon does not use decorative glow effects. Color is always semantic in Carbon — it signals state, not mood.*

---

## Component Design

### Hyprland

The window manager establishes the desktop's physical weight and separation.

```
border_size = 2
gaps_in = 4
gaps_out = 8
rounding = 0
```

- `border_size = 2`: matches map borderline weight — visible and precise, not decorative
- `gaps_in = 4, gaps_out = 8`: tight margins, like a map's inner border inset
- `rounding = 0`: hard corners, non-negotiable

**Border colors:**
- Active: `rgb(dda070)` — warm amber highlight, brighter than the parchment accent — clearly lit subject
- Inactive: `rgb(4a5860)` — muted slate — present but recessive

**Opacity:**
- Do not use Hyprland `active_opacity` / `inactive_opacity` for terminals. Use terminal-native opacity (see Depth System below).
- If non-terminal surfaces need translucency, keep values subtle: `inactive_opacity = 0.95` at most — this stacks on Omarchy's own baseline.

**Animations:**
- Minimal. Speed should feel mechanical, not cinematic.
- `animation = windows, 1, 2, default` — snappy, no elastic bounce
- `animation = fade, 1, 2, default` — fast fade, no float
- No `slide` animations. Slides feel playful; this theme is severe.

**Blur:**
- Disabled or near-disabled. Maps are read straight through — no frosted glass.
- If blur must be present: `size = 4, passes = 1` — barely present, purely atmospheric.

**Shadow:**
- Subtle, warm-dark. For window separation on busy wallpaper detail, not for drama.
- `col.shadow = rgba(35, 34, 32, 0.7)` — same hue family as background
- `range = 10, power = 2` — narrow, close to the edge


### Hyprlock

The lockscreen is a **field operations map overlay** — the world map is the backdrop, and the authentication surface is a sparse instrument panel laid over it.

Variables already defined in `hyprlock.conf`:
- `$color = rgba(35, 34, 32, 1)` — solid background for opaque elements
- `$inner_color = rgba(35, 34, 32, 0.66)` — semi-transparent input field
- `$outer_color = rgba(209, 177, 135, 1)` — parchment gold outer ring
- `$font_color = rgba(169, 164, 159, 1)` — field stone text
- `$placeholder_color = rgba(169, 164, 159, 0.5)` — muted placeholder text
- `$check_color = rgba(96, 142, 138, 1)` — slate teal for confirmation
- `$fail_color = rgba(200, 114, 82, 1)` — bright red for failure
- `$capslock_color = rgba(216, 200, 90, 1)` — amber (#d8c85a) for caps lock warning (not yet defined in hyprlock.conf — add)

Design intent:
- The password ring outer color is parchment gold — the one active signal on the screen
- The input field is semi-transparent dark charcoal — blends into the map without disappearing
- All text is field stone — no bright white, no hard contrast
- Keep the lockscreen sparse: time, date, input. No decorative elements.


### Walker (Launcher)

Walker should read as a **map index card** — a precise reference object with no ornamentation.

**Carbon pattern reference: Side Navigation active item.** Carbon's Side Navigation component marks the active item with a 2px `$link-primary` left-border rule, not a row fill. Walker's selected state uses the identical pattern — a 2px parchment gold left border on the active row. This is not a coincidence; it is the correct choice for a dense list where selection should read as a pointer, not a highlight.

Design targets:
- Hard frame, no rounding
- Container at **operations panel** layer (`#1c1b19`) — not map void; the launcher floats above the desktop
- Bevel borders: `rgba(209, 177, 135, 0.42)` top, asymmetric dark shadow borders on left/right/bottom — the container reads as a weighted operations surface
- Search strip at **instrument surface** layer (`#141312`) — recessed into the panel, not flush with it; inset shadow above
- Row density: compact (via 2px 16px item padding)
- Outer box padding: 20px
- Selection state: **left-rail inset shadow** — `inset 2px 0 0 #d1b187` (Carbon Side Nav active pattern via box-shadow, not border-left; same visual result, more precise)
- Hover: low-contrast tint — Carbon hover states are intentionally subtle

```css
/* Walker Carbon layer values */
/* border-radius: 0 — all containers */
/* border: bevel-light rgba(209,177,135,0.42) top, asymmetric shadow borders — outer frame */
/* background: #1c1b19 — operations panel layer, not map void */
/* search strip: background #141312 — instrument surface, recessed */
/* search strip: margin-bottom: 12px — breathing gap before row list */
/* box padding: 20px — outer container breathing room */
/* item padding: 2px 16px — compact row density */
/* min-height: 32px — Carbon "sm" row (via padding) */
/* selection: box-shadow: inset 2px 0 0 #d1b187 — left-rail inset */
/* keybind chips: box-shadow: inset 2px 0 0 rgba(209,177,135,0.9) — echoes rail */
/* font: BlexMono Nerd Font 14px body, 12px sub */
```


### Mako (Notifications)

Notifications are **field dispatch cards** — dense, functional, brief.

**Carbon pattern reference: Toast Notification.** Carbon's Toast component is a compact auto-dismissing card anchored to a screen corner. Key Carbon Toast characteristics that apply here: 1px status indicator on the left edge (this theme uses 2px parchment gold on all edges for a marking-card read instead), tight padding, IBM Plex Sans body text, auto-dismiss timing. The Carbon Toast is the closest named component to this role.

Target values:
```
width = 368          (Carbon: 320px default — bumped to 368 for map annotation density)
height = 80
padding = 8          (Carbon $spacing-03 — on the 4px grid)
border-size = 2      (2px vs Carbon's 1px left-only — map card marking edge)
border-color = #d1b187   (parchment gold — active alert)
background-color = #232220
text-color = #a9a49f
font = BlexMono Nerd Font 11
anchor = top-right
outer-margin = 16    (Carbon $spacing-05 — 4px grid)
default-timeout = 5000
```

Design intent:
- 368px wide: slightly wider than Carbon default for annotation-style content
- 2px parchment gold border all edges: the dispatch card has a full marking border (bolder than Carbon's single left edge, intentional)
- BlexMono Nerd Font: monospace dispatch text — reads like a field annotation, coordinate entry, or instrument label
- No rounding


### SwayOSD

The volume/brightness OSD is a **navigation instrument readout** — a single compact HUD element.

**Carbon pattern reference: Inline Progress Bar.** Carbon's progress bar component uses a thin filled bar (no rounding) with a defined trough color and a single fill color tied to the interactive token. The progress bar height in Carbon's compact variant is 4–8px. This theme's 6px bar height sits within that range. The trough uses a low-opacity neutral; the fill uses the single interactive accent.

Design targets:
- Container at **operations panel** layer (`#1c1b19`) — same layer as Walker; OSD is an operations surface, not the desktop
- Hard outline container, `border: 1px solid alpha(#5c5a57, 0.56)` (Carbon `$border-subtle`)
- Container padding: 16px 24px (outer breathing room for the HUD object)
- Progress trough at **instrument surface** layer (`#141312`) — the trough is a recessed readout slot, not a floating element
- Progress bar fill: parchment gold `#d1b187` — the single interactive accent, consistent with Carbon's `$interactive` token role
- Bar height: 16px (as implemented — a heavier readout bar suits the instrument HUD register)
- No rounding anywhere
- No shadow unless it provides real separation against the wallpaper


### Waybar

`waybar.css` in this theme exposes only background and foreground color tokens — a minimal color mirror surface. Do not design Waybar as an independent layout object within this theme directory.

Token values already set:
```css
@define-color background #232220;
@define-color foreground #a9a49f;
```

Design intent within token scope:
- Waybar reads like **instrument panel gauges**: dark surface, warm readout text, no decorative chrome
- These two tokens are sufficient for the theme's Waybar contribution
- For a richer Waybar layout, a `waybar-theme/` directory would be required — treat that as out of scope for the initial release


### Terminals (Kitty, Ghostty, Alacritty, Foot)

All terminal configs should express the same background and opacity so the depth system stays unified.

**Target background opacity across all terminals: 0.888**

This is a subtle effect: like tracing paper laid over the map. The wallpaper bleeds through just enough to remind you the map is underneath. Text remains fully opaque and readable.

- Set opacity/alpha at the terminal level, not via Hyprland `active_opacity`, which degrades glyph rendering
- All four terminal config files (`kitty.conf`, `ghostty.conf`, `alacritty.toml`, `foot.ini`) must agree on the same effective background opacity
- If a terminal does not support explicit background alpha, leave it at solid `#232220` and note the exception

Color mapping:
- Background: `#232220`
- Foreground: `#a9a49f`
- ANSI palette follows `colors.toml`
- Cursor: `#cac5be` — worn stone, no color shift


### Neovim / Editor

The editor is where the ANSI palette is most visible. The semantic ordering matters:

- **Red** (`#cb704f`, bright `#c87252`): errors, deleted, constructors, tags — oxide red family
- **Green** (`#8a8d4c`, bright `#909048`): added, success, strings — olive family
- **Yellow** (`#bfaa48`, bright `#d8c85a`): modified, caution, types, labels, titles — ochre family
- **Blue** (`#d1b187`, bright `#e0c99e`): functions, attributes, links, namespaces — parchment gold family
- **Cyan** (`#61928b`, bright `#608e8a`): info, hints, live state — slate teal family
- **Magenta** (`#b08c52`, bright `#c9a464`): keywords, special constructs — amber bronze family

The editor palette should read like a **cartographic legend** — every color means something, no color is purely decorative.

---

## Depth System

Treat transparency, blur, and shadow as one unified system.

| Layer | Treatment |
|---|---|
| Terminal background | 0.888 opacity via terminal-native setting |
| GTK app surfaces | Solid `#232220` — no transparency |
| Walker overlay | Solid `#1c1b19` — precision object, no blur |
| Hyprland blur | Disabled or minimal (`size = 4, passes = 1`) |
| Shadow | Subtle warm-dark, narrow range |
| Lockscreen input | `rgba(35, 34, 32, 0.66)` — semi-transparent only here |

Rules:
- Transparency is reserved for the terminal layer and the lockscreen input field
- No frosted glass effect on overlays — blur and transparency together produce "soup," not map precision
- Shadow serves geometry (window separation), not mood (neon glow)

---

## Typography

**BlexMono Nerd Font Mono for terminals.** The fixed-cell Nerd Fonts variant of IBM Plex Mono. Narrow, legible at small sizes, no stylistic flourishes. Icon glyphs from the Nerd Fonts set render at one column width. Use this variant (`BlexMono Nerd Font Mono`) in all terminal configs; the proportional variant produces misaligned glyphs in terminal grids.

**BlexMono Nerd Font for UI surfaces.** Walker, Mako, SwayOSD, and Hyprlock labels all use the standard (non-Mono) variant. A full monospace typographic system reinforces the instrument-readout register — every surface reads like a field annotation or coordinate entry, not a humanist document.

**No display or decorative fonts.** This is not a playful or expressive theme.

Font size reference (aligned to Carbon type scale):
- Terminal body: 10px at the terminal level (Carbon `$body-short-01` maps to ~13px in UI contexts)
- Walker rows: 13px body, 11px sub-label (`$label-01`)
- Mako notification: 11px (`$label-01` compact)
- SwayOSD value: 11px
- Waybar: whatever the Omarchy bar template uses; do not override from this theme directory

---

## Animation Philosophy

**Fast and mechanical.** A cartographic instrument does not animate playfully. Use Carbon's productive motion style exclusively.

Carbon productive motion timing:
- Small UI state changes (hover, border flash, row highlight): **100ms**
- Overlay entrance (Walker open, notification appear): **150ms**
- Window open/close: **240ms**

Carbon productive motion easing:
- Element entering: `cubic-bezier(0, 0, 0.38, 0.9)` — decelerate into rest
- Element exiting: `cubic-bezier(0.2, 0, 1, 0.9)` — accelerate out quickly
- Do not use `ease` or `ease-in-out` — these feel soft, not mechanical

Rules:
- No elastic or bounce easing — ever
- No slide transitions — too playful
- No fade-out duration longer than 150ms — elements should disappear sharply
- Window transitions feel like a shutter snap, not a curtain draw

---

## Identity Markers

These choices are what make this theme distinct in the local repository:

1. **Map ink background `#232220`** — warm dark charcoal with slight brown undertone. Not blue-black. Not neutral grey. The warmth of printing press ink distinguishes it from colder dark themes in the local repo.

2. **Single parchment gold accent `#d1b187`** — warm, sandy, desaturated. Not neon, not jewel-tone. It echoes the aged map paper itself — the primary visual material of the concept.

3. **Hard outline surface language** — zero rounding, thin borders, dense layout. Belongs to the same pattern family as `omarchy-01-theme` and `omarchy-x-1632-theme`, but with a warm instead of cold palette.

4. **No glow, no blur** — strict analog precision. This distinguishes it clearly from frosted-glass themes like `omarchy-frost-sentinel-theme`, `omarchy-awakening-theme`, and `omarchy-monolith-theme`.

5. **Field stone foreground** — `#a9a49f` is warmer than the `#cdd6f4`/`#e0def4` foregrounds in most dark themes. The muted, warm reading surface reinforces the worn paper material story.

---

## Out of Scope

These would require work outside a normal theme directory and are not part of this theme's initial scope:

- Custom Waybar layout or module architecture (requires `waybar-theme/`)
- Firefox or Steam app theming
- Shell prompt or color export files
- Walker behavior changes (entry order, plugin configuration)

---

## Release Checklist

Before publishing:

- [ ] `logo.txt` and `sig.txt` present at theme root (required for `stamp` workflow)
- [ ] All terminal configs (`kitty.conf`, `ghostty.conf`, `alacritty.toml`, `foot.ini`) agree on background opacity
- [ ] `colors.toml` is the canonical source — no palette values appear only in derived files
- [ ] Walker has left-rule selection marker, not a generic fill
- [ ] Mako uses BlexMono Nerd Font and tight card proportions
- [ ] Hyprland has `rounding = 0` and no blur (or near-zero blur)
- [ ] No border-radius values appear anywhere in CSS files
- [ ] Wallpaper is optimized for repo size (`ffmpeg -y -v error -i input.jpg -q:v 2 output.jpg`)
- [ ] Semantic state colors (success/warning/error) are consistent across GTK, terminal, and editor
