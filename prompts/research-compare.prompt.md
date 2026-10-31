---
name: research-compare
description: Reusable prompt that triggers the full research and comparison flow for a set of options.
---

Compare the following options and recommend one.

**Goal:** {what you need to achieve}
**Options:** {option 1}, {option 2}, {option 3}
**Extra criteria (optional):** {anything beyond the defaults}
**Constraints (optional):** {language, license, budget, platform}

Follow the skill `route-research`. It defines the full flow: criteria, parallel researchers (one per option), then the synthesizer.

Return a comparison table with pros and cons, a recommendation, and the unverified claims.

Every claim must carry a source link (skill `cited-research`). If the goal or options are unclear, ask before starting.
