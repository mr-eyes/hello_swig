wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda3.sh
./miniconda3.sh -b
. $HOME/miniconda3/etc/profile.d/conda.sh

export PATH=$HOME/miniconda3/bin:$PATH
conda update --yes conda  # Update CONDA without command line prompt
# Create a new environment
conda create --yes -n test python=$TRAVIS_PYTHON_VERSION

# Activate it
conda activate test

# Install various dependencies
conda install --yes pip
conda install --yes cmake make
conda install -c anaconda libstdcxx-ng -y
conda install --yes -c conda-forge swig=4.0.1
which swig
which python
mkdir build && cd build
cmake .. && make