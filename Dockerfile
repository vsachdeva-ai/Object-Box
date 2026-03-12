#FROM objectboxio/sync:sync-server-2026-03-11
FROM 834719376359.dkr.ecr.us-west-1.amazonaws.com/us-west-1-dev-object-box:sync-server-2026-03-11
# Create data dir and copy your model file
RUN mkdir -p /data
COPY . /data/

# Optional: Set working dir or permissions
WORKDIR /data

