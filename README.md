[![Build status](https://github.com/twyleg/hello_world/actions/workflows/unit_tests.yaml/badge.svg)]()
[![GitHub latest commit](https://badgen.net/github/last-commit/twyleg/hello_world)](https://GitHub.com/twyleg/hello_world/commit/)

# hello_world

Simple CMake based template for a common C++ project.

## Dependencies

The template is based on the following components:

* CMake
* boost
* googletest
* fmt

See [scripts/](https://github.com/twyleg/hello_world/tree/master/scripts) for dependency install scripts for multiple distributions.

GoogleTest is pulled in as a git submodule to avoid problems with missing cmake files in sub distributions.

## Usage

Clone, prepare and build with the following steps:

	git clone git@github.com:twyleg/hello_world.git
	cd hello_world

	git submodule update --init
	
	mkdir build/
	cd build/
	cmake ../
	make

