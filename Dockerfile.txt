FROM n8nio/n8n:latest

ENV N8N_COMMUNITY_NODES_ENABLED=true

RUN npm install -g @apify/n8n-nodes-apify

EXPOSE 5678

CMD ["n8n", "start"]
