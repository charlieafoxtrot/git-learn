# 02 · Branches and history

**Goal:** see how a second branch keeps a different idea separate from the first.

Start from a clean, current `main`:

```powershell
git status
git switch main
git pull --ff-only origin main
git switch -c practice/second-idea
```

Create a short note in `practice/ideas.md`, then inspect, stage, and commit it:

```powershell
git status
git diff
git add -- practice/ideas.md
git diff --staged
git commit -m "practice: save a second idea"
```

See the branch and recent commits:

```powershell
git branch --list
git log --oneline --graph --decorate --all -12
```

The branch name is a movable label for a line of work. The commit is the saved snapshot. Each branch can have its own commits while sharing earlier history.

Return to `main` to see that the unmerged idea is separate:

```powershell
git switch main
git log --oneline --decorate -5
```

Switch back to `practice/second-idea` to continue it. When you no longer need the unmerged practice commit, keep it as a history example or ask for help before deleting it; Git will protect unmerged work from an ordinary `git branch -d`.
