# Clojure - Second attempt

## Getting started

Opening REPL:

	lein repl

Getting help using doc:

	(doc vector)

Creating new app:

	lein new app helloworld

Invoke REPL inside project:

	lein repl

Reload using require:

	(require 'myapp.core :reload)

## Basic Syntax

Functions:

	=> (def jkl2 "Jyväskylä 2")
	#'user/jkl2

True / false predicate functions:

	=> (true? 0)
	false

	=> (false? 0)
	false

Keywords:

	=> :jkl
	:jkl

Numbers:

	=> 1
	=> 2
	=> 3

Decimal numbers:

	=> 2.5
	=> 3.5

Fractional numbers:

	=> 2/4
	=> 1/3

## Data structures

### Vector

	=> (doc vector)
	=> [2 3 4 5]
	[2 3 3 4 5]

Accessing / manupulating vectors:

	(count a)
	(nth a 2)
	(first a)
	(second a)
	(last a)
	(rest a)
	(get a 1)

### Maps

Hashmap data type (key / value)

	{:jkl "Jyväskylä", :tre "Tampere"}

Define hashmap as a named thing

	(def m #{:gofore "Gofore"})

Remove from hasmap

	{dissoc m :gofore}

Get from hashmap

	(get m :gofore)

Update:

	(update m :seppo "Seppo")

Keys as functions:

	(:gofore m)

Nested data structures:

	(def m3 {:jkl {:tsto "Lutakonaukio"}})

Access nested value:

	(get-in m3 [:jkl :tsto])

### Lists

Define list:

	(list 1 2 3 4)

Or:

	'(1 2 3 4)

### Atoms

- Completely thread-safe, swappable data structure
- Can be used in conjuntion with other data types

Initialize using atom macro:

	(def arvo (atom 2))

Get value:

	@arvo

Modify atom:

	(swap! arvo inc)

Clojure-convention: ! denotes function that has side-effects.

## Functions

Defining anonymous functions

	(defn f [p] (prn p))

Short of:

	(def f (fn [p] (prn p)))

Nary functions:

	(defn f3 [param1 & loput]
	 (prn param1)
	 (prn "Loput" loput)
	)

### Map / reduce

Increase every vector value by one:

	(map inc [1 2 3 4])

Sum vector:

	(reduce + [1 2 3 4])

Using with anonymous functions:
	
	(map (fn [x] (str x "-" x)) [1 2 3 4])

Shorter version:

	(map #(str % "-" %) [1 2 3 4])

## Compojure Quick Start

Generating new compojure app:

	lein new compojure mybackend

Run:

	lein ring server

## Figwheel / Reagent Quick Start

Generate new app:

	lein new reagent-frontend lullerson-front

Running:

	lein figwheel
