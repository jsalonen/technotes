# Python

## Getting Started

Install Python
- Go to <http://python.org/>
- Download and install
- Alternatively use `apt-get` or whatever

Install setuptools:
- http://pypi.python.org/pypi/setuptools
- Select matching version, download and install (make sure you really match your interpreter)

Install `pip`:
- Go to http://pypi.python.org/pypi/pip
- Download the package
- Extract and install by invoking `python setup.py install`

From here on, everything is fun:

	pip install [whatever]

## Using Virtualenv

Installing new packages is fun in the beginning. However, quite quickly
you may end up requiring different configurations for different
projects.

With virtualenv, you can create project-specific configurations
of Python modules and packages. 

Craeting a new virtualenv:

	virtualenv [envname]

Activating it:

	./envname/Scripts/activate

Note: if you are using Windows [[PowerShell]], you may need to change your
execution policy!
