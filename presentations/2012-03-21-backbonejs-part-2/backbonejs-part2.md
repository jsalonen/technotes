3.7.2012 (revised: 20.3.2012)

# A Backbone.js Tutorial for the Impatient

### Part 2: Full Backbone.js Stack

By: **Jaakko Salonen (@jsalonen)**

---

# Prerequisites

- Read through and implement tutorial Part 1

---

# Finishing Page Editor (1/2)

Let's add title editing. Replace `index.html` with:

    <h1 class="page-title">
      <span class="editor hidden">
        <input class="title" type="text">
        <a href="#" class="btn save">save</a>
      </span>
      <span class="rendered"><%= title %> (#<%= id %>)</span>
    </h1>
    <div class="page-content">
      <div class="editor hidden">
        <p><textarea rows="25" cols="80"></textarea></p>
        <p><input type="submit" value="Save"></p>
      </div>
      <div class="rendered">
        <%
          var content = (new Showdown.converter()).makeHtml(content);
        %>
        <%= content || '<em>(no content)</em>' %>
      </div>
    </div>

(continued...)

---

# Finishing Page Editor (2/2)

Rewrite `Example.Views.Index` in `app/modules/example.js`:

    Example.Views.Index = Backbone.View.extend({
      el: '#main',
      template: "app/templates/index.html",
      events: {
        "click .page-title": "editTitle",
        "click .page-title .editor .save": "saveTitle",
        "click .page-content .rendered": "editContent",
        "click .page-content input[type='submit']": "saveContent",
      },
      render: function() {
        var view = this;
        namespace.fetchTemplate(this.template, function(tmpl) {
          view.el.innerHTML = tmpl(view.model.toJSON());
        });
      },
      editContent: function() {
        var content = this.model.get('content');
        $('.page-content .rendered').hide();
        $('.page-content .editor').removeClass('hidden');
        $('.page-content .editor textarea').html(content);
      },
      saveContent: function() {
        var content = $('.page-content .editor textarea').val();
        this.model.set('content', content);
        this.model.save();

        $('.page-content .editor').addClass('hidden');
        $('.page-content .rendered').removeClass('hidden');
        
        this.render();
      },
      editTitle: function() {
        var title = this.model.get('title');
        $('.page-title .rendered').hide();
        $('.page-title .editor').removeClass('hidden');
        $('.page-title .editor input.title').val(title);
      },
      saveTitle: function() {
        var title = $('.page-title .editor .title').val();
        this.model.set('title', title);
        this.model.save();

        $('.page-title .editor').addClass('hidden');
        $('.page-title .rendered').removeClass('hidden');

        this.render();
        return false;
      },
    });

---

# WOW! That was a mouthful!

Problems:

- Verbose, repetitive code
 - Duplicate selectors for elements in events, edit and save.
 - Manual model updates
 - Could we simplify the code?

**-> LET'S REFACTOR**

---

# Introducing Backbone.modelBinding

- Convention-based (awesome) model binding for Backbone.js
- Get it from: <https://github.com/derickbailey/backbone.modelbinding>
- Save as `assets/js/libs/backbone.modelbinding.js`

Setup `config.js` (works with RequireJS = no need for `use` plugin):

    "backbone.modelbinding": "../assets/js/libs/backbone.modelbinding",
    ...
    "backbone.modelbinding": {
      deps: ["use!backbone", "use!underscore", "jquery"],
      attach: "Backbone"
    },

Our current stack needs a hack to modelbinding.js. Locate line:

    if (typeof define === 'function' && define.amd) {

and change it to:

    if (false/*typeof define === 'function' && define.amd*/) {

Sorry.

---

# Using Backbone.modelBinding

Load it in `app/module/example.js`:

    "use!backbone.modelbinding",

We need to change `render` to run bindings as follows:

    view.el.innerHTML = tmpl(view.model.toJSON());
    Backbone.ModelBinding.bind(view);

Bind rendered title via `data-bind` attribute:

    <span class="rendered"><span data-bind="title"></span> (#<%= id %>)</span>

Bind title input element via `id`:

    <input class="title" id="title" type="text">

(continued)

---

# Refactored Title Editing

Manual updates between model and rendered view can now be removed.
New functions now look like:

    editTitle: function() {
      $('.page-title .rendered').hide();
      $('.page-title .editor').removeClass('hidden');
    },
    saveTitle: function() {
      this.model.save();
      $('.page-title .editor').addClass('hidden');
      $('.page-title .rendered').removeClass('hidden');
      this.render();
      return false;
    }

**Drill: now do the same modelBinding refactoring for content editor!**

---

# Fully Refactored Example.Views.Index

    el: '#main',
    template: "app/templates/index.html",
    events: {
      "click .page-title": "editTitle",
      "click .page-title .editor .save": "saveTitle",
      "click .page-content .rendered": "editContent",
      "click .page-content input[type='submit']": "saveContent"
    },
    render: function() {
      var view = this;
      namespace.fetchTemplate(this.template, function(tmpl) {
        view.el.innerHTML = tmpl(view.model.toJSON());
        Backbone.ModelBinding.bind(view);
      });
    },
    editContent: function() {
      $('.page-content .rendered, .editor').toggleClass('hidden');
    },
    saveContent: function() {
      this.model.save();
      $('.page-content .rendered, .editor').toggleClass('hidden');
      this.render();
    },
    editTitle: function() {
      $('.page-title .rendered, .editor').toggleClass('hidden');
    },
    saveTitle: function() {
      this.model.save();
      $('.page-title .rendered, .editor').toggleClass('hidden');
      this.render();
      return false;
    }

Much nicer!

---

# Our Time is Up

Further improvements to consider:

- Go strategic from tactical coding with testing (Jasmine, QUnit)
- Clean up unused boilerplate code / components
- Switch localStorage to a REST backend (more trivial than you would think)
- Grid layout, nicer looking UI components ([960.gs](http://960.gs/), [Bootstrap](http://twitter.github.com/bootstrap/), etc.)
- Localization

---

# See you in Part 2

## Thank you!

- Jaakko Salonen 
 - Use twitter ([@jsalonen](http://twitter.com/jsalonen)) for questions (follow me to receive updates!)
