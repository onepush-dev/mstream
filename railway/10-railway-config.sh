#!/usr/bin/with-contenv bash
# Railway first-boot config for mStream: web UI on 8080, one music folder on the /config volume,
# an admin user from MSTREAM_ADMIN_PASSWORD (so the server is never open), trustProxy for Railway's proxy.
mkdir -p /config/{album-art,db,keys,logs,sync,waveform-cache,music}
if [[ ! -e /config/.railway-configured ]]; then
  if [[ -z "${MSTREAM_ADMIN_PASSWORD}" ]]; then
    echo "[railway] MSTREAM_ADMIN_PASSWORD is not set; refusing to start an open server" >&2
    exit 1
  fi
  jq -n --arg pw "${MSTREAM_ADMIN_PASSWORD}" --arg user "${MSTREAM_ADMIN_USER:-admin}" '{
    port: 8080, webAppDirectory: "webapp", writeLogs: true, noUpload: false, trustProxy: true,
    scanOptions: {skipImg: false, scanInterval: 1.5, pause: 50, saveInterval: 500, bootScanDelay: 15},
    storage: {albumArtDirectory: "/config/album-art", dbDirectory: "/config/db", logsDirectory: "/config/logs", waveformCacheDirectory: "/config/waveform-cache"},
    folders: {music: {root: "/config/music"}},
    users: {($user): {password: $pw, admin: true, vpaths: ["music"]}}
  }' > /config/config.json
  touch /config/.railway-configured
  echo "[railway] wrote /config/config.json with admin user '${MSTREAM_ADMIN_USER:-admin}' from MSTREAM_ADMIN_PASSWORD (first boot)"
fi
lsiown -R abc:abc /config
