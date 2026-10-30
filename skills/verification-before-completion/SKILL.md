---
name: verification-before-completion
description: Requires fresh evidence (tests, build, lint) before any task is reported as done. Use before claiming success, fixed, or passing.
---

# Verification before completion

No claim of success without evidence produced in this session.

## Steps

1. Identify the commands that prove the claim (tests, build, lint, type check, manual run).
2. Run them now. Do not rely on earlier runs or on what an agent reported.
3. Read the full output. Check exit codes and failure counts.
4. Report the result with the command and the outcome.

## Red flags (stop and verify)

- Saying "should work", "probably fixed", or "looks good".
- Trusting a sub-agent's "done" without checking its changes.
- Skipping, deleting, or silencing a failing test, lint rule, or check to get green. This is never acceptable; fix the cause or report the failure.
- Verifying only the part you changed and not the surrounding tests.

## When no checks exist

State that explicitly, describe what you did to verify manually, and flag the gap.
