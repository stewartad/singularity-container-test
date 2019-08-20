#!/bin/bash
# ---MUST BE RUN WITH SUDO---
echo "hello world" >aaa

singularity pull docker://godlovedc/lolcow 2>/dev/null
singularity run singularity_test_container.sif lolcow_latest.sif test_config.yaml

rm aaa
