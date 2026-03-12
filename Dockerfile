FROM 123456789012.dkr.ecr.us-east-1.amazonaws.com/objectbox-sync-base:2026-03-11

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
