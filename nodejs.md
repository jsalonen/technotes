# Node.js

Lessons learned from node.js stuff so far:

- npm is awesome
- Windows support for some node stuff is horrible

## Beginning node.js

Beginner's guide: <http://nodeguide.com/beginner.html>

Getting started with Node.js, npm, Coffeescript, Express, Jade and Redis:
<http://blog.xebia.com/2011/06/24/getting-started-with-node-js-npm-coffeescript-express-jade-and-redis/>

## NPM

NPM = Package manager for Node

### General stuff about npm packages

- Global modules
 - Windows: ~\AppData\Roaming\npm\node_modules
 - Use npm with -g switch to install as a global module
- Project-specific modules
 - [projectname]/node_modules

### Install new package

    npm install [packagename]

### List installed modules

    npm list

## Beginning express.js with MongoDB

See: <http://howtonode.org/express-mongodb>

Setup script is really nice:

    mkdir [project]
    cd project
    express -c stylus
    npm install -d

## Node.js IDEs

- Textmate, Sublime Text, etc.
- You must know Cloud9 IDE: <http://c9.io/>

## Deploying node

Cloud hosting:

- Heroku <http://devcenter.heroku.com/articles/node-js>
- Joyent <http://www.joyent.com/>

Self-hosted:

- upstart + monit
   <http://howtonode.org/deploying-node-upstart-monit>

## Running Node.js on Windows

I wouldn't deploy node.js apps on Windows machines, but developing stuff locally on a Windows machine is an option nice to have. **A word of warning: node.js and Windows are not best friends. Usually you are just fine, but some stuff may be tricky (or even impossible).**

### Specific problem: Installing Contextify on Windows from git

This is what I went through:

Found out that node-gyp allows you to work around installing contextify on Windows <https://github.com/brianmcd/contextify/pull/17>.

Stuff I tried out:

    npm install -g node-gyp
    git clone https://github.com/brianmcd/contextify.git
    cd contextify
    node-gyp clean
    node-gyp configure
    node-gyp build

FAILS (msbuild.exe)

- Added "C:\Windows\Microsoft.NET\Framework64\v2.0.50727" to path

FAILS (VCBuild.exe)

- VC++ compiler is needed, which I don't have
- First thought: "F*** this, I'm gonna switch to Linux"
- Second thought: maybe somebody has already made pre-built binaries?
 - <https://github.com/tmpvar/jsdom/issues/360>
 - <https://github.com/Benvie/contextify/blob/master/build/Release/contextify.node>
- Copied contextify.node (see above) under node_modules

Tried out if it works:

    node
    > require('contextify')
    { wrap: [Function] }

Not sure what this means...

Another problem: npm still struggles with installing modules that depend on contextify:

    npm install jsdom
    "Failed at the contextify@0.1.1 preinstall script.""

Back to drawing board.

Contextify "fork for Windows":

- Installed Visual Studio (sigh)
- git clone https://github.com/Benvie/contextify.git
- Opened the VC project in Visual Studio
 - Build: "Error	1	error D8016: '/ZI' and '/Ox' command-line options are incompatible"

Retrying via gyp (now Visual Studio is installed):

    git clone https://github.com/brianmcd/contextify.git
    cd contextify
    node-gyp clean
    node-gyp configure
    node-gyp build 

HELL YEAH!!!!!! (tip: use node-gyp build -v for more verbose output)

Copied generated `Release/contextify.node` to `node_modules/contextify.node`

Tried out if it works in:

    node
    > require('contextify')
    { ContextifyContext: [Function: ContextifyContext] }

Seems much better.

Ok let's see what happens when we try to install some dependent libraries locally (like jsdom):

    npm install jsdom

OK! But:

- install -g still fails
- Seems like its a good idea to plant this custom built module per project

Seems like I finally got it working with jsom by doing it this way:
 - Clean local node_modules folder
 - Copy freshly built contextify.node  under node_modules
 - Install jsdom with npm install jsdom
 - Make sure you don't spoil this build by letting npm f*** up contextify by auto-building it

What eventually worked out:

 - node-gyp
 - MS Visual Studio
 - A LOT OF PATIENCE and keeping fingers crossed

This stuff seriously sucked.

