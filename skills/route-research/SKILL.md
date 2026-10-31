---
name: route-research
description: Route for comparing options or investigating technologies, with parallel researchers and a sourced comparison table. Triggered by the research-compare prompt.
---

# Route: research

Triggered by `prompts/research-compare.prompt.md` or any request to compare options.

## Steps
1. If the goal or options are unclear, apply `skills/clarify-before-building/SKILL.md`.
2. Apply `skills/comparison-criteria/SKILL.md` and fix one criteria list for all options.
3. Launch one `researcher` per option, in parallel (max. 5), each with the same criteria. Researchers only read, so no worktrees are needed.
4. Pass all reports to the `synthesizer`.
5. Check the result against `skills/cited-research/SKILL.md`: every claim has a source link and unverified claims are listed. Send it back to the `synthesizer` if not.
6. If a researcher fails or returns no sources, retry once, then report the option as "not researched".

## Agents used
`researcher`, `synthesizer`
