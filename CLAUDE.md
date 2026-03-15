# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**holo-jina** is an OpenClaw skill that wraps the [Jina AI Reader API](https://jina.ai/reader) (`r.jina.ai`) to fetch web page content as clean Markdown, including paywalled articles and Twitter/X posts.

## Commands

```bash
# Run the skill
bash scripts/jina.sh "https://example.com/article"
bash scripts/jina.sh help

# Run tests (makes real HTTP requests to r.jina.ai)
bash tests/test.sh

# Deploy to OpenClaw (~/.openclaw/skills/holo-jina/)
bash openclaw_deploy_skill.sh
```

## Architecture

This is a pure Bash project with no build step and no dependencies beyond `curl`.

**`scripts/jina.sh`** — The only logic file. It:
1. Checks for an optional API key at `~/.openclaw/credentials/jina_api_key.txt`
2. Prepends `https://r.jina.ai/` to the user-supplied URL
3. Calls `curl -s` with or without an `Authorization: Bearer` header

**`SKILL.md`** — OpenClaw skill definition (YAML frontmatter + usage docs). The `{baseDir}` placeholder in paths is replaced by OpenClaw at runtime with the deployed skill directory (`~/.openclaw/skills/holo-jina`).

**`openclaw_deploy_skill.sh`** — Copies `SKILL.md` and `scripts/` into `~/.openclaw/skills/holo-jina/`. Does not copy `tests/`.

## Key Behaviors

- If the URL lacks an `http(s)://` prefix, `jina.sh` auto-prepends `https://`.
- API key mode (100 RPM) vs. no-key mode (IP-based rate limit) is determined solely by the presence of the credentials file.
- `tests/test.sh` uses `set -e` and exits on first failure; tests make live network calls.
