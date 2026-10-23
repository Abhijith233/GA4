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

## 2026-10-23

- **Asked for:** A for loop (shown only, not saved or run) that runs
  `scripts/trimgalore.sh` on the 7 S6* samples, output to `results/trimgalore`.
- **Files changed:** None (besides this diary).
- **Decisions:** Loop over the R1 files in `../garrigos/fastq/S6*_R1.fastq.gz`
  and derive R2 by replacing `_R1` with `_R2`. Confirmed S63–S69 exist (7 pairs)
  and `results/trimgalore` already exists.

## 2026-10-23

- **Asked for:** A beginner-friendly command (grep, cut, for loop) printing the
  % of read pairs removed by TrimGalore per sample.
- **Files changed:** None (besides this diary).
- **Findings:** Only the `*_R2.fastq.gz_trimming_report.txt` files contain the
  pair-removal line ("Number of sequence pairs removed ... (7.40%):"); the R1
  reports don't. Percentages checked against `pairs_removed` in the JSON
  reports (e.g. S63: 37,016 / 500,000 = 7.40%). Results: 1.78% (S67) to
  7.40% (S63).
- **Decisions:** Took the % from inside the parentheses with two `cut`s;
  rejected parsing the JSON (needs `jq` or more complex commands).
