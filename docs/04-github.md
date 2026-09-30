# GitHub

[← Git](03-git.md) · [Back to README](../README.md) · [Next: SQL →](05-sql.md)

## Git versus GitHub

**Git** is the version-control system that records your project history. **GitHub** is a hosted platform built around Git repositories, adding collaboration features such as pull requests, issues, code review, actions/automation, releases, and project pages.

You are, of course, currently reading a guide about GitHub that is intended to be hosted on GitHub. Very efficient use of recursion.

Git works perfectly well without GitHub. GitHub also exposes many features beyond Git itself.

## Core GitHub concepts

### Repository

A hosted project containing Git history plus GitHub-specific settings and collaboration features.

### Pull request (PR)

A proposal to merge changes from one branch into another. A PR provides a place to review the diff, discuss the change, run automated checks, and document why the change exists.

### Issue

A trackable discussion item: bug, task, question, feature request, or planning note. In a student project, issues can turn vague ideas into concrete next steps.

### Fork

A server-side copy of another repository under your account or organisation. Forks are commonly used when contributing to a repository where you cannot directly create branches.

### GitHub Actions

Automation triggered by repository events. For example, every push could run tests or check Markdown links. You do not need Actions to learn Git, but the idea of **continuous integration (CI)** — automatically checking changes — is worth recognising.

## A good student repository

A project does not need to be enormous to be impressive. It needs to be understandable. A strong README usually answers:

- What question does this project address?
- Where did the data come from?
- How can someone reproduce the environment?
- How do they run the analysis or pipeline?
- What did you learn or conclude?
- What are the limitations?

Avoid uploading unexplained notebooks named `final_v2_really_final.ipynb` and expecting the reader to reconstruct the story.

## Typical collaboration flow

1. Update your local `main`.
2. Create a feature branch.
3. Make and commit a focused change.
4. Push the branch.
5. Open a pull request.
6. Let automated checks run and ask for review.
7. Address feedback with additional commits.
8. Merge the pull request.
9. Pull the updated `main` locally.

The [GitHub Hello World](https://docs.github.com/en/get-started/using-github/hello-world) exercise walks through repositories, branches, commits, pull requests, and merging.

## GitHub as a learning tool

Reading mature open-source repositories is useful. Look for:

- directory structure;
- README and contribution guides;
- commit messages;
- issue discussions;
- pull-request review conversations;
- tests and automated checks.

You can learn a great deal about professional software/data practices before you are ready to contribute code.

## Resources by level

**Beginner**

- [GitHub Hello World](https://docs.github.com/en/get-started/using-github/hello-world)
- [GitHub Skills](https://skills.github.com/) — short interactive exercises inside GitHub.

**Intermediate**

- [GitHub Docs](https://docs.github.com/) — authoritative reference.
- [GitHub's Git and GitHub learning resources](https://docs.github.com/en/get-started/start-your-journey/git-and-github-learning-resources)

## Practice checkpoint

Create a small repository, open an issue describing one improvement, create a branch for it, make the change, open a pull request that references the issue, then merge it. That one cycle teaches more than memorising a long list of GitHub features.
