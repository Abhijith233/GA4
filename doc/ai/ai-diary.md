# AI diary

## 2026-10-23

- **Asked for:** Review of `scripts/trimgalore.sh` (top 5 issues, no changes),
  then a check that both input FASTQ files exist.
- **Files changed:** `scripts/trimgalore.sh`; created `doc/ai/ai-diary.md`.
- **Findings from review:** missing `mkdir -p` for the output dir, no usage line
  or argument-count check, no input-file checks, logging doesn't match the
  conventions (script name, date, version), `container` should be `CONTAINER`.
- **Decisions:** Added a loop right after the argument assignments that exits
  with code 1 and an error on stderr if either FASTQ is not a regular file
  (`-f`), so it fails before the container is pulled. Used a loop instead of
  two separate `if` blocks to avoid repeating code. Other review items not
  implemented yet.
