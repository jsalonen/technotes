# Metosin Clojure Bootcamp 29.10.2014

Some notes from Metosin Clojure Bootcamp 29.10.2014

## Clojure Quickstart

### Simple Clojure program:

	(println "Hello, world!")

Just a data structure (linked data) that contains:
- Symbol `println`
- String `"Hello, world!"`

### More complex example:

	(println "Answer is: " (+ 3 (* 2 20) -1))

- A hierarchical data structure
- Linked list containing other linked lists hierarchically
- When interpreter runs across this:
	- Macros are evaluated (not present here)
	- Linked list is parsed as follows:
		- println
		- "Answer is"
		- ()
			- `+`
			- ()
				- 3
				- ()
					- `*`
					- 2
					- 20
				- -1
- When the whole program is parsed, then program is evaluated back from bottom
	- (`*` 2 20) evaluates to `40` -> `(+ 30 40 -1)
	- (+ 3 40 -1) evaluates to `42`
	- (println "Answer is: " 42) evaluates to `"Answer is: 42"
	- As a *side-effect* from `println`, the "Answer is: 42" is printed to console

### Macros

Macro example:

	(defmacro infix [a op b]
		(list op a b))

Let's write a simple program with this macro:

	(infix 2 + (infix 2 * 20))

Parses into linked list:

	- infix
	- 2
	- +
	- ()
		- infix
		- 2
		- *
		- 20

Macros are evaluated first:

	- ()
		- +
		- 2
		- ()
			- infix
			- 2
			- *
			- 20

After macros are evaluated we end up with `(+ 2 (* 2 20))`

Typical macro use cases:
- Making a DSL more beautiful
- Performance (ClojureScript; Dommy -> at times x15 performance in comparison to jQuery)
	- Macros are used to parse DOM references instead of raw string parsing of jQuery
 
### Meta programming

	(-> '(1 2 3) (first) (= 1))

Read exspresion

(-> (quote (1 2 3)) (first) (=1))

Macro expansion

(= 1 (first (quote (1 2 3))))

Evaluation (compile to byte-code)

true

## Basics

### Regarding Editors and Practical Development

- For IntelliJ: Cursive
- Use **Strict/paredit** mode (also called **structural editing**) to easen parenthesis hell
- Preventing namespace pollution when using REPL: **component** (<https://github.com/stuartsierra/component>)

### Some practical notes

- Closure -> "close over"
- True/false evaluation:
	- Everything is *true* **except** `nil` and `false`

Create lexical bindings with `let`

	(let [message "Hello,"
	      user    "<your name here>"]
	  (println message user))

Testing with midje:

- Run in console `lein midje :autotest`

### Functions

Define  anonymous function with `fn`:

	(fn [your-name]
     (println "Hello," your-name))

Combine with `def` to create named function:

	(def say-hello (fn [your-name]
	                 (println "Hello," your-name)))

Conveniency macro for (def func-name (fn [args] body))
    
    (defn say-hello [your-name]
      (println "Hello," your-name))    

Multi-arity

	(defn say-hello
	  ([]
	    (say-hello "world!"))
	  ([your-name]
	    (println "Hello," your-name)))

Btw. see this one too:

	(defonce a (+ 1 2))

Only evaluates once!

### Filter, map, reduce

	(filter pred coll)

	(map pred coll)

	(reduce [f coll])
	(reduce [f val coll])

`remove` = negative filter
`apply` = Apply function

### Joda talk solution

Solution:

	(->> [1 2 3]
	     (filter odd?)
         (map inc))

Check it with `macroexpand`:

	(macroexpand '(->> [1 2 3]
                       (filter odd?)
                       (map inc)))

`->>` = Puts previous result to _last_ element in next expression (great when working with seqs)
`->` = Puts previous result to _first_ element in next expression (great when working with data-structures)

## Java Interoperability

	(ns java-interop
	  (:import [javax.swing JFrame JComponent]))

Instantiate Java objects:

	(def rnd (new Random 42))  ; old way
	(def rnd (Random. 42))     ; idiomatic

; Invoke method:

	(. rnd nextInt 1337) ;=> 897  old way
	(.nextInt rnd 1337)  ;=> 897  idiomatic

## Destructuring

### Vector destructuring

	(let [[a _ c & more]  [1 2 3 4 5 6]]
      (+ a c))

=> 6

`_` = I do not care about this thing
`& more` = The rest of the seq is bound to `more` (see http://clojure.org/special_forms)

### Map destructuring

	(let [{{ message :message} :body} {:body {:message "hello"}}]

-> "`hello`" is bound to `message`

Another example:

	(defn long-book? [{pages :pages}]
	  (> pages 300))

-> Takes object that has `pages`, and return boolean whether it has more than 300 pages 

Example of map destructing with `:keys`:

	; Filter books that have less than 300 pages

	(defn short? [{:keys [pages name]}]
      (< pages 300)
    )

## Clojure Real-World Usage Example: Web Application

**Ring** = Sinary equivalent for Clojure

Typically we don't make multiple war packages, just make single uber.war that you push into production (containing Jetty, Tomcat or - nowadays - httpkit)

Ring:

- Every incoming request is a Clojure `map` with:	
	- `headers`
	- `body`
- Ring wants we return a `map` with stuff like:
	- `body`

Ring middleware example:

	(defn log-requests [handler]
	 (fn [request]
	   (pprint request)
	   (handler request)))

	(defn business-logic [request]
	 {:status 200
	  :body "Hello, world!"})

	(start-server (log-request business-logic))

**HTTPPie** - A command-line HTTP client

**Compojure** - Higher-level routing library for Ring/Clojure

**Compojure-api** - Stuff on top of Compojure (Swagger integration, etc.)

## More stuff you should check out

- Clojuredocs.org - Documentation with community examples
- ClojureWerkz - A growing collection of open source Clojure libraries
- Clojure toolbox (more libraries, not as strictly curated as ClojureWerktz)
- 4clojure (<http://wwww.4clojure.com/>)
- Book: Clojure programming (Practical Lisp for the Java World)
	- Chas Emerick, Brian Carper & Christophe Grand
