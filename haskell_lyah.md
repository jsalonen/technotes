# Haskell

My collection of key points from "Learn You a Haskell for Great Good" <http://learnyouahaskell.com/>!

## Notes: starting Out

Running Haskell interpreter:
	ghci

"Space is simply function application in Haskell"

"In Haskell, functions are called by writing the function name, a space and then the parameters, separated by spaces."

Using Haskell from command-line "runhaskell"

$ = syntactic sugar for ()
	Example:
	doubleMe(doubleUs 1 2) ->
	doubleMe $ doubleUs 1 2

Comments in Haskell: {- ... -}

Loading modules (in ghci) ":l baby"

GHCi help: :?

GHCi quit: :q

Apostrophes in function names are used conventionally to denote a strict version of a function (one that isn't lazy) or a slightly modified version of a function or a variable

"Functions cannot begin with uppercase letters"

"When a function doesn't take any parameters, we usually say 
it's a definition (or a name)"

Names cannot be redefined --> For instance given conanOB = "I'm Conan" this string and name can be used interchangeably!

Lists are a homogenous data structure -> stores one or more elements of the same type. For example: list of integer, list of character, but not mixed lists

let keyword can be used to define a name in GHCi

Defining lists: let numbers = [1,2,3,4]

Strings are just lists of characters. "hello" is syntactic sugar for ['h', 'e', 'l', 'l', 'o']

Lists can be put together with `++` operator: `[1,2] ++ [3,4] ++ [5]` or `(++) ((++) [1,2] [3,4]) [5]`

Single-line comments can be made with `--` prefix

Cons operator `:`

It is faster to use cons operator to prepend something especially if you have long lists

Cons operator exaple: 5:[1,2,3,4,5] gives us `[5,1,2,3,4,5]`

Actually: `[1,2,3]` is syntactic sugar for `1:2:3:[]` where `[]` is an empty list

Difference between [], [[]] and [[],[],[]] where 1) empty list, 2) list containing one empty list, 3) three empty lists in a list

List indexing with `!!` operator. Example: `"Cat" !! 1` evaluates to `'a'`

"Lists can be comparsed if the stuff they contain can be compared". Operators: `<`, `<=`, `>` and `>=` are especially valid

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

Tuples:
- List of numbers is a list of numbers (that is its type, independent of how many items it has (none to inf))
- Denoted by parenthesis and teir components are separated by commas

`fst` takes a pair and returns its first component
`snd` takes a pair and returns its second component

`zip` takes two lists and zips them together into one list by joining matching pairs: `zip [1..5] "abcdef"` is `[(1,'a'),(2,'b'),(3,'c'),(4,'d'),(5,'e')]`

Zipping together mixed-size lists: `zip [1..2] "abcdef"` is `[(1,'a'),(2,'b')]`

"Main program in haskell": define `main`

`Parse error: naked expression at top level` - you try to run an expression that is not bound to main

Undefined values: `a = undefined`

Haskell cheatsheet: http://cheatsheet.codeslower.com/CheatSheet.pdf

"DRILLS":

problem: "create a set from 1..30 given that
the value is not in another set 1..10":

solution 1:
`[ x | x <- [10..30], not(x `elem` [1..10])]`

solution 2:
`[ x | x <- [10..30], not $ x `elem` [1..10]]`

problem: add some other constraint:

solution: `[ x | x <- [10..30], not $ x `elem` [1..10], x > 20]`

problem: create list containing all possible combination of x and y given their range is 1..10

solution: `[ (x,y) | x <- [1..10], y <- [1..10] ]`

problem: implement remove non-uppercase set function

solution: `let removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]`

OPEN QUESTIONS:
- `go`
- `filter(\i -> v /= fst i)`

