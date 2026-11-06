# Git Learn

A small, safe practice repository for learning Git and GitHub by doing.

## Start here

1. Clone this repository with GitHub Desktop or Git CLI.
2. Double-click `Start-GuidePreview.cmd`. It opens the guide at `http://localhost:52678/` and leaves the server running in the background.
3. Open `exercises/01-first-change.md` and follow one change from branch to pull request.
4. Return here for the optional lessons on history, conflicts, forks, worktrees, and Actions.

You can also open [the HTML guide directly](github-development-workflow-howto.html), but that opens it as a local file (`file://`). The launcher serves the same guide as a local website. Double-click `Stop-GuidePreview.cmd` when you want to stop the server. The preview listens only on your own computer; it is not published to the internet.

This repository is a sandbox. Its text files are examples; they are not connected to ProviderDev or any production project.

## Clone it

**GitHub Desktop:** choose **File → Clone Repository**, select the **URL** tab, enter `https://github.com/charlieafoxtrot/git-learn.git`, choose where to save it, then select **Clone**.

**PowerShell:** choose a parent folder for the local copy, then clone:

```powershell
Set-Location C:\git
git clone https://github.com/charlieafoxtrot/git-learn.git
Set-Location .\git-learn
git status
```

Git names the GitHub location `origin` when it creates a clone. `origin/main` is your local record of the remote `main` branch.

## Lessons

| Lesson | Practice |
|---|---|
| [01 · First change](exercises/01-first-change.md) | Branch, edit, inspect, commit, push, and open a pull request |
| [02 · Branches and history](exercises/02-branches-and-history.md) | Create a second branch and read the commit graph |
| [03 · Review and conflict](exercises/03-review-and-conflict.md) | Understand review and safely resolve an intentional conflict |
| [04 · Forks](exercises/04-forks.md) | Compare a fork with a clone and a branch |
| [05 · Worktrees](exercises/05-worktrees.md) | Work on a second branch in a second folder |
| [06 · Actions](exercises/06-actions.md) | See how automated checks appear on a pull request |

## Before you push

- Run `git status` and confirm the current branch is the one you mean to publish.
- Read `git diff` and `git diff --staged` before committing.
- If you cannot push to this repository, fork it on GitHub and clone your fork. Open a pull request from your fork back to this repository.
- Never put passwords, access tokens, customer data, or private project files in this public practice repository.
