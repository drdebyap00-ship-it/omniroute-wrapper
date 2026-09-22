# Wrapper Dockerfile untuk fix permission issue di /data
# Base dari omniroute:latest dan fix ownership untuk node user
FROM diegosouzapw/omniroute:latest

USER root

# Fix permission: ensure /data owned by node user (UID 1000)
# Create dengan proper ownership agar app bisa write tanpa EACCES error
RUN mkdir -p /data && \
    chown -R node:node /data && \
    chmod 755 /data

# Fix entrypoint — base image punya check-permissions.sh yang strict
# Override dengan direct start untuk development/test
ENTRYPOINT []
CMD ["node", "dev/run-standalone.mjs"]

# Healthcheck inherit dari base image

