# Architecture

Read this before changing the framework. It explains how the pieces fit and which design decisions must be preserved. Naming and formatting rules live in [CONVENTIONS.md](CONVENTIONS.md).

## Overview

```
Request
   │
   ▼
orchestrator            routes and enforces global rules; holds no workflow
   │
   ▼
using-skills            Routes table + Skills table
   │
   ├── route-code ──────► planner, implementer, reviewer
   ├── route-research ──► researcher, synthesizer
   └── route-...        (future routes)
```

## Layers

| Layer | Location | Responsibility |
|---|---|---|
| Entry point | `agents/orchestrator.agent.md` | Pick a route, delegate, enforce global rules |
| Router | `skills/using-skills/SKILL.md` | Map a task to one route and to the skills that apply |
| Routes | `skills/route-*/SKILL.md` | The full workflow for one kind of task |
| Skills | `skills/<name>/SKILL.md` | Reusable practices used by routes and agents |
| Agents | `agents/*.agent.md` | Workers with a narrow scope and a defined deliverable |
| Prompts | `prompts/*.prompt.md` | Reusable entry texts that trigger a route |
| Templates | `templates/` | Starting points for new agents and skills |

## Design decisions (do not break these)

1. **The orchestrator stays thin.** It contains no route logic. New workflows go into route skills, never into the orchestrator.
2. **One route per task.** Routes are chosen in `using-skills`. If none fits, the orchestrator asks the user instead of improvising.
3. **Routes load on demand.** Only the chosen route and the skills it needs are loaded, to keep context small.
4. **Agents have one narrow job.** They do not overlap, and they do not hold workflow logic. The route decides who runs and when.
5. **Skills are referenced, not copied.** If text is needed in two places, put it in a skill and link to it.
6. **Evidence before "done".** Every route ends with `verification-before-completion`. Research output additionally follows `cited-research`.
7. **Parallel agents must not collide.** Agents that edit files use `worktree-per-agent`. Read-only agents (researchers) need no isolation.
9. **Reference by name, not by path.** Agents, skills, and prompts refer to each other by name so they work once installed globally or in another project.
10. **Everything is written in English.**

## Known risks

- **Silent routing failure.** If a route skill is not loaded, steps are skipped without an error. The orchestrator rule "do not start work until a route is loaded" mitigates this.
- **Vague descriptions.** Agents pick skills by their `description`. State both purpose and trigger.
- **Drift between tables.** `registry.md`, `using-skills`, and `README.md` list the same things. Update them together.

## How to extend

| To add | Do this |
|---|---|
| A route | Create `skills/route-<name>/SKILL.md` from `templates/SKILL.md`; add a row to the Routes table in `using-skills` and to `README.md`. Do not edit the orchestrator. |
| A skill | Create `skills/<name>/SKILL.md`; add a row to the Skills table in `using-skills` and to `README.md`. |
| An agent | Create `agents/<name>.agent.md` from `templates/agent.agent.md`; add a row to `REGISTRY.md`. List it under "Agents used" in the route that calls it. |
| A prompt | Create `prompts/<name>.prompt.md` that points to a route; add a row to `README.md`. |

## Changing this document

Update it in the same pull request as any change that affects the layers, the design decisions, or the extension steps.
