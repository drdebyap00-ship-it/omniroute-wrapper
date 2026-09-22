# Wrapper Dockerfile untuk fix permission issue di /data
# Base dari omniroute:latest dengan runtime permission fix
FROM diegosouzapw/omniroute:latest

USER root

# Copy entrypoint script yang fix permission saat container start
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Override ENTRYPOINT dengan script kita yang:
# 1. Fix /data ownership (sebagai root)
# 2. Exec app sebagai node user
ENTRYPOINT ["/docker-entrypoint.sh"]

