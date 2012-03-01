# Using FuXi Reasoner

FuXi 1.0: A Python-based, bi-directional logical reasoning system for the semantic web (<http://code.google.com/p/fuxi/>).

## Installation

You need RDFLib. The problem is that FuXi doesn't work with RDFLib 3. This kinda sucks.
I really like RDFLib 3, but turns out FuXi is one, possibly the only somewhat
functional reasoner for Python. 

### Installing layercake (an rdflib fork)

Get it:
- Go to <http://code.google.com/p/python-dlp/wiki/LayerCakePythonDivergence>
- Make SVN checkout (creates folder `python-dlp`)

Now install that layercake:

	cd python-dlp
	cd layercake-python
	python setup.py install

