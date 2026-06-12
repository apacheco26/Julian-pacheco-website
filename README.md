# julian-pacheco.com

Personal resume site. Static — one `index.html`, no build step.

## Run locally (VS Code)

Install the **Live Server** extension, then right-click `index.html` → *Open with Live Server*. Auto-reloads on save.

## Deploy

### Option A — Netlify (drag & drop, no GitHub)
1. Go to app.netlify.com → drag this folder onto the deploy box.
2. Site goes live at a `*.netlify.app` URL instantly.
3. Add custom domain: Site settings → Domain management → Add `julian-pacheco.com`.

### Option B — Netlify / Cloudflare Pages from GitHub (auto-deploy on push)
```bash
git init
git add .
git commit -m "feat: launch resume site"
gh repo create julian-pacheco-site --public --source=. --push
```
Then connect the repo in Netlify/Cloudflare Pages. Every push redeploys.

## Point the domain (registered at Squarespace)

Your domain lives at Squarespace; you only change its DNS to point here.

**Easiest robust path — move DNS to Cloudflare (gives apex CNAME flattening + free CDN, sets you up for the multi-app routing later):**
1. Add the site to Cloudflare → it gives you two nameservers.
2. Squarespace → Settings → Domains → your domain → Nameservers → switch to Cloudflare's.
3. In Cloudflare DNS, add the CNAME your host (Netlify/Pages) provides for both apex and `www`.

**Or point directly from Squarespace DNS:**
- Squarespace → Settings → Domains → your domain → DNS Settings.
- Add the records your host gives you (Netlify provides A records for apex + a CNAME for `www`).
- SSL auto-provisions once DNS resolves (minutes to a few hours).

## To customize
- Update the LinkedIn / Google Scholar `href`s in the contact section.
- Swap `hello@julian-pacheco.com` for your real address.
- Hero background is a canvas animation — no video asset needed. To add a video later, drop a `<video>` behind `.hero-inner` and lower the canvas opacity.
