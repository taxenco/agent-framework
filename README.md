# agent-framework

A personal collection of agents, prompts, and skills, with an orchestrator that decides when to delegate.

All content in this repository is written in English.

## Structure

```
agents/      # agents (*.agent.md); registry.md is the catalog
prompts/     # reusable prompts (*.prompt.md)
skills/      # one folder per skill, each with a SKILL.md
templates/   # starting points for new agents and skills
```

Rules for adding or changing anything live in [CONVENTIONS.md](CONVENTIONS.md).

## Usage

- Global: copy or link the contents to `~/.copilot/`.
- Per project: copy or link them to the repo's `.github/`.

## Skills

| Skill | Purpose |
|---|---|
| `using-skills` | Entry point; maps a task to the right skill |
| `clarify-before-building` | One-question-at-a-time clarification |
| `choosing-execution-mode` | Sub-agent per task vs inline execution |
| `worktree-per-agent` | Isolated git worktree per parallel agent |
| `verification-before-completion` | Evidence before claiming done |

## Adding an agent

1. Copy `templates/agent.agent.md` to `agents/<name>.agent.md` and fill it in.
2. Register it in `agents/registry.md`.

## License

MIT. See [LICENSE](LICENSE).
