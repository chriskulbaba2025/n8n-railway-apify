FROM n8nio/n8n:latest

# Enable community nodes
ENV N8N_COMMUNITY_NODES_ENABLED=true

# Install Apify node as root with unsafe-perm
USER root
RUN npm install -g --unsafe-perm @apify/n8n-nodes-apify

# Switch back to non-root user for safety
USER node

# Expose default n8n port
EXPOSE 5678

# Add healthcheck (Railway will auto-restart if n8n is unresponsive)
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost:5678/ || exit 1

# Start n8n
CMD ["n8n", "start"]
