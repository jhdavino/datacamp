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
- You can get data from forms using `request.form[form_name]`.
- flask also has a variant of the python logger system builtin which can be called using `app.logger.{debug, warn, info}()`.
- Responses will defaul to get requests.
- If you forget to include the `methods = ['GET', 'POST']`.
- To provide visual confirmation, one should always redirect to a page confirming the transaction.
- flask has a module called `redirect` to do just that.
- To use it, `return redirect( url_for( 'page.html'))`.
- Request is globally available but contextualized per user.
- It only works inside of Views.
- It contains objects such as:
	* form:    data of a submitted form.
	* args:    contents of GET submits.
	* cookies: contents of cookies.
	* headers: incoming headers as dict.
	* files:   files uploaded via PUT, POST
	* method:  current method type.
- flask also has a Session object to remember data between requests.
- It is also global, but contextual.
- flask uses `Flask.secret_key` to set the cookie.
- You can store data in the session by treating it like a dictionary.
- We're going to use it to store a `flash()` message after user submit it successful.
- You can include configuration settings in a config file.
- You access that file's values using `app.config['value']`.
- To access them via the templates, use:
```python
{% with messages = get_flashed_messages() %}
	{% if messages %}
	...
	{% for message in messages %}
		{{ message }}
	{% endfor}
	{% endif %}
{% endwith %}
```
- Don't forget to end all your conditionals.
- Jinja also supports `{% elif %}`.
- We could validate the forms itself, but Flask-WTF does much of this for us.
- This uses WTForms, which is its own technology.
- You need to install this in your project using `pip install flask-wtf`.
- It is good practice to include a forms.py to separate all your forms into.
- Remember that all forms *MUST* inherit from the class **Form**.
- The format is:
```python
from flask_wtf import Form
from wtforms.fields import StringField
from flask.ext.wtf.html5 import URLField
from wtforms.validators import DataRequired, url


class BookmarkForm( Form ):
	url = URLField( 'label_of_field', validators=[DataRequired(), url()])
	description = StringField('name_of_field')
```
- `DataRequired()` tells flask that the field cannot be empty.
- `url()` tells flask that this should be a valid url.
- In the views file, you can request that validation be run using `form.validate_on_submit()`.
- This will return a boolean value; which you can check against.
- When a form has already been generated, don't forget to pass it along with `render_template()`.
- In the template, you use `form.<variable_name>(size = <width>)`.
- You can access the data in a form using `form.url.data`.
- **ALWAYS INCLUDE THIS NEXT PART TO PREVENT CSRF ATTACKS**: `form.hidden_tag()`.
- If there are any errors, then `form.url.errors` will have a value.
- wtforms is lacking some of the forms via html5.
- You can also define your own validators.
- A macro field acts similar to a python function.
- Ex:
```python
{% macro render_field( field ) %}
	...
{% endmacro %}
```
- A jinja filter applys a rule to the output.
- One of these is called `safe` which treats the string given as literal.
- You can import these defined macros using `{% from "form.html" import macro_name %}`.

# Persistence
-

# 
# 
# 

# Resources:
- [Initializr](http://www.initializr.com)
- [Jinja2]( http://jinja.pocoo.org)
- [Merging Flask and Bootstrap](https://pypi.pythong.org/pypi/Flask-Bootstrap)
- [Jinja Control Structures]( http://jinja.pocoo.org/docs/dev/templates/#list-of-control-structures)
- 