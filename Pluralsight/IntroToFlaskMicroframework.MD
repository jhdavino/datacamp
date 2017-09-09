# Introduction to the Flask Microframework
## Reindert-Jan Ekker

# Getting Started
- Steps:
	1. Install Python, Pip.
	2. Install virtualenv
	3. Create project environment
- Should install virtualenvwrapper.
- You want to work in a virtual environment to avoid dependency issues.
- For the wrapped version, issue `workon` instead of `source` to activate.
- To disengage, use `deactivate`.
- Flask creates a map for the app.
- You can see this by starting an interpretor and calling `app.url_map`.
- Flask has a static route that is set up by default.
- Most Flask apps will follow the Model, Template, View approach.
- Models are for encapsulating data.
- Templates tell Flask how to display responses to requests.
- Views are the software component that ties everything together.

# Basic Templates and Views
- There are resources to start building templates.
- I'm not going to download them right now since I'm interested in the code and concepts, not the project.
- You will need `rnder_template` to combine templates and Views.
- `render_template` will use the templates folder by default when looking up a template you've built.
- To enable debug mode, you pass `debug=True` to `app.run()`.
- Don't forget to remember to adjust the paths in files.
- You imbed values in the HTML template using `{{ name_of_variable }}`.
- You can then pass `name_of_variable = "Turtles"` to the `render_template` to insert it.
- You can also use dot notation since it's considered Python inside those blocks.
- Using `url_for( 'page')` for create the url structure for thee page that you're looking up.
- You can tell Flask to load other pages by using `{% block page %} {% endblock %}`.
- This allows one to modularize pages and update each piece individually.
- To extend a page's variable space, one will need to include `{% extends "page.html" %}`.
- If you include a block in the child, then it will override the parent's content.
- You can also do this for resources to assist with managing them long term.
- Don't forget to manage the page load error pages.
- In Flask, those blocks are managed with `@app.errrorhandler( <nnn> )`.
- The format should look like `return render_template('nnn.html'), nnn`.

# Forms and View Logic
- We'll be using **Flask-WTF** for forms.
- To handle requests, you will need to import `request` from `flask`.
- This will allow you to set behaviors conditionally based on `request.method`.



# 
# 
# 
# 

# Resources:
- [Initializr](http://www.initializr.com)
- [Jinja2]( http://jinja.pocoo.org)
- [Merging Flask and Bootstrap](https://pypi.pythong.org/pypi/Flask-Bootstrap)
- 