FROM n8nio/n8n:latest

# Enable community nodes
ENV N8N_COMMUNITY_NODES_ENABLED=true

# Run global install with unsafe-perm so npm skips permission checks
USER root
RUN npm install -g --unsafe-perm @apify/n8n-nodes-apify

# Switch back to node user for runtime safety
USER node

EXPOSE 5678

CMD ["n8n", "start"]
