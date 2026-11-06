# 04 · Forks

**Goal:** distinguish the repository you copy from the folder on your computer.

| Word | What it is |
|---|---|
| Repository | Project files plus their Git history |
| Clone | A local copy of a repository, usually connected to a remote named `origin` |
| Branch | A line of work inside one repository |
| Fork | A separate GitHub repository under another account, connected to its upstream source |

## When you cannot push to the original

1. Open the original project on GitHub and choose **Fork**.
2. Clone the copy under your account. In your clone, `origin` now points to your fork.
3. Add the original repository as `upstream` if you need to fetch its updates:

   ```powershell
   git remote -v
   git remote add upstream https://github.com/charlieafoxtrot/git-learn.git
   git fetch upstream
   ```

4. Create a topic branch, make and commit your change, then push it to `origin` (your fork).
5. Open a pull request with the original repository's `main` as the base and your fork branch as the head.

You can follow this lesson as a map without making another account. The owner of this practice repo should use a normal branch for direct practice; a fork is for a separate copy or contribution without write access.
