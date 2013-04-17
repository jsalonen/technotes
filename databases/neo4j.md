# Neo4j

## 1. Background

### 1.1. What is Neo4j?

Neo4j is a fully ACID compliant, transactional property graph database. Unlike SQL, it doesn't have tables; it is simply just one (potentially huge) graph.

Neo4j is *schema-free*. It which means that the database doesn't help you much with keeping your data in shape -- you need to figure out other ways for expressing and managing your schema. On the other hand neo4j doesn't get too much in your way if you want to use it for managing datasets with rapidly evolving or complex schemata.

### 1.2. Key concepts

**Cypher**: "a declarative graph query language that allows for expressive and efficient querying and updating of the graph store without having to write traversals through the graph structure in code. Cypher is still growing and maturing, and that means that there probably will be breaking syntax changes. It also means that it has not undergone the same rigorous performance testing as other Neo4j components." (<http://docs.neo4j.org/chunked/milestone/cypher-query-lang.html>).

**Reference node**: "when a new Neo4j database is created, it already contains one single node, known as the reference node. This node can be used as a main entry point to the graph, and next we'll show a useful pattern for this." <http://blog.neo4j.org/2010/03/modeling-categories-in-graph-database.html>

**Subreference nodes**: "In most real applications you'll want multiple entry points to the graph, and this can be done by creating subreference nodes. A subreference node is a node that is connected to the reference node with a special relationship type, indicating it's role." <http://blog.neo4j.org/2010/03/modeling-categories-in-graph-database.html>

## 2. Installation

You generally have two alternatives of using neo4j:

- **Standalone server**. Install and run neo4j is a standalone server. Database is stored in the server and is used over HTTP.
- **Embedded**. Install and run neo4j as part of your application. Database is stored in filesystem, typically under `graph.db` folder.

Which one to choose depends on what you are doing. Standalone server is generally a better choice if
you need to share your data among multiple applications and/or host it in a server. Embedded mode is likely a better choice if you want to capsulate your data within your application.

### 2.1. Standalone server installation

Get neo4j: <http://www.neo4j.org/install>

Unzip to selected target location (e.g. <code>C:\Program Files (x86)\neo4j</code>)

Start neo4j server:

    C:\Program Files (x86)\neo4j\bin\neo4j start

Make sure the server is running by visiting it with a browser:

    http://localhost:7474/

**Hint:** add neo4j bin folder to PATH so that you can simply use `neo4j` command in the future.

### 2.2. Setting up embedded bindings for Python

Getting neo4j embedded bindings for Python is a tricky process. For official instructions, see:

<http://docs.neo4j.org/chunked/1.6/python-embedded-installation.html>

Especially what you need to do:

- Install JPype to enable neo4j access its Java classes from Python
- Install neo4j-embedded (basically just `pip install neo4j-embedded`)
- You need to make sure `JAVA_HOME` environment variable is set correctly
- If in luck, you are done installing

If you are using Windows, you may need to fix some broken DLLs (see the docs).

### 2.3. Installing neo4j server on Heroku

Create a new Heroku app:

    heroku apps:create myapp
    
Add neo4j addon to the app (note you need to have your Heroku account verified before this):

    heroku addons:add neo4j:try --app myapp
    
Now find out your neo4j installation's URL by invoking:

    heroku config:get NEO4J_URL --app myapp

For details, see: <https://devcenter.heroku.com/articles/neo4j>

### 2.3. General notes about installation

- By default, data is stored under `neo4j/data` folder

## 3. Using Administration and Development tools

### 3.1. Build-in admin UI and Shell

- Use the build-in admin UI at <http://localhost:7474/>

### 3.2. Neoclipse

- Requires Eclipse 3.8 Juno and some configuring
- Get Neoclipse from here: <https://github.com/neo4j/neoclipse>

## 4. Application Development

### 4.1. Using Neo4j With Python Embedded

#### 4.1.1. Accessing a Neo4j Embedded Database from Python

Neo4j databases are usually stored as `graph.db` folder. Locate that folder and we can start crunching it open.

Opening a database in Python:

    >>> from neo4j import GraphDatabase
    >>> db = GraphDatabase('graph.db') # Or some other folder like `../mydatasets/graph.db.1/` etc.

If everything went well so far, `db` should contain reference to a neo4j database object:

    >>> db
    EmbeddedGraphDatabase [C:\Users\Username\work\databases\graph.db]

Important note. When you are done with the db, remember to shut it down:

    >>> db.shutdown()

If a shutdown is not called, neo4j needs to handle a non-clean shutdown the next time the database is opened.

#### 4.1.2. Using the Python API

When looking into Python documentation for neo4j embedded, you quickly realize it, well, sucks. Big time. You cannot find comprehensive documentation on methods, classes or whatsoever and get easily stuck with "how can I do this and this".

**But here's the trick: neo4j embedded for Python simply uses JPype to directly map Neo4j's Java objects into Python objects. Thus, instead of Python documentation, you need to be looking into Neo's Java documentation.**

For instance, let's say we access `db` object that is an instance of `EmbeddedGraphDatabase`. Taking a look into Java documentation:

<http://api.neo4j.org/current/org/neo4j/kernel/EmbeddedGraphDatabase.html>

We find out that it implements `GraphDatabaseService`: 

<http://api.neo4j.org/current/org/neo4j/graphdb/GraphDatabaseService.html>

Which contains a method called `index`:

<http://api.neo4j.org/current/org/neo4j/graphdb/GraphDatabaseService.html#index%28%29>

Which can be called to return an object that implements `IndexManager` interface:

<http://api.neo4j.org/current/org/neo4j/graphdb/index/IndexManager.html>

Which further contains a method called `nodeIndexNames` that can be called to retrieve list of node indexes:

<http://api.neo4j.org/current/org/neo4j/graphdb/index/IndexManager.html#nodeIndexNames%28%29>

So next, let's apply this knowledge to access data in an embedded neo4j database.

#### 4.1.3. Some recipes

##### Accessing indexes

Access node indexes:

    >>> db.index().nodeIndexNames()
    (u'angellist_url', u'name', u'id', u'node_auto_index', u'type')

Access relationship indexes:

    >>> db.index().relationshipIndexNames()
    (u'role',)

##### List all nodes from an index

Get list of all nodes in `id` index:

    for node_in_index in db.index().forNodes(u'id'):
    	node = db.getNodeById(node_in_index.key)

##### Accessing node properties

Get list of all nodes in `id` index and print their properties

    for node_in_index in db.index().forNodes(u'id'):
    	node = db.getNodeById(node_in_index.key)
    
    	properties = {}
    	property_keys = node.getPropertyKeys()
    	property_values = node.getPropertyValues()
    	for index, key in enumerate(property_keys):
    		properties[key] = property_values[index]
    
    	print node
    	print properties
    	print 

##### List all relationships for index in a given index

    for node_in_index in db.index().forNodes(u'id'):
    	node = db.getNodeById(node_in_index.key)
    
    	relationships = node.getRelationships()
    	for rel in relationships:
    		rel_from = rel.getStartNode()
    		rel_to = rel.getEndNode()
    		rel_type = rel.getType()
    		
    		print rel_from, ' --(', rel_type, ')--> ', rel_to

##### Running a Cypher query

    q = u"START n=node:name(name='nameofbeginnode') \n" +\
        u"MATCH n-[*0..1]-m \n" +\
        u"RETURN m, n"
    result = db.query(q)
