FROM objectboxio/sync:sync-server-2026-03-11

# Create data dir and copy your model file
RUN mkdir -p /data
COPY objectbox/ /data/

# Optional: Set working dir or permissions
WORKDIR /data

