##### PYTHON MODULES #####

import oncopipe as op
import os

SAMPLES = op.load_samples("lcr-modules/demo/data/samples.tsv")
GENOME = op.filter_samples(SAMPLES, seq_type = "genome")

##### SETUP VARIABLES #####
#config["tool_names"] = "dlbclone"
#config["pipeline_name"] = "dlbclone"

#include: "header_2.1.smk"

##### REFERENCE_FILES WORKFLOW #####
#subworkflow reference_files:
   # workdir:
    #    "../../ref/lcr-modules-references/"
 #   snakefile:
  #      "lcr-modules/workflows/reference_files/2.4/reference_files.smk"
   # configfile:
    #    "lcr-modules/workflows/reference_files/2.4/config/default.yaml"

##### CONFIGURATION FILES #####

# Load module-specific configuration. 

configfile: "lcr-modules/modules/dlbclone/1.0/config/default.yaml"
configfile: "thanos_test_files/dlbclone.yaml"

config["lcr-modules"]["_shared"]["samples"] = GENOME

##### SPECIFY SAMPLES #####

# input mutation matrix?

include: "lcr-modules/modules/dlbclone/1.0/dlbclone.smk"

##### TARGETS ######

rule all:
    input:
        rules._dlbclone_all.input


# cd thanos_test_files

# dry run
# ./snakemake.local.sh src/snakemake/dlbclone.smk all gambl "-np --use-conda --conda-frontend conda"

# snakemake -s dlbclone.smk all gambl -np --use-conda --conda-frontend conda

# full run
# ./snakemake.local.sh src/snakemake/dlbclone.smk all gambl "--use-conda --conda-frontend conda"