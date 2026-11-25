# mStream on Railway: the linuxserver/mstream:6.35.0 image (GPL-3.0 upstream), application unmodified.
# Railway layer: a first-boot step writes config.json (web UI on 8080, music folder on the /config volume,
# admin user from MSTREAM_ADMIN_PASSWORD, trustProxy) so the server is never left open and needs no inputs.
FROM linuxserver/mstream:6.35.0
LABEL org.opencontainers.image.source="https://github.com/onepush-dev/mstream"
COPY --chmod=755 railway/10-railway-config.sh /custom-cont-init.d/10-railway-config
ENV MSTREAM_ADMIN_USER=admin
EXPOSE 8080
