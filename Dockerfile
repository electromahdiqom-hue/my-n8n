FROM n8nio/n8n:1.40.1

# محیط‌های لازم
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=YourPassword123
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV NODE_ENV=production

EXPOSE 5678

# استفاده از دستور مستقیم
CMD ["n8n", "start"]
