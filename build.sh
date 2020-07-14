#!/usr/bin/env bash

mkdir build && cd build
cmake .. && make
cd ..

rm -rf build/temp* build/lib.linux* dist/* __pycache__/ *cxx *pyc interface_wrap.cpp helloSwig.py *so helloSwig.egg-info/ # interface_wrap.cpp #dist/*

$(which python) setup.py bdist_wheel

cd dist/

$(which python) -m pip uninstall helloSwig -y

$(which python) -m pip install helloSwig*cp*.whl

cd ..

rm -rf -f __pycache__/ build/temp* build/lib.linux* *cxx *pyc interface_wrap.cpp helloSwig.py *so helloSwig.egg-info/ interface_wrap.cpp