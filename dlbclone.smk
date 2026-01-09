##### PYTHON MODULES #####

import oncopipe as op
import os

SAMPLES = op.load_samples("lcr-modules/demo/data/samples.tsv")
GENOME = op.filter_samples(SAMPLES, seq_type = "genome")

##### CONFIGURATION FILES #####

# Load module-specific configuration. 

configfile: "lcr-modules/modules/dlbclone/1.0/config/default.yaml"
configfile: "thanos_test_files/dlbclone.yaml"

config["lcr-modules"]["_shared"]["samples"] = GENOME

##### SPECIFY SAMPLES #####

include: "lcr-modules/modules/dlbclone/1.0/dlbclone.smk"

##### TARGETS ######

rule all:
    input:
        rules._dlbclone_all.input
