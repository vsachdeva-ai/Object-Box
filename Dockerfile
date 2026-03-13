# #FROM objectboxio/sync:sync-server-2026-03-11
# FROM 834719376359.dkr.ecr.us-west-1.amazonaws.com/us-west-1-dev-object-box:sync-server-2026-03-11
# # Create data dir and copy your model file
# RUN mkdir -p /data
# COPY . /data/

# # Optional: Set working dir or permissions
# WORKDIR /data

FROM 834719376359.dkr.ecr.us-west-1.amazonaws.com/us-west-1-dev-object-box:sync-server-2026-03-11

# Create data directory FIRST with correct permissions
RUN mkdir -p /app-model/objectbox && \
    chmod 777 /app-model /app-model/objectbox

# Copy WITH correct ownership/permissions at COPY time (key fix!)
COPY --chown=1000:1000 --chmod=777 objectbox/ /app-model/

# Verify permissions (optional)
RUN ls -la /app-model/

# Run as non-root user
USER 1000:1000

WORKDIR /app-model