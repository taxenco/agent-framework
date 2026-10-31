# Conventions

These rules are the stable foundation of the repository. Change them deliberately, not casually.

## Language
All content is written in English.

## Layout
- `agents/<name>.agent.md` — one agent per file.
- `skills/<name>/SKILL.md` — one folder per skill.
- `prompts/<name>.prompt.md` — one reusable prompt per file.
- `templates/` — starting points for new agents and skills.

## Naming
- Lowercase kebab-case for files, folders, and the `name` field.
- The `name` field must match the file or folder name.

## Front matter
Every agent and skill starts with:

```yaml
---
name: <kebab-case-name>
description: <one sentence: what it does and when to use it>
---
```

The description is what routes the agent to the file, so state both purpose and trigger.

## Design rules
- One responsibility per agent or skill.
- Skills are workflows with steps and rules, not essays. Keep them short.
- Agents never overlap in scope; if two do, merge or split them.
- Prefer referencing a skill over copying its text into an agent.

## Registration
- New agent: add a row to `agents/registry.md`.
- New skill: add a row to `skills/using-skills/SKILL.md` and to the table in `README.md`.

## Changes
- Work on a branch and merge through a pull request.
- One logical change per pull request.
