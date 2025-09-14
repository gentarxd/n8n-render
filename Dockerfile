FROM n8nio/n8n:latest

# Install chromium
USER root
RUN apt-get update && apt-get install -y chromium \
    && rm -rf /var/lib/apt/lists/*

# Set puppeteer to use system chromium
ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Switch back to n8n user (important)
USER node
