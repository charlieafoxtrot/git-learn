# 03 · Review and a safe conflict

**Goal:** see why pull requests use a diff and what a conflict asks you to decide.

## Review in a pull request

A pull request proposes merging a **head** branch into a **base** branch. Read the description, open **Files changed**, and compare the proposed edits with the goal. A comment or requested change is feedback; the author responds by editing the same topic branch and pushing another commit.

## Create a deliberate local conflict

This exercise creates a throwaway sample file and two local branches. It does not push or alter the shared `main` branch. Start from clean `main`:

```powershell
git status
git switch main
git pull --ff-only origin main
```

Create the common starting line on `main` and commit it:

```powershell
Set-Content practice\shared-note.txt 'The shared line says: hello.'
git add -- practice/shared-note.txt
git commit -m "practice: add a shared note"
```

Create branch A and change the line:

```powershell
git switch -c practice/conflict-a
Set-Content practice\shared-note.txt 'The shared line says: good morning.'
git add -- practice/shared-note.txt
git commit -m "practice: change the note in branch A"
```

Create branch B from the common starting point and change the same line differently:

```powershell
git switch main
git switch -c practice/conflict-b
Set-Content practice\shared-note.txt 'The shared line says: good afternoon.'
git add -- practice/shared-note.txt
git commit -m "practice: change the note in branch B"
```

Bring B into A locally to see Git report a conflict:

```powershell
git switch practice/conflict-a
git merge practice/conflict-b
git status
```

Git stops because both branches changed the same line. Open `practice/shared-note.txt`, choose a final sentence, and remove the conflict marker lines (`<<<<<<<`, `=======`, `>>>>>>>`). Then inspect and complete the merge:

```powershell
git diff
git add -- practice/shared-note.txt
git diff --staged
git commit -m "practice: resolve the shared note"
```

Nothing was pushed. If your status or conflict screen differs from these steps, pause and ask for help instead of trying a reset or force push.
