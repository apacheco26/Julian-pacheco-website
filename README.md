# julian-pacheco.com

Personal resume site. Static — one `index.html`, no build step.

## Run locally (VS Code)

Install the **Live Server** extension, then right-click `index.html` → *Open with Live Server*. Auto-reloads on save.

## Deploy

Self-hosted on the home server (Ubuntu) behind a Cloudflare Tunnel. Caddy serves the site from `/home/julian/sites/julian-pacheco.com` on `127.0.0.1:8181`; `cloudflared` publishes it. No router ports are open.

Push to `main`, then from a checkout run:

```bash
./deploy.sh --dry-run   # preview
./deploy.sh             # sync to the server over SSH
```

Headers (CSP, HSTS, etc.), the `www` redirect and 404 rules live in the server's `/etc/caddy/Caddyfile`, not in this repo. Fonts are self-hosted in `assets/fonts/`, so the CSP allows no third-party origins.

## Domain

Registered at Squarespace; nameservers point to Cloudflare, which holds the DNS records. The apex and `www` are Cloudflare Tunnel routes to `http://localhost:8181`.

## To customize
- Update the LinkedIn / Google Scholar `href`s in the contact section.
- Swap `hello@julian-pacheco.com` for your real address.
- Hero background is a canvas animation — no video asset needed. To add a video later, drop a `<video>` behind `.hero-inner` and lower the canvas opacity.
