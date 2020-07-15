#!/usr/bin/env bash
echo "Building C++ ..."
echo $(which python)
echo $(whereis swig)

mkdir build && cd build
cmake .. && make
cd ..

rm -rf build/temp* build/lib.linux* dist/* __pycache__/ *cxx *pyc interface_wrap.cpp helloSwig.py *so helloSwig.egg-info/ # interface_wrap.cpp #dist/*

$PYTHON setup.py bdist_wheel

cd dist/

$PYTHON -m pip uninstall helloSwig -y

$PYTHON -m pip install helloSwig*cp*.whl

cd ..

rm -rf -f __pycache__/ build/temp* build/lib.linux* *cxx *pyc interface_wrap.cpp helloSwig.py *so helloSwig.egg-info/ interface_wrap.cpp