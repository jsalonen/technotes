# Haskell

## First Steps

### Using functions

Define function `double`:

	double x = x * x

Define function `quadruple` using function `double`:

	quadruple x = double x

Define function `factorial` by calling function `product` with list from 1 to n:

    factorial n = product [1..n]

### Syntactic Sugar

#### \`abc\`

Backtick escaped name = syntatic sugar for infix notation:

    average ns = sum ns `div` length ns

#### $

Dollar sign ($) = syntactic sugar for removing parethesis:

	doubleMe(doubleUs 1 2)

Same as
	doubleMe $ doubleUs 1 2


### Naming and structuring conventions

- Function and argument names must begin with a lower case letter
- By convention, list arguments usually have an s suffix on their name (e.g. xs, ns, nss)
- Apostrophes (') in function names are used conventionally to denote a strict version of a function (one that isn't lazy) or a slightly modified version of a function or a variable
- White space is significant; indent blocks with white-space, space between names is simply function application
- When a function doesn't take any parameters, we usually say it's a definition (or a name)

#### Layout rule

To indicate the grouping of definitions

implicit grouping:

	a = b + c
        where
              a = 1
              b = 2
	d = a * 2

Same as


	a = b + c
	    where
	        {b = 1;
                 c = 2}
	d = a * 2

#### Comments

Single-line comments:

	-- Single-line comment

Comment blocks:

	{-
		My comment
		Next line
	-}

### GHCi - First steps and Useful Commands

Run Haskell interpreter:

	ghci

Load script name

	:load name
	:l name

Reload current script

	:reload

Edit current script

	:edit

Edit script called `name`

	:edit name

Show type of expr

	:type expr
	:t expr

Show all commands

	:?

Quit

	:quit

## Types and Classes

### Lists

Simple list examples:

	[1, 2, 3]
	["a, "c", "d"]

- Strings are just lists of characters. "hello" is syntactic sugar for `['h', 'e', 'l', 'l', 'o']`
- Lists are homogenous data structures -> stores one or more elements of the same type. For example: list of integer, list of character, but not mixed lists

`let` keyword can be used to define a name in GHCi:

	let numbers = [1,2,3,4]

Lists can be put together with `++` operator:
	
	[1,2] ++ [3,4] ++ [5]` or `(++) ((++) [1,2] [3,4]) [5]

#### Cons operator (`:`)

It is faster to use cons operator to prepend something especially if you have long lists.

Cons operator example:

	5:[1,2,3,4,5]

Gives us

	[5,1,2,3,4,5]

Actually:

	[1,2,3]

is syntactic sugar for

	1:2:3:[]

where `[]` is an empty list

#### Lists in lists

Difference between

	[]
	[[]]
	[[],[],[]]

1. Empty list
2. List containing one empty list
3. Three empty lists in a list

#### List indexing (`!!`)

List indexing with `!!` operator:

	"Cat" !! 1

evaluates to `'a'`.

Should be used sparingly (slow, usually part of non-functional usage pattern)

#### Comparison

Lists can be compared if the stuff they contain can be compared.

Operators: `<`, `<=`, `>` and `>=` are especially valid

#### More list functions

`head` takes a list and returns it head: `head [1,2,3]` is `1`

`tail`: list without head

`last`: last element

`init`: everything but last

`length`: return list length

`null` checks if a list is empty

`reverse` (a list)

`take` extracts given number of elements from the beginning e.g. `take 3 [1,2,3,4,5]` is `[1,2,3]`

`drop` drops given number of elements from the beginning

`maximum`, `minimum` extract min/max

Sum together: `sum`

Product: `product`

`elem` is used to tell us whether a given element exists in a list: `4 `elem` [1,2,3,4]` is `True`

Ranges: `[1..10]`

Reverse ranges work as well with a twist `[10,9..1]`

`cycle` takes a list and cycles it into an inifite list, to display results we need to slice it somehow: `take 10 $ cycle [1,2,3,4]`

`repeat` produces an infite list by repeating give variable (not cycling): `take 10 repeat 5`

`replicate`: `replicate 3 10` returns `[10,10,10]`
 List comprehensions: In math S = {2·x | x e N, x <= 10}. In Haskell: `[x*2 | x <- [1..10]]`. Explanation: `x` is drawn from `[1..10]` and for every element in `[1..10]` which have bound to `x` we get that element, only doubled
 -- My rought semantics for `x <- y` = `somehing is drawn from y and is bound to x`
[ x | x <- [50..100], ]

`|` operator is just like in mathematical sets

More involved example: `boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]`

`/=` means "not equal to" (`!=` common from many other languages doesn't work)

`_` means that we don't care what we will draw from the list. Example: `length' xs = sum [1 | _ <- xs]

Nested list comprehensions:

` [ [ x | x <- xs, even x ] | xs <- xxs]`

### Tuples and pairs

Defining a tuple

		(1, 2, 3)
		(1, "a")

Pairs:

		fst (1, "Hello")
		snd (1, "Hello")

## Notes from FP101x

### Lecture 2 (Types and Classes)

#### Types

- A **type** is a name for a collection of related values.
- Applying a function to one or more arguments of the wrong type is called a type error
- The goal of static typing is that the compiler will catch these type errors early on

Notation for writing types in Haskell:

	e :: t
	
If evaluation an expression `e` would produce a value of type `t` then `e`has type `t` as above.

Every well formed expression has a type --> **type inference**

- All type errors are found at compile time in Haskell, which makes programs safer and faster by removing the need for the type checks at run time

Asking type in GHCi:

	> :type not False
	not False :: Bool

Basic Types in Haskell: `Bool´, ´Char`, `String`, `Int`, `Integer`, `Float`

- List: only one type per list
- Tuple Types: A tuple is a sequence of values of *different* types

#### Types of Functions

A function is a mapping from values of one type to values of another type

Examples:

	not	:: Bool -> Bool
	isDigit :: Char -> Bool

Type of from = "domain"
Type of to = "range"

**Curried Functions**

Functions with multiple arguments are also possible by returning functions as results:

	add'	:: Int -> (Int -> Int)
	add' x y = x + y

In Haskell you don't have to write those inner arrows ("Int -> Int"). 

Functions that take their arguments one-by-one are called **curried functions**
