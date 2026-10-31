---
name: route-code
description: Route for changing code or files: features, fixes, refactors. Decides between solving directly, planning, and parallel implementation.
---

# Route: code

## Steps
1. Small task (≤2 files, unambiguous): solve it yourself, without delegating.
2. Vague request: apply the skill `clarify-before-building` first.
3. Large or ambiguous task: run `planner` first.
4. With an approved plan, apply the skill `choosing-execution-mode`.
5. Independent parts in sub-agent mode: one `implementer` per part, in parallel (max. 3), applying the skill `worktree-per-agent`.
6. Dependent parts: chain them in sequence.
7. Every significant change goes through `reviewer`.
8. Finish with the skill `verification-before-completion`.

## Agents used
`planner`, `implementer`, `reviewer`
