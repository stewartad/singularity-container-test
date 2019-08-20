#!/bin/bash

./container-structure-test test --driver singularity --image image_scipy_stack.sif --config config_scipy.yaml
rm plot.png