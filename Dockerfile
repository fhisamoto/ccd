FROM node:18-alpine

ENV HOME=/root

RUN \
    apk add --no-cache git github-cli bash wget curl

RUN \
    npm install -g @anthropic-ai/claude-code

RUN \
    mkdir -p /workspace

WORKDIR /workspace

CMD ["claude"]