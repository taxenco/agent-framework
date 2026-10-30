---
name: worktree-per-agent
description: Gives each parallel agent its own git worktree and branch to avoid file conflicts. Use when launching several implementer agents at once.
---

# Worktree per agent

Every agent that edits code in parallel works in an isolated worktree, never in the main checkout.

## Create (orchestrator, before launching the agent)

```bash
git worktree add ../wt-<task> -b agent/<task> main
```

- One worktree and one branch per agent: `agent/<task>`.
- The agent's prompt must state its path `../wt-<task>` as the working directory.

## Rules for the agent

- Work only inside its worktree and touch only the assigned files.
- Make small commits on its branch; never push to `main`.
- Run the relevant tests before finishing.
- Deliverable: branch name and a summary of the changes.

## Integrate (orchestrator)

1. Run the `reviewer` on each branch.
2. Merge one at a time: `git merge --no-ff agent/<task>`.
3. Run tests after each merge; if there is a conflict, resolve it yourself, not the agent.

## Clean up

```bash
git worktree remove ../wt-<task>
git branch -d agent/<task>
```

## When not to use it

Single-agent tasks or changes of ≤2 files: work directly on the current branch.
