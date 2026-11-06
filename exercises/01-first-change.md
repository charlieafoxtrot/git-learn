# 01 · Your first change

**Goal:** make one small change on a branch, publish it, and propose it with a pull request.

> If you own this practice repository or have write access, use the direct route below. If you do not have write access, first [fork the repository](04-forks.md), clone your fork, and push to your fork instead.

## 1. Check where you are

In GitHub Desktop, confirm the current repository and branch. In PowerShell, run:

```powershell
git status
```

Continue when you are in this clone and the working tree is clean. If Git lists work you want to keep, stop and resolve that before switching branches.

## 2. Start a focused branch

Select or update `main`, then create a branch for this one practice change:

```powershell
git switch main
git pull --ff-only origin main
git switch -c practice/edit-story
```

In GitHub Desktop, select **Current Branch → New Branch**, name it `practice/edit-story`, and create it from `main`.

## 3. Change a practice file

Open [`../practice/story.md`](../practice/story.md) in your editor. Change the sentence beginning **A tiny change:** to a short sentence of your own.

Review your work:

```powershell
git status
git diff
```

GitHub Desktop shows the changed file and a line-by-line diff in **Changes**.

## 4. Stage and commit

Stage only the story file and review the staged snapshot:

```powershell
git add -- practice/story.md
git diff --staged
```

If the staged change is the one you intended, commit it:

```powershell
git commit -m "practice: edit the sample story"
```

In GitHub Desktop, select the changed file, enter a short summary, and choose **Commit to practice/edit-story**.

## 5. Push and open a pull request

Publish the branch to GitHub:

```powershell
git push -u origin practice/edit-story
```

In GitHub Desktop, choose **Publish branch**. Then open the repository on GitHub and create a pull request:

- **Base:** `main`
- **Compare/head:** `practice/edit-story`
- Describe the one sentence you changed.

Inspect **Files changed** before merging. If you have another person available, ask them to review the diff. If you are practicing alone, use this as a safe tour of the pull request page and its merge controls.

## 6. Merge and tidy up

After the pull request is merged on GitHub, update local `main`:

```powershell
git switch main
git pull --ff-only origin main
```

GitHub may offer to delete the remote topic branch as part of merging. You can leave the local topic branch in place while learning; tidy it up later after checking that the PR merged and that you no longer need the branch.
