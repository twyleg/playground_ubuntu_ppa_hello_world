[![Build status](https://github.com/twyleg/hello_world/actions/workflows/unit_tests.yaml/badge.svg)]()
[![GitHub latest commit](https://badgen.net/github/last-commit/twyleg/hello_world)](https://GitHub.com/twyleg/hello_world/commit/)

# hello_world

Simple CMake based template for a common C++ project.

## Dependencies

The template is based on the following components:

* CMake
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

## Testing

### Unit tests

Unit tests are located in [unit_tests](unit_tests) and based on googletest.

    cd build/
    cmake ../
    make
    unit_tests/unit_tests
    


### CI/CD

GitHub Actions are used for CI/CD. main tasks are continous testing and deployment.
Actions can be run locally with [act](https://github.com/nektos/act).

For example: To run the *smoke-test-linux* job on *ubuntu:jammy*, run the following command:

    sudo act -j smoke-tests-linux --matrix image:ubuntu:jammy
    
