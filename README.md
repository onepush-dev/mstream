# mStream on Railway

[mStream](https://github.com/IrosTheBeggar/mStream) (GPL-3.0): a self-hosted music streaming server with a web player, uploads, playlists and mobile-app support. Deploy it on Railway with one click.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/VMp2IZ)

## What this template runs
- **mstream**: `ghcr.io/onepush-dev/mstream:6.35.0`, the `linuxserver/mstream:6.35.0` image (application unmodified). Web UI on port 8080. One volume at `/config` holds the config, database, album art and your music (`/config/music`).

On first boot a wrapper step writes `config.json` with an admin user named `admin` (password from `MSTREAM_ADMIN_PASSWORD`), so the server is never open to the public. Upload music from the web UI or put files in `/config/music`.

## After deploy
Open the Railway URL, sign in as `admin` with the `MSTREAM_ADMIN_PASSWORD` variable, and upload music. Add more users in the admin panel.

Not affiliated with mStream or LinuxServer.io.
