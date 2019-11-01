from distutils.command.build import build
from distutils.spawn import find_executable
import sys
import os


try:
    from setuptools import setup, Extension
except ImportError:
    from distutils.core import setup, Extension


if not find_executable('swig'):
    sys.exit("Error:  Building this module requires 'swig' to be installed")

# if not os.path.exists('build/libhelloSwig.a'):


SOURCES = [
    'interface.i',
]

INCLUDES = [
    'include',
]

LIBRARIES = [
    'helloSwig',
]

SWIG_OPTS = [
    '-c++',
    '-py3',
    '-outdir',
    '.',
    '-Isrc'
]

class CustomBuild(build):
    sub_commands = [
        ('build_ext', build.has_ext_modules),
        ('build_py', build.has_pure_modules),
        ('build_clib', build.has_c_libraries),
        ('build_scripts', build.has_scripts),
    ]

LIBRARIES_DIRS = [
    "build",
]

helloSwig_module = Extension('_helloSwig',
                              library_dirs=LIBRARIES_DIRS,
                              libraries=LIBRARIES,
                              sources=SOURCES,
                              include_dirs=INCLUDES,
                              extra_compile_args = ["-O3", "-Ofast"],
                              swig_opts=SWIG_OPTS,
                              )



setup(name='helloSwig',
      version='0.1',
      author="Mohamed Abuelanin",
      author_email='mabuelanin@gmail.com',
      description="""helloSwig Python interface""",
      ext_modules=[helloSwig_module],
      py_modules=['helloSwig'],
      url='https://github.com/mr-eyes/hello_swig',
      cmdclass={'build': CustomBuild},
      license='BSD 3-Clause',
      long_description_content_type='text/markdown',
      include_package_data=True,
      project_urls={
          'Bug Reports': 'https://github.com/dib-lab/kProcessor/issues',
          'Source': 'https://github.com/dib-lab/kProcessor',
      },
      )