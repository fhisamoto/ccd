FROM node:24-alpine

ENV HOME=/root
ENV PATH="/root/.local/bin:$PATH"

RUN \
    apk add --no-cache ca-certificates git github-cli bash wget curl python3 py3-pip uv

RUN \
    npm install -g @anthropic-ai/claude-code

RUN \
    uv tool install ruff && \
    uv tool install pyright

RUN \
    mkdir -p /workspace

WORKDIR /workspace

CMD ["claude"]