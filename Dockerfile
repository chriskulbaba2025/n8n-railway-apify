FROM n8nio/n8n:latest

# Enable community nodes
ENV N8N_COMMUNITY_NODES_ENABLED=true

# Switch to root to install globally
USER root
RUN npm install -g @apify/n8n-nodes-apify

# Switch back to node user for security
USER node

# Expose default n8n port
EXPOSE 5678

# Start n8n
CMD ["n8n", "start"]

