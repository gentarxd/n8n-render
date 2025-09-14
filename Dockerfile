FROM n8nio/n8n:latest

USER root

# 1. Install Chromium (for Alpine base image)
RUN apk add --no-cache chromium nss freetype harfbuzz ca-certificates ttf-freefont

# 2. Install puppeteer globally so community nodes (WhatsApp Web Connect) can use it
RUN npm install -g puppeteer

# 3. Environment variables so puppeteer uses system chromium
ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Important: switch back to non-root n8n user
USER node
