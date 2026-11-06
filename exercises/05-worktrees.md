# 05 · Worktrees

**Goal:** keep two branches checked out in two folders from the same local repository.

A branch is a line of history. A worktree is an additional working folder attached to the same local repository. It is useful when you want to pause one task and inspect or work on another without switching the original folder.

Start in the main `git-learn` folder and check that your current work is safe:

```powershell
git status
git worktree list
```

Create a second folder and a new branch based on `main`:

```powershell
git worktree add -b practice/parallel-note ..\git-learn-parallel main
git worktree list
```

Open `C:\git\git-learn-parallel` in another editor window. It shares repository history with `C:\git\git-learn`, but checks out `practice/parallel-note`. Make a small change there if you like. A branch can be checked out in only one worktree at a time.

When finished, first preserve any work you want to keep. Then return to the main clone and remove the clean linked folder:

```powershell
Set-Location C:\git\git-learn
git status
git worktree remove ..\git-learn-parallel
git worktree list
```

Removing the worktree folder does not automatically delete its branch. Do not force removal if Git says the folder has uncommitted changes; inspect the status and preserve the work first.
