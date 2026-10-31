---
name: route-research
description: Route for comparing options or investigating technologies, with parallel researchers and a sourced comparison table. Triggered by the research-compare prompt.
---

# Route: research

Triggered by the prompt `research-compare` or any request to compare options.

## Steps
1. If the goal or options are unclear, apply the skill `clarify-before-building`.
2. Apply the skill `comparison-criteria` and fix one criteria list for all options.
3. Launch one `researcher` per option, in parallel (max. 5), each with the same criteria. Researchers only read, so no worktrees are needed.
4. Pass all reports to the `synthesizer`.
5. Check the result against the skill `cited-research`: every claim has a source link, each measurable fact has a retrieval date, the claims behind the recommendation are marked verified, corrected, or not verified, and unverified claims are listed. Send it back to the `synthesizer` if not.
6. If a researcher fails or returns no sources, retry once, then report the option as "not researched".

## Agents used
`researcher`, `synthesizer`
