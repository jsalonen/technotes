# RailwayJS Experiments

## Install RailwayJS

Homepage: <http://railwayjs.com/>

	npm install railway -g

App scaffolding:

	railway init website
	cd website
	npm install -l

	Run it:

	railway server 8080

## Model

Generate model to match our Backbone.js frontend:

	railway g model webpage id title content

Generates `db/schema.js`:

	var Webpage = describe('Webpage', function () {
    	property('id', String);
    	property('title', String);
    	property('content', String);
	});

## Generate REST API with CRUD

	railway g scaffold webpage id title content

Generates a lot. From REST point of view, routes are interesting:

	railway routes

Run server and navigate to `http://localhost:8080/webpages`

Try out how the CRUD actions work. 

I'm still somewhat puzzled how the web UI requests and REST requests are interwoven :|
