---
name: choosing-execution-mode
description: Chooses how to run an approved plan: one fresh sub-agent per task with review (thorough) or inline execution with one final review (cheap). Use after a plan exists.
---

# Choosing execution mode

Pick one mode per plan and state the choice with a one-line reason.

| Mode | How it works | Use when |
|---|---|---|
| Sub-agent per task | A fresh `implementer` per task, `reviewer` after each task | Risky or large changes, many files, tasks that can run in parallel |
| Inline | Orchestrator does every task itself, one `reviewer` pass on the whole result at the end | Small, tightly coupled, or low-risk changes; cost matters |

## Rules

- Default to inline for plans with ≤3 tasks.
- Default to sub-agent per task for plans with parallel tasks or security-sensitive code.
- In sub-agent mode, apply the skill `worktree-per-agent` when tasks run in parallel.
- In both modes, finish with the skill `verification-before-completion`.
