# Neo4j

## 1. Background

### 1.1. What is Neo4j?

Neo4j is a graph database. Unlike SQL, *it doesn't have tables; it is simply just one (potentially huge) graph*.

### 1.2. Key concepts

**Cypher**: "a declarative graph query language that allows for expressive and efficient querying and updating of the graph store without having to write traversals through the graph structure in code. Cypher is still growing and maturing, and that means that there probably will be breaking syntax changes. It also means that it has not undergone the same rigorous performance testing as other Neo4j components." (<http://docs.neo4j.org/chunked/milestone/cypher-query-lang.html>).

**Reference node**: "when a new Neo4j database is created, it already contains one single node, known as the reference node. This node can be used as a main entry point to the graph, and next we'll show a useful pattern for this." <http://blog.neo4j.org/2010/03/modeling-categories-in-graph-database.html>

**Subreference nodes:**: "In most real applications you'll want multiple entry points to the graph, and this can be done by creating subreference nodes. A subreference node is a node that is connected to the reference node with a special relationship type, indicating it's role." <http://blog.neo4j.org/2010/03/modeling-categories-in-graph-database.html>

## 2. Installation

You generally have two alternatives of using neo4j:

- **Standalone server**. Install and run neo4j is a standalone server
- **Embedded**. Install and run neo4j as part of your application

Which one to choose depends on what you are doing. Standalone server is generally a better choice if
you need to share your data among multiple applications and/or host it in a server.

Embedded mode is likely a better choice if you want to use neo4j internally in your application.

### 2.1. Installing as a standalone server

Get neo4j: <http://www.neo4j.org/install>

Unzip to selected target location (e.g. <code>C:\Program Files (x86)\neo4j</code>)

Start neo4j server:

    C:\Program Files (x86)\neo4j\bin\neo4j start

Make sure the server is running by visiting it with a browser:

    http://localhost:7474/

**Hint:** add neo4j bin folder to PATH so that you can simply use `neo4j` command in the future.

### 2.2. Installing as embedded

- Download and install Python neo4j embedded: http://pypi.python.org/pypi/neo4j-embedded/
- It's somewhat tricky on Windows and you probably need to solve some DLL problems. See the documentation.
  - Edit: your head will explode before you get this working. After 2 hours of debugging with Dependency Walker (<http://www.dependencywalker.com/>) I gave up. I'm pretty sure this can be done though.

### 2.3. Installing neo4j on Heroku

- Create a new Heroku app and add neo4j addon: <https://addons.heroku.com/neo4j>

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

### 4.1. With Python

Get py2neo: <http://py2neo.org/> (basically just `pip install py2neo`).
