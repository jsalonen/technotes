3.7.2012

# A Backbone.js Tutorial for the Impatient

### Part 1: How to Get Your Hands Dirty with Backbone.js in 5 Minutes

![Image](https://github.com/jsalonen/technotes/raw/master/presentations/2012-03-07-backbonejs-part-1/6185783412_04dd8bfe87_z.jpg)

By: **Jaakko Salonen (@jsalonen)**

<span style="font-size: 50%">
  Image: Marine Corps Archives &amp; Special Collections. <a href="http://www.flickr.com/photos/usmcarchives/6185783412/sizes/m/in/photostream/">Some rights reserved.</a>
</span>
<br>
<span style="font-size: 50%">
  Presentation powered by <b>QuickSlides &lt;https://github.com/airportyh/QuickSlides&gt;</b>
</span>

---

# Prerequisites

- Rationale: quick and dirty tools that help us to hack up what we need
- Don't worry about them right now, just install and use as needed

**Node.js**

- Used for the build process as well as a light-weight test server
- Get it from <http://nodejs.org/> 

**Git**

- Used to get stuff from git repositories quickly
- Get it from <http://git-scm.com/>

Done? Now let's get started

---

# Creating your project

- We use [Backbone boilerplate](https://github.com/tbranyen/backbone-boilerplate) to avoid writing all the boilerplate code (it's not all roses)
- It also provides ready conventions so you can focus on the code

Creating our project:

    git clone https://github.com/tbranyen/backbone-boilerplate.git myproject
    cd myproject
    rm -Rf .git (*, **)
    node build server

- Open [localhost:8000](http://localhost:8000)

IT'S ALIVE

- (*) `rmdir /s /q .git` if in Windows Command Prompt
- (**) `Remove-Item -Recurse -Force .git` if in Windows PowerShell

---

# Routers

- Let's make our own index page with routers:

`app/main.js`

    initialize: function() {
      this.exampleRouter = new Example.Router();
    },

    index: function(hash) {
      return this.navigate('test', true);
    }


`app/modules/example.js`

    Example.Router = Backbone.Router.extend({
      routes: {
        "": "index"
      },

      index: function() {
        $('#main').html('<h1>Hello World</h1>');
      }
    });

Check your browser

---

# Views

Instead of directly manipulating DOM, le't's make the page with a view.

`app/mains.js`

    index: function() {
      var index = new Example.Views.Index();
      index.render();
    }  

    Example.Views.Index = Backbone.View.extend({
      el: '#main',
      template: "app/templates/index.html",
      render: function() {
        var view = this;
        namespace.fetchTemplate(this.template, function(tmpl) {
          view.el.innerHTML = tmpl({name: 'World'});
        });
      }
    });

`app/templates/index.html`

    <h1>Hello, <%= name %>!</h1>

Note the template syntax ([underscore's](http://documentcloud.github.com/underscore/#template) microtemplates)

---

# Refactoring to Support Multiple Pages (1/2)

Add stub model for webpages:

    Example.Webpage = Backbone.Model.extend({
      defaults: {
        title: 'Untitled',
        content: 'No content',
      }
    });

Add new route to router:

    ":pageid": "index"

Rewrite index in router:

    index: function(pageid) {
      if(pageid === undefined) {
        pageid = 1;
      }
      var index = new Example.Views.Index();
      index.model = new Example.Webpage({'id': pageid});
      index.render();
    }

(I won't work just yet)

---

# Refactoring to Support Multiple Pages (2/2)

Pass Webpage model to template in render.

Change

    tmpl({name: 'World'})

to:
    
    tmpl(view.model.toJSON())

Finally update template:

    <h1>Hello Page #<%= id %>!</h1>

Done!

- Try different URLS ([/](http://localhost:8000/), [/1](http://localhost:8000/1), [/#2](http://localhost:8000/#2))

- Try back and forward 

---

# Managing Models with a Collection

Add after your model definition:

    Example.Webpages = Backbone.Collection.extend({
      model: Example.Webpage,
      //localStorage: new window.Store("Webpages") // comment for now
    });

Rewrite router function for index:

    if(pageid === undefined) {
      pageid = 1;
    }

    var webpages = new Example.Webpages();
    //webpages.fetch(); // comment for now
    var this_page = webpages.get(pageid);

    if( this_page === undefined ) {
      this_page = new Example.Webpage({id: pageid});
      webpages.add(this_page);
      //this_page.save(); // comment for now
    }

    var index = new Example.Views.Index();
    index.model = this_page;
    index.render();

Try it (not very useful yet)

---

# Persisting Models with HTML5 localStorage

- Get the adapter file from [github.com/jeromegn/Backbone.localStorage](https://github.com/jeromegn/Backbone.localStorage/)
- Save as `assets/js/libs/backbone.localstorage.js`

`config.js` section `paths` (after backbone):

    localstorage: "../assets/js/libs/backbone.localstorage",

`config.js` section `use` (after backbone):

    localstorage: {
      deps: ["use!backbone", "use!underscore"],
      attach: "Backbone"
    },

`example.js` function `define` (add row after `"use!backbone",`):

    "use!localstore"

**Uncomment lines from previous slide**

---

# Adding Flesh - Edit Content

Now that our data is safe (in browser), we can start adding some content.

`app/templates/index.html`

    <h1 class="page-title"><%= title %> (#<%= id %>)</h1>
    <div class="page-content">
      <div class="editor hidden">
        <p><textarea rows="25" cols="80"></textarea></p>
        <p><input type="submit" value="Save"></input></p>
      </div>
      <div class="rendered"><%= content %></div>
    </div>

`app/modules/example.js` tweak the view (Example.Views.Index):

    events: {
      "click .page-content .rendered": "editContent",
    },
    ...
    editContent: function() {
      var content = this.model.get('content');
      $('.page-content .rendered').hide();
      $('.page-content .editor').removeClass('hidden');
      $('.page-content .editor textarea').html(content);
    }

---

# Adding Flesh - Save Edited Content

`app/modules/example.js`

    events: {
      ...
      "click .page-content .editor input[type='submit']": "saveContent"
    },
    ...
    saveContent: function() {
      var content = $('.page-content .editor textarea').val();
      this.model.set('content', content);
      this.model.save();

      $('.page-content .editor').addClass('hidden');
      $('.page-content .editor textarea').html('');
      $('.page-content .rendered').removeClass('hidden');
      
      this.render();
    }    

---

# Eye Candy - Markdown Renderer Hook-up (1/2)

Let's hook up showdown.js (a JavaScript Markdown converter)

Get library:

    https://github.com/github/github-flavored-markdown/blob/gh-pages/scripts/showdown.js

`app/config.js`

    showdown: "../assets/js/libs/showdown",

    use: {
      ...
      showdown: {
        attach: "Showdown"
      }
    }

---

# Eye Candy - Markdown Renderer Hook-up (2/2)

`app/main.js`

    "use!backbone",
    "use!showdown"
    ...
    function(namespace, Backbone, Showdown) {

Now start using it in template:

`app/templates/index.html`

    <div class="rendered">
    <% var converter = new Showdown.converter(); %>
    <%= converter.makeHtml(content) %>
    </div>

---

# Our Time is Up

Further improvements to consider:

- Add functionalities: title editing, page list, etc. (+refactoring!)
- Start using boilerplate's build system (or switch to your own)
- Go strategic from tactical coding with testing (Jasmine, QUnit)
- Clean up unused boilerplate code / components
- Switch localStorage to a REST backend (more trivial than you would think)
- Grid layout, nicer looking UI components ([960.gs](http://960.gs/), [Bootstrap](http://twitter.github.com/bootstrap/), etc.)

---

# Thank you!

- Jaakko Salonen 
 - Use twitter ([@jsalonen](http://twitter.com/jsalonen)) for questions (follow me to receive updates!)
