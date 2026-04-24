## Golden Dallah Hotel (Production)

### What this repo is
- **Frontend**: React SPA (Vite) in `client/`
- **Backend**: Node.js + Express + tRPC in `server/`
- **Database**: MySQL (Drizzle ORM)
- **Uploads**: Stored on disk (served from `/uploads`)

### Local development

```bash
pnpm install
pnpm dev
```

### Production build

```bash
pnpm install --frozen-lockfile
pnpm build
```

### Production run

1. Create `.env` from `.env.example` and fill in real values.
2. Ensure the uploads directory exists and is writable (default: `uploads/`).

```bash
NODE_ENV=production pnpm start
```

### Recommended VPS setup (Nginx + systemd)

- **Nginx**: proxy to Node on `127.0.0.1:3000`, serve HTTPS, and pass `X-Forwarded-Proto`.
- **systemd**: keep the Node process alive (restart on failure).

Key notes:
- The server reads `PORT` from environment.
- Cookies detect HTTPS behind proxies via `X-Forwarded-Proto` (make sure Nginx forwards it).
- SPA routes are served via `index.html` fallback in production.

