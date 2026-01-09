##### PYTHON MODULES #####

import oncopipe as op
import os

SAMPLES = op.load_samples("/home/lklossok/lcr-modules/demo/data/samples.tsv")
GENOME = op.filter_samples(SAMPLES, seq_type = "genome")

##### CONFIGURATION FILES #####

# Load module-specific configuration. 

configfile: "/home/lklossok/lcr-modules/modules/dlbclone/1.0/config/default.yaml"
configfile: "/home/lklossok/thanos_test_files/dlbclone.yaml"

config["lcr-modules"]["_shared"]["samples"] = GENOME

##### SPECIFY SAMPLES #####

include: "/home/lklossok/lcr-modules/modules/dlbclone/1.0/dlbclone.smk"

##### TARGETS ######

rule all:
    input:
        rules._dlbclone_all.input
