# Wrapper Dockerfile untuk fix permission issue di /data
# Base dari omniroute:latest dan fix ownership untuk node user
FROM diegosouzapw/omniroute:latest

USER root

# Fix permission: ensure /data owned by node user (UID 1000)
# sehingga app bisa write ke volume /data tanpa EACCES error
RUN mkdir -p /data && chown -R node:node /data

# Switch back ke non-root user
USER node

# Semua config lain (ENTRYPOINT, CMD, HEALTHCHECK) inherit dari base image

