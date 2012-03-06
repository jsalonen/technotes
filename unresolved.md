# Unresolved

## Installing Contextify on Windows

	npm install -g jsdom

-> Error (more notes in [nodejs.md])

## Running Grunt Release Build on Heroku

`Procfile`

	web: node build server:release
	
Deployment:

	git push heroku master
	heroku run "node build release"

Doesn't work (don't know why)
