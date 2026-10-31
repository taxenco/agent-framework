# agent-framework

A personal collection of agents, prompts, and skills, with an orchestrator that decides when to delegate.

All content in this repository is written in English.

## Structure

```
agents/      # agents (*.agent.md) only
prompts/     # reusable prompts (*.prompt.md)
skills/      # one folder per skill, each with a SKILL.md
templates/   # starting points for new agents and skills
scripts/     # install.ps1 links agents and skills into ~/.copilot
REGISTRY.md  # catalog of agents
```

Rules for adding or changing anything live in [CONVENTIONS.md](CONVENTIONS.md). How the pieces fit together is in [ARCHITECTURE.md](ARCHITECTURE.md); read it before changing the framework.

## Usage

- Global (recommended): run `.\scripts\install.ps1`. It links `agents/` and each skill into `~/.copilot/` with junctions, so edits in this repo apply immediately. Re-run it after adding a skill or moving the repo.
- Per project: copy or link `agents/` and `skills/` to the repo's `.github/agents` and `.github/skills`.
- Prompts are plain text: copy the contents of a file from `prompts/`, fill in the placeholders, and paste it into the chat.

## Skills

| Skill | Purpose |
|---|---|
| `route-code` | Route for code changes (plan, implement, review) |
| `route-research` | Route for comparing options (parallel researchers, synthesizer) |
| `using-skills` | Entry point; maps a task to the right skill |
| `clarify-before-building` | One-question-at-a-time clarification |
| `choosing-execution-mode` | Sub-agent per task vs inline execution |
| `worktree-per-agent` | Isolated git worktree per parallel agent |
| `verification-before-completion` | Evidence before claiming done |
| `comparison-criteria` | Fixed criteria so every option is judged equally |
| `cited-research` | Every claim carries a source link |

## Prompts

| Prompt | Purpose |
|---|---|
| `research-compare` | Triggers the full compare-options flow (`route-research`) |

## Adding an agent

1. Copy `templates/agent.agent.md` to `agents/<name>.agent.md` and fill it in.
2. Register it in `REGISTRY.md`.

## License

MIT. See [LICENSE](LICENSE).
