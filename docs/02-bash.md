# Bash & the Command Line

[← Python](01-python.md) · [Back to README](../README.md) · [Next: Git →](03-git.md)

## What is the command line?

A **terminal** is the window or application through which you interact with a **shell**. A shell is a program that reads commands and runs other programs. Bash (the “Bourne Again SHell”) is one widely used shell on Unix-like systems.

The [GNU Bash manual](https://www.gnu.org/software/bash/manual/) describes Bash as both a command interpreter and a programming language. That second part matters: commands can be combined into scripts to automate work.

## Why should a data student care?

Many data tools are designed to be run from a shell. Cloud virtual machines, Docker containers, Git, Python environments, schedulers, database clients, and build systems frequently expose command-line interfaces. The shell also makes it easy to connect small tools together.

If a task must eventually run unattended at 3 a.m., knowing how to run it without clicking through a graphical interface is valuable.

## A tiny example

Suppose a directory contains several CSV files:

```bash
ls *.csv
wc -l *.csv
```

The first command lists matching CSV files. The second counts their lines.

You can redirect output to a file:

```bash
wc -l *.csv > line_counts.txt
```

Or pipe (`|`) the output of one command into another:

```bash
cat line_counts.txt | sort -n
```

A pipe is one of the most important shell ideas: **small programs can be composed**.

## Common commands

| Command | Purpose | Example |
|---|---|---|
| `pwd` | Print the current directory. | `pwd` |
| `ls` | List directory contents. | `ls -lah` |
| `cd` | Change directory. | `cd projects/my-analysis` |
| `mkdir` | Create a directory. | `mkdir data` |
| `touch` | Create an empty file/update timestamp. | `touch notes.md` |
| `cp` | Copy files/directories. | `cp source.csv backup.csv` |
| `mv` | Move or rename. | `mv old.csv archive/` |
| `rm` | Remove files. Be careful: there is usually no recycle bin. | `rm temporary.csv` |
| `cat` | Print/concatenate file contents. | `cat README.md` |
| `less` | Page through long text. | `less large.log` |
| `head` | Show the first lines. | `head -n 5 data.csv` |
| `tail` | Show the last lines; `-f` follows a growing log. | `tail -f job.log` |
| `grep` | Search text for a pattern. | `grep -i "error" job.log` |
| `find` | Find files by name/properties. | `find . -name '*.parquet'` |
| `sort` | Sort lines of text. | `sort names.txt` |
| `uniq` | Collapse adjacent duplicate lines; often paired with `sort`. | `sort names.txt | uniq -c` |
| `wc` | Count lines, words, or bytes. | `wc -l data.csv` |
| `curl` | Make network requests/download content. | `curl https://example.com` |
| `echo` / `printf` | Print text; useful in scripts. | `printf '%s\n' "hello"` |
| `chmod` | Change file permissions. | `chmod +x script.sh` |
| `man` | Open a manual page. | `man grep` |
| `history` | Show previous shell commands. | `history` |

## Variables and scripts

A Bash script is a text file containing shell commands. Example:

```bash
#!/usr/bin/env bash
set -euo pipefail

input="${1:-data.csv}"
printf 'Rows in %s: ' "$input"
wc -l < "$input"
```

Save it as `summarise.sh`, make it executable, and run it:

```bash
chmod +x summarise.sh
./summarise.sh my_data.csv
```

A similar script is included at [`examples/bash/summarise.sh`](../examples/bash/summarise.sh).

`set -euo pipefail` is a commonly used safety setting for scripts: it makes several classes of errors fail loudly instead of silently continuing. It is useful, but it does not replace careful error handling.

## Quoting matters

A filename can contain spaces. This is unsafe:

```bash
cat $filename
```

Prefer:

```bash
cat "$filename"
```

Quoting rules are a major source of shell bugs. When scripts become important, run a linter such as [ShellCheck](https://www.shellcheck.net/).

## Windows note

Windows has its own shells, especially PowerShell. Many data-engineering tutorials assume a Unix-like shell. On Windows you can use WSL (Windows Subsystem for Linux) when you specifically need a Linux environment. The concepts of paths, processes, arguments, pipes, environment variables, and scripts transfer even when the exact syntax changes.

## Resources by level

**Beginner**

- [The Missing Semester: Introduction to the Shell](https://missing.csail.mit.edu/2026/course-shell/) — excellent practical introduction built for students.
- [The Missing Semester course](https://missing.csail.mit.edu/) — includes command-line environment, Git, debugging, packaging, and code quality; recordings are linked from the course site.

**Intermediate**

- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/) — authoritative reference once you know the basics.
- [ShellCheck](https://www.shellcheck.net/) — learn common scripting mistakes by linting your own scripts.

## Practice checkpoint

Create a directory of sample text/CSV files. Use Bash to list them, count rows, find a word with `grep`, redirect output to a report, then commit the script with [Git](03-git.md).
