3.7.2012 (revised: 20.3.2012)

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

- Used to get stuff from git repositories quickly.
- Get it from <http://git-scm.com/>

Done? Now let's get started

---

# Creating your project

- We use [Backbone boilerplate](https://github.com/tbranyen/backbone-boilerplate) to avoid writing all the boilerplate code (it's not all roses)
- It also provides ready conventions so you can focus on the code

Creating our project:

    git clone https://github.com/tbranyen/backbone-boilerplate.git myproject
    cd myproject
    node build server

- Delete `.git` folder
- Open [localhost:8000](http://localhost:8000)

**IT'S ALIVE**

---

# Routers

- Let's make our own index page with routers:

Implement the Router in `app/modules/example.js`:

    Example.Router = Backbone.Router.extend({
      routes: {
        "": "index"
      },

      index: function() {
        $('#main').html('<h1>Hello World</h1>');
      }
    });

Hook it to the main router `app/main.js`:
    
    initialize: function() {
      this.exampleRouter = new Example.Router();
    },

# Building and validating

Build and validate the app:

    node build

If everything is ok, you get `Done, without errors.`.

Set development server back up:

    node build server

Check your browser. Repeat these steps after future slides as well.

---

# Views

Instead of directly manipulating DOM, let's make the page with a view.

Modify `app/modules/example.js` (overwrite old `index`):

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
          view.el.innerHTML = tmpl({name: 'world'});
        });
      }
    });

`app/templates/index.html`

    <h1>Hello <%= name %> from app/template/index.html!</h1>

Note the template syntax ([underscore's](http://documentcloud.github.com/underscore/#template) microtemplates)

---

# Refactoring to Support Multiple Pages (1/2)

Add a stub Webpage model to `app/modules/example.js`:

    Example.Webpage = Backbone.Model.extend({
      defaults: {
        title: 'Untitled',
        content: 'No content'
      }
    });

Add new route:

    ":pageid": "index"

And rewrite `index` again:

    index: function(pageid) {
      if(pageid === undefined) {
        pageid = 1;
      }
      var index = new Example.Views.Index();
      index.model = new Example.Webpage({'id': pageid});
      index.render();
    }

(continue...)

---

# Refactoring to Support Multiple Pages (2/2)

Pass Webpage model to template in `render` (still editing `app/modules/example.js`)

    view.el.innerHTML = tmpl(view.model.toJSON());

And finally rewrite `app/templates/index.html`:

    <h1>Hello Page #<%= id %>!</h1>

Done! Try different URLS and back and forward:

- [http://localhost:8000/](http://localhost:8000/)
- [http://localhost:8000/1](http://localhost:8000/1)
- [http://localhost:8000/#99](http://localhost:8000/#99)

---

# Managing Models with a Collection

Add after your model definition (still editing `app/modules/example.js`):

    Example.Webpages = Backbone.Collection.extend({
      model: Example.Webpage,      
      //localStorage: new window.Store("Webpages") // comment for now
    });

Rewrite `index` in Router (again):

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

- Get `backbone.localStorage.js` from [github.com/jeromegn/Backbone.localStorage](https://github.com/jeromegn/Backbone.localStorage/blob/master/backbone.localStorage.js):
- Save as `assets/js/libs/backbone.localStorage.js`

Add following lines to `config.js` (after `backbone` sections):

    "backbone.localStorage": "../assets/js/libs/backbone.localStorage",

    ...

    backbone.localStorage: {
      deps: ["use!backbone", "use!underscore"],
      attach: "Backbone"
    },

`app/modules/example.js` function `define` (add row after `"use!backbone",`):

    "use!backbone.localStorage"

**Uncomment lines from previous slide**

Browse through pages and watch out how localStorage content changes. Run e.g. in Firebug:

    console.dir(localStorage);

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

`app/modules/example.js` add to `Example.Views.Index`:

    events: {
      "click .page-content .rendered": "editContent"
    },
    editContent: function() {
      var content = this.model.get('content');
      $('.page-content .rendered').hide();
      $('.page-content .editor').removeClass('hidden');
      $('.page-content .editor textarea').html(content);
    },

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

Get the library (save as `../asets/js/libs/showdown.js`):

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

`app/modules/example.js`

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

# Building for production

Run build script (default build target):

    node build

Check that everything was ok. For more info, use:

    node build --help

Build for release:

    node build release

Run release build on local server:

    node build server:release

**YSlow gives us Grade A (overall performance score 94)**

---

# See you in Part 2

## Thank you!

- Jaakko Salonen 
 - Use twitter ([@jsalonen](http://twitter.com/jsalonen)) for questions (follow me to receive updates!)
