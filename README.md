# Claude Code in Docker

Run [Claude Code](https://docs.anthropic.com/en/docs/claude-code) inside a Docker container, keeping your host machine clean while persisting configuration across sessions.

## Quick Start

Add an alias to your shell profile so you can launch Claude Code from any project directory:

```bash
alias ccd='WORKSPACE_PATH=$(pwd) docker compose -f /path/to/ccd/compose.yaml run --rm claude'
```

Then just run `ccd` from any project:

```bash
cd ~/src/my-project
ccd
```

On first run you'll be prompted to authenticate. Your credentials and settings are stored in `claude_home/` and persist across containers.

## How It Works

The container mounts two volumes:

- **`claude_home` -> `/root`** — Persists Claude's auth, settings, and memory between sessions
- **`WORKSPACE_PATH` -> `/workspace`** — The project directory Claude operates on (defaults to `.` if unset)

## Configuration

To use an API key instead of interactive auth, uncomment the environment variables in `compose.yaml`:

```yaml
environment:
  - ANTHROPIC_API_KEY=your-key-here
  - ANTHROPIC_BASE_URL=https://custom-host/anthropic
```
