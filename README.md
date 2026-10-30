# agent-framework

A personal collection of agents, prompts, and skills, with an orchestrator that decides when to delegate.

All content in this repository is written in English.

## Structure

```
agents/    # agents (*.agent.md); registry.md is the catalog
prompts/   # reusable prompts (*.prompt.md)
skills/    # one folder per skill, each with a SKILL.md
```

## Usage

- Global: copy or link the contents to `~/.copilot/`.
- Per project: copy or link them to the repo's `.github/`.

## Adding an agent

1. Create `agents/<name>.agent.md` with front matter (`name`, `description`).
2. Register it in `agents/registry.md`.
