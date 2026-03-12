# #FROM objectboxio/sync:sync-server-2026-03-11
# FROM 834719376359.dkr.ecr.us-west-1.amazonaws.com/us-west-1-dev-object-box:sync-server-2026-03-11
# # Create data dir and copy your model file
# RUN mkdir -p /data
# COPY . /data/

# # Optional: Set working dir or permissions
# WORKDIR /data

FROM 834719376359.dkr.ecr.us-west-1.amazonaws.com/us-west-1-dev-object-box:sync-server-2026-03-11

# Create data directory with correct permissions for ObjectBox
RUN mkdir -p /data/objectbox && \
    chmod 755 /data && \
    chmod 777 /data/objectbox

# Copy your files (non-root user safe)
COPY objectbox/ /data/

# Fix all permissions recursively for ObjectBox
RUN chmod -R 777 /data && \
    chown -R 1000:1000 /data

# Switch to non-root user (ObjectBox expects this)
USER 1000:1000

WORKDIR /data
