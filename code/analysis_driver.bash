#!/bin/bash

#This serves as the main analysis driver script for the project

#Pull raw sequencing files from /proj/andermannlab
bash data/raw/obtain_raw.bash

#Obtain human reference genome
sbatch data/reference/obtain_reference.bash

#Preprocessing:
##Step 00: Run fastqc and multiqc on raw sequencing files
sbatch code/preprocessing/00_fastqc.bash

##Step 01: Run hts_SuperDeduper on raw sequencing files
sbatch code/preprocessing/01_deduplication.bash

##Step 02: Trimming low quality reads and adapter sequences from deduplicated files
sbatch code/preprocessing/02_trimming.bash

##Step 03: Removing host reads from trimmed files
sbatch code/preprocessing/03_hostremoval.bash

##Step 04: Generate fastqc and multiqc reports for processed reads
sbatch code/preprocessing/04_finalqc.bash

#Assembly:
##Step 00: Running metaspades
sbatch code/assembly/00_assembly.bash

