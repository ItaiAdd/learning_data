# Git

[← Bash](02-bash.md) · [Back to README](../README.md) · [Next: GitHub →](04-github.md)

## What is Git?

Git is a **distributed version control system**: it records snapshots of a project over time and lets each developer keep a full local copy of the repository history. Version control answers questions such as “what changed?”, “who changed it?”, and “can I get the old version back?”.

Git was created in 2005 for Linux kernel development after the kernel community's relationship with the proprietary BitKeeper system broke down. The official [short history of Git](https://git-scm.com/book/en/v2/Getting-Started-A-Short-History-of-Git) is worth reading because it explains why speed, distributed work, and cheap branching were central goals.

## Why is Git useful in data work?

Data work contains code, SQL, configuration, documentation, experiments, and infrastructure definitions. Git gives those artifacts a history and makes collaboration reviewable.

Do **not** treat Git as a database backup for huge raw datasets. Version code and small reference data; store large datasets in systems designed for data and record how to obtain them.

## The mental model

Three areas matter at first:

1. **Working tree** — files you are editing now.
2. **Staging area** — the exact changes selected for the next commit.
3. **Repository history** — committed snapshots.

The basic loop is:

```text
edit → git status → git add → git commit → repeat
```

The [Pro Git chapter on recording changes](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository) explains this in depth.

## Commits

A **commit** is a recorded snapshot plus metadata such as an author, time, and message. Good commits are small enough that another person can understand why the change happened.

```bash
git status
git add analysis.py
git commit -m "Calculate weekly retention"
```

`git add` is better thought of as “put this version of this content into the next commit,” not simply “tell Git this file exists.”

## Branches

A **branch** is a movable name pointing at a commit. Branches let you work on an idea without immediately changing the main line of development.

```bash
git switch -c feature/add-summary-table
# edit files
git add report.py
git commit -m "Add summary table"
```

Git branches are intentionally lightweight. See [Branches in a Nutshell](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell).

## A simple Git flow

A common team pattern is:

```text
main
  └── create feature branch
        └── make one or more commits
              └── push branch
                    └── open pull request
                          └── review + merge into main
```

This is often called **GitHub Flow** when pull requests on GitHub are part of the collaboration model. It is simpler than the older workflow sometimes called “Git Flow,” which uses long-lived develop/release branches. For student projects, simple short-lived feature branches are usually enough.

## Complete example: local repo → remote → feature branch → merge

This example assumes Git is installed and you have configured your name/email.

### 1. Create the project

```bash
mkdir student-data-project
cd student-data-project

git init -b main

printf '# Student Data Project\n' > README.md
printf 'name,score\nAva,82\nNoah,76\nMina,91\n' > scores.csv

git status
git add README.md scores.csv
git commit -m "Create initial student score dataset"
```

### 2. Create an empty remote repository on GitHub

Create a repository named `student-data-project` on GitHub. If you already created local files, create the GitHub repository **without** adding another README so the histories do not need reconciling.

Connect the local repository. SSH is shown here; HTTPS also works:

```bash
git remote add origin git@github.com:YOUR-USERNAME/student-data-project.git
git remote -v
git push -u origin main
```

`origin` is just the conventional local nickname for the remote repository.

### 3. Create a feature branch

```bash
git switch -c feature/add-analysis
```

Create `analysis.py`:

```python
import csv

with open("scores.csv", newline="") as f:
    rows = list(csv.DictReader(f))

scores = [int(row["score"]) for row in rows]
print(f"Average: {sum(scores) / len(scores):.1f}")
```

Run it:

```bash
python analysis.py
```

### 4. Stage and commit the change

```bash
git status
git diff
git add analysis.py
git diff --staged
git commit -m "Add average score analysis"
```

### 5. Push the feature branch

```bash
git push -u origin feature/add-analysis
```

### 6. Open a pull request on GitHub

Compare `feature/add-analysis` with `main`, explain what changed, review the diff, and merge when it is ready. See [GitHub's Hello World exercise](https://docs.github.com/en/get-started/using-github/hello-world) for the pull-request workflow.

### 7. Update your local `main`

```bash
git switch main
git pull
git branch -d feature/add-analysis
```

You have now completed a full feature-branch cycle.

## Commands worth knowing early

| Command | Purpose |
|---|---|
| `git status` | Show branch and changed/staged/untracked files. |
| `git diff` | Show unstaged changes. |
| `git diff --staged` | Show what will go into the next commit. |
| `git add <path>` | Stage selected content. |
| `git commit -m "..."` | Record staged changes. |
| `git log --oneline --graph --decorate --all` | Visualise commit history in the terminal. |
| `git switch <branch>` | Move to another branch. |
| `git switch -c <branch>` | Create and switch to a branch. |
| `git pull` | Fetch remote changes and integrate them into the current branch. |
| `git push` | Send local commits to a remote. |
| `git restore <file>` | Restore working-tree content; read the help before using it on work you care about. |

## `.gitignore`

A `.gitignore` file tells Git which untracked files it should normally ignore. Common examples in data projects include virtual environments, secrets, cache directories, generated outputs, and large local datasets.

Never commit API keys, passwords, or cloud credentials. Adding a secret to `.gitignore` **after** committing it does not erase it from Git history.

## Resources by level

**Beginner**

- [GitHub: About Git](https://docs.github.com/en/get-started/using-git/about-git) — approachable explanation of Git and repositories.
- [GitHub Hello World](https://docs.github.com/en/get-started/using-github/hello-world) — interactive repository/branch/commit/pull-request flow.
- [Learn Git Branching](https://learngitbranching.js.org/) — visual, interactive practice.

**Intermediate / reference**

- [Pro Git](https://git-scm.com/book/en/v2) — free, comprehensive book.
- [GitHub's Git learning resources](https://docs.github.com/en/get-started/start-your-journey/git-and-github-learning-resources) — curated official list of interactive courses and references.
- [The Missing Semester](https://missing.csail.mit.edu/) — includes a student-friendly version-control lecture and practical tooling context.

## Practice checkpoint

Repeat the complete example without copying commands line-by-line. Deliberately make two feature branches that edit different files and merge both. Then try two branches that edit the same line so you can see a merge conflict in a safe toy repository.
