---
name: using-skills
description: Entry point. Maps the incoming task to the right skill before any work starts. Use at the beginning of every task.
---

# Using skills

Before starting any task, check this table and load every skill that applies. Skills are mandatory workflows, not suggestions.

| Situation | Skill |
|---|---|
| Request is vague, underspecified, or has several interpretations | `skills/clarify-before-building/SKILL.md` |
| Launching several `implementer` agents in parallel | `skills/worktree-per-agent/SKILL.md` |
| About to report a task as done, fixed, or passing | `skills/verification-before-completion/SKILL.md` |

## Rules

- If a skill might apply, load it. Do not skip it because the task "seems simple".
- If several skills apply, process clarification first, then execution skills, then verification.
- Instructions from the user override skills; skills override default behavior.
- When you add a skill, add a row to this table and to `README.md`.
