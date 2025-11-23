FROM n8nio/n8n:1.40.1

USER root

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Switch to node user
USER node

# Set environment variables
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=password123
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV NODE_ENV=production
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Create config directory
RUN mkdir -p /home/node/.n8n

EXPOSE 5678

# Use the correct command
CMD ["/usr/local/bin/n8n", "start"]
