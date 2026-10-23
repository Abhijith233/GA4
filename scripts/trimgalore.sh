#!/bin/bash
set -euo pipefail

# Purpose: Trim paired-end FASTQ reads using TrimGalore

# Copy the positional arguments into descriptively named variables.
r1_fastq="$1"
r2_fastq="$2"
output_dir="$3"

# Container containing TrimGalore.
container="oras://community.wave.seqera.io/library/trim-galore:2.3.0--a56e49e832976df4"

# Log the inputs and output directory.
echo "Starting TrimGalore"
echo "R1 input: $r1_fastq"
echo "R2 input: $r2_fastq"
echo "Output directory: $output_dir"

# Run TrimGalore on paired-end reads.
apptainer exec "$container" trim_galore \
    --paired \
    --output_dir "$output_dir" \
    --fastqc \
    "$r1_fastq" "$r2_fastq"

echo "TrimGalore finished"