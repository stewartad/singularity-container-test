# Singularity Container Testing Environment

This repo contains Singularity containers used for testing other Singularity containers.

## Usage
**NOTE: all scripts must be run with sudo**
1. Clone this repository
2. Run `build_full.sh`

* This will first build an image which contains Golang and Singularity, then build an image from that with the [container-structure-test](https://github.com/stewartad/container-structure-test) and [singolang](https://github.com/stewartad/singolang) libraries installed. Note that this is a custom version of `container-structure-test` extended for use with Singularity.

* If you need to update the libraries and already have the base container built, run `build_partial.sh` instead
3. Run `run.sh` for a quick test run. All test case should pass.

## Running tests on your own containers
The `singularity_testenv.sif` container runscript accepts arguments to run tests on any Singularity container. The first argument is the image file, and the second is the config file. For example, here is the command used in `run.sh`

`sudo singularity run singularity_testenv.sif lolcow_latest.sif test_config.yaml`

The config file must be a .yaml file formatted according to the documentation of Google's [container-structure-test](https://github.com/GoogleContainerTools/container-structure-test) framework. Note that the Singularity driver does not yet support Metadata or License tests.