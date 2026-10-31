---
name: research-compare
description: Reusable prompt that triggers the full research and comparison flow for a set of options.
---

Compare the following options and recommend one.

**Goal:** {what you need to achieve}
**Options:** {option 1}, {option 2}, {option 3}
**Extra criteria (optional):** {anything beyond the defaults}
**Constraints (optional):** {language, license, budget, platform}

Follow this flow:

1. Apply `skills/comparison-criteria/SKILL.md` and confirm the criteria list.
2. Launch one `researcher` per option, in parallel, each with the same criteria.
3. Pass all reports to the `synthesizer`.
4. Return a comparison table with pros and cons, a recommendation, and the unverified claims.

Every claim must carry a source link (`skills/cited-research/SKILL.md`). If the goal or options are unclear, ask before starting.
