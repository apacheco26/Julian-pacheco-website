# julian-pacheco.com — Build Progress

## Status: Active Development
**Last updated:** June 13, 2026  
**Stack:** Single-file static HTML/CSS/JS — no build step, no framework.  
**Deploy:** Netlify auto-deploy from GitHub (`apacheco26/Julian-pacheco-website`, `main` branch)

---

## Completed

### Core Site (`index.html`)

**Boot Loader**
- Terminal-style window (GitHub dark color scheme: `#0d1117` background, `#161b22` title bar)
- macOS traffic-light dots + `julian@research-env: ~/profile` title
- Progress bar fills in sync with counter (`0 → 100%`) via `requestAnimationFrame`
- Boot lines: `[OK] initializing` → `[OK] loading research profile` → `[OK] coding · science · coffee` → `[DONE] ready`

**Intro Overlay (`#intro`)**
- Two-column layout: "this is me..." sticky on the left, scrolling list on the right
- Scrolls through: `watching futbol` → `drinking coffee` → `running` → `pipetting` → `playing mahjong` → `story`
- Fixed-gradient highlight: items glow red (`#ff2020`) as they pass center; final item `story` glows green (`#00e676`)
- Auto-advance via `scrollIntoView` with staggered intervals (`260ms → 1400ms`)
- After `story` holds: overlay slides up (`translateY(-100%)`), page scroll unlocks, hero fades in
- Page scroll locked (`overflow: hidden`) during entire intro sequence; unlocks in `finishIntro()`
- `history.scrollRestoration = 'manual'` + `window.scrollTo(0,0)` forces top-of-page on every load

**Hero Section**
- Name `Julian / Pacheco` in oversized display type (`clamp(3.8rem, 20vw, 18rem)`)
- Scroll exit animation: name and subtitle fade + float up as user scrolls into next section
- Subtitle: *"Biomedical researcher in vaccine and gene therapy development, pursuing data science and machine learning to accelerate therapeutic discovery and development."*
- 4 icon badges (DNA helix, bar chart, brain, shield): Gene Therapy Innovation · Data Science & Analytics · Machine Learning & AI · Advancing Human Health
- 2 credential badges: M.S. in Data Science · Biomedical Researcher · Vaccine and Gene Therapy Institute
- Centered bouncing `↓ SCROLL` chevron arrow at bottom
- Canvas particle/constellation background (`#cells`), density raised to `min(220, W*H/10000)` dots

**Navigation**
- Sticky top nav: `JP⁄` brand mark + links (Focus · Experience · Education · Research · Skills · Contact)
- `mix-blend-mode: difference` so nav stays visible over any background

**Sections**
| # | ID | Heading | Notes |
|---|-----|---------|-------|
| 01 | `#focus` | Story | Centered bio paragraph, max-width 72ch, no lead sentence or tags |
| 02 | `#experience` | Experience | 2 roles, bold `tag:` bullet format, accent-colored terms (`lenacapavir`, `FDA Breakthrough Therapy`) |
| 03 | `#education` | Education | — |
| 04 | `#research` | Research & Presentations | 5 publications/presentations with `PAPER` / `ORAL` / `POSTER` type badges |
| 05 | `#skills` | Toolkit | 3-column grid (Wet Lab, Data & ML, Engineering) + project card row |
| — | `#contact` | Contact | Email + GitHub icon + Instagram icon, social icons svg-only |

**Experience Section**
- Role 1: Research Assistant · Vaccine and Gene Therapy Institute · OHSU · 2021–Present
  - Bullets: Translational immunology · End to end analysis · Collaborative research
- Role 2: Biological Field Technician · Bureau of Land Management / OSU · 2020
  - Bullets: Data integrity · Adaptive sampling

**Research Section**
- Cell Host & Microbe paper (2024) — `PAPER`
- IAS 2025 Kigali oral — `ORAL`
- Keystone Symposia 2026 poster — `POSTER`
- CROI 2025 poster × 2 — `POSTER`
- CROI 2023 virtual — `POSTER`

**Contact**
- Email: `apacheco26@outlook.com`
- GitHub: `github.com/apacheco26`
- Instagram: `instagram.com/julian_pac/`

**Scroll & Animation**
- `.reveal` elements animate in via `IntersectionObserver` (fade + translateY)
- Hero scroll exit: `window.scroll` listener fades `.hero-inner` as user scrolls
- `prefers-reduced-motion` respected throughout (skips intro, disables animations)
- Magnetic hover effect on contact links (`data-magnetic`)

---

### Project Page (`world-cup-2026.html`)

**Visual identity:** cream/off-white background (`#F5F0E6`) with faint grid lines, Bebas Neue display type, DM Mono labels, Inter body. Wavy SVG underline on masthead title.

**5 tabs:**

| Tab | Content | Interactions |
|-----|---------|-------------|
| The Format | Round-by-round bracket flow (Group Stage → Final · MetLife · Jul 19) + 5 tournament stats | Static |
| The Cities | Leaflet/CartoDB map, all 16 host venues color-coded by country | Hover popups |
| The Groups | 12 color-coded group tiles (A–L), all 4 teams + flags visible | Hover popover with full roster |
| The Schedule | Day-by-day fixture chips Jun 11–17, color-coded by group | Hover tooltip: fixture + kickoff ET |
| The Teams | Full FIFA pre-tournament ranking strip, 51 nations, callout badges for top nations + hosts | Static |

**Data layer (JSON constants, easy to update):**
- `GROUPS` — 12 groups × 4 teams with flag emoji, host flag (⚠️ provisional — update from official draw)
- `FIXTURES` — date/home/away/group/time objects (⚠️ sample times — update from official schedule)
- `VENUES` — 16 venues with lat/lng, country, final flag
- `FIFA_RANKINGS` — 51 teams ranked with approximate point totals
- `GROUP_COLORS` — 12 distinct earth/jewel-tone hex values

**Confirmed data:** Group J = Argentina, Austria, Algeria, Jordan. Group C includes Haiti & Scotland.

**Linked from:** Skills section of `index.html` as a project card.

---

## In Progress / Next Up

- [ ] **Update World Cup group draw** — paste official assignments into `GROUPS` object from PDF
- [ ] **Update World Cup schedule** — replace sample fixtures in `FIXTURES` array with real kickoff times
- [ ] **Publication links** — hyperlink the `PAPER` / `ORAL` / `POSTER` tags on research entries
- [ ] **LinkedIn / Google Scholar links** — update `href` placeholders in contact section
- [ ] **Domain** — point `julian-pacheco.com` DNS (registered at Squarespace) to Netlify

## Known Issues

- None currently tracked

---

## File Structure

```
website/
├── index.html           ← entire portfolio (all CSS + JS inline)
├── world-cup-2026.html  ← tournament guide project page
├── CLAUDE.md            ← project instructions for Claude Code
├── PROGRESS.md          ← this file
├── netlify.toml         ← Netlify deploy config
└── README.md
```

## Deploy Info

- **Repo:** `github.com/apacheco26/Julian-pacheco-website`
- **Branch:** `main`
- **Host:** Netlify (auto-deploy on push)
- **Domain target:** `julian-pacheco.com`
