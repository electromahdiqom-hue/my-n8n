FROM n8nio/n8n:latest

# Install dependencies and fix permissions
USER root
RUN apt-get update && apt-get install -y \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Switch back to node user
USER node

# Set environment variables
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=password123
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV NODE_ENV=production

# Create necessary directories
RUN mkdir -p /home/node/.n8n

# Expose port
EXPOSE 5678

# Start n8n
CMD ["n8n", "start"]
