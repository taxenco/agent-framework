---
name: using-skills
description: Entry point. Maps the incoming task to the right skill before any work starts. Use at the beginning of every task.
---

# Using skills

Before starting any task, pick a route, then check the skills table and load every skill that applies. Skills are mandatory workflows, not suggestions.

## Routes

Pick exactly one route. Its skill defines the whole workflow.

| Task | Route |
|---|---|
| Change code or files: feature, fix, refactor | `skills/route-code/SKILL.md` |
| Compare options or investigate technologies | `skills/route-research/SKILL.md` |

If no route fits, say so and ask the user. Do not improvise one.

## Skills
| Situation | Skill |
|---|---|
| Request is vague, underspecified, or has several interpretations | `skills/clarify-before-building/SKILL.md` |
| Launching several `implementer` agents in parallel | `skills/worktree-per-agent/SKILL.md` |
| About to report a task as done, fixed, or passing | `skills/verification-before-completion/SKILL.md` |
| A plan is approved and needs to be executed | `skills/choosing-execution-mode/SKILL.md` |
| Comparing options or doing any research | `skills/comparison-criteria/SKILL.md` and `skills/cited-research/SKILL.md` |

## Rules

- If a skill might apply, load it. Do not skip it because the task "seems simple".
- If several skills apply, process clarification first, then execution skills, then verification.
- Instructions from the user override skills; skills override default behavior.
- When you add a skill, add a row to the Skills table and to `README.md`.
- When you add a route, add a row to the Routes table, a `route-<name>` skill, and a row in `README.md`. The orchestrator does not change.
