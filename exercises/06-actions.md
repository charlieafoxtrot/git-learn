# 06 · GitHub Actions

**Goal:** understand how automated checks connect to a pull request.

GitHub Actions runs automation in response to events such as a push or pull request. A workflow contains one or more jobs; jobs contain steps. When a workflow runs for a pull request, GitHub can show the result beside the proposed changes.

```text
push or pull request
        ↓
workflow starts
        ↓
jobs run steps (for example, build or check files)
        ↓
pass / fail appears with the pull request checks
```

The practice repository does not need automation to teach the basic Git flow. In a real project, the maintainers choose which checks run and whether they must pass before merge. A green check says the configured automation passed; it does not replace a human review.

Read GitHub's [Understanding GitHub Actions](https://docs.github.com/en/actions/about-github-actions/understanding-github-actions) guide for the full workflow model.
