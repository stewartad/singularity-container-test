# Singularity Container Testing Environment

This repo contains example containers and test configurations for use with [stewartad/container-structure-test](https://github.com/stewartad/container-structure-test).

## Background

HPC systems are required to make available a large amount of software packages to researchers, which is costly in terms of storage and logistics. By moving to a containerized system, the storage and logistical needs are simplified. Docker is currently the most popular container technology, however the Docker daemon makes it insecure to run on HPC systems. As a substitute, Singularity is used on HPC systems.

Before being put into production, containers must be tested to ensure functionality. There is an expansive set of resources for Docker containers to do this, but significantly fewer for Singularity. One such tool is [GoogleContainerTools/container-structure-test](https://github.com/GoogleContainerTools/container-structure-test), designed to test the integrity of Docker containers. By extending this tool, and writing a Go library, [Singolang](https://github.com/stewartad/singolang), to interact with Singularity, the same integrity tests are now possible for Singularity containers.

This testing system is part of a larger autonomous build system project in the University of Arizona HPC group to bring containerized software to researchers. Other software in this project is [lookout](https://github.com/alecbcs/lookout) and, in the future, builder.

## Usage

To run the tests, first clone the repository. There are currently two tests. Each test has a definition file named `def_[name].def`, a config file named `config_[name].yaml`, and a testfile named `testfile_[name]`. There are also build and run scripts named `build_[name].sh` and `run_[name].sh`, repsectively. These files contain the commands detailed below.

Each test will require you to first build the container. For example, to build the lolcow test, use the following command.

```bash
sudo singularity build image_lolcow.sif def_lolcow.def
```

This can also be accomplished using the `build_lolcow.sh` file, which contains the command above. Note that it must be run with sudo.

To run the test with the example test cases, use the following command.

```bash
./container-structure-test test --driver singularity --image image_lolcow.sif --config config_lolcow.yaml
```

All testcases should pass.

## Running tests on your own containers

Download the binary of the [container-structure-test](https://github.com/stewartad/container-structure-test/releases/tag/v1.8.2). This software is compatible with all Singularity 3 `.sif` files.

The config file must be a `.yaml` file formatted according to the documentation of Google's [container-structure-test](https://github.com/GoogleContainerTools/container-structure-test) framework. See also the example `config_x.yaml` files provided in this repository. Note that the Singularity driver does not support License tests and is limited to environment variables and labels for Environment tests.
