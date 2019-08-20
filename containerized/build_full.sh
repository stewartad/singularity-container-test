#!/bin/bash
# ---MUST BE RUN WITH SUDO---
singularity build -F singularity.sif singularity.def
singularity build -F singularity_test_container.sif singularity_test_container.def
