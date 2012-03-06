# Heroku

## Deployment

### Python deployment

See: <http://devcenter.heroku.com/articles/python#prerequisites>

### Node.js deployment

See: <http://devcenter.heroku.com/articles/node-js>

## Understanding Heroku

### Using Heroku Console (Cedar stack)

See: <http://devcenter.heroku.com/articles/cedar>

- Problem: only stuff on git gets deployed
- Solution: you can run your build scripts on Heroku with command-line tool

Example:

	heroku run
	heroku run "node build debug"
	--force

Also try out SSH access <http://devcenter.heroku.com/articles/ssh-access>:

	heroku run bash

However, as nicely noted in the doc, little is gained by using SSH access.
I still found it very education to `cd` and `ls` around to see what is possible
(almost nothing is).

### Slug Compiler

See: <http://devcenter.heroku.com/articles/slug-compiler>
