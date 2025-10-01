FROM n8nio/n8n:latest

# Enable community nodes
ENV N8N_COMMUNITY_NODES_ENABLED=true

# Switch to root so installations can write to global node_modules
USER root

# Install only-allow so that any npx-only-allow guard script will succeed
RUN npm install -g only-allow

# Install Apify node globally, with unsafe-perm to bypass permission issues
RUN npm install -g --unsafe-perm @apify/n8n-nodes-apify

# Switch back to node user for runtime
USER node

# Expose port
EXPOSE 5678

# Optional healthcheck (recommended)
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost:5678/ || exit 1

# Start n8n
CMD ["n8n", "start"]
