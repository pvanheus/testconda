#!/bin/bash

set -e

source /opt/conda/bin/activate

conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict

conda search bioconda/noarch::perl-bioperl=1.7.2=pl526_11
conda search bioconda/noarch::prokka=1.14.6=pl5262hdfd78af_3

conda create -y \
    -n test-prokka \
    -c conda-forge \
    -c bioconda \
    'perl-bioperl=1.7.2=pl526_11' \
    'prokka=1.14.6=pl5262hdfd78af_3'
