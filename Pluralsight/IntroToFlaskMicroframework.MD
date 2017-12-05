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
- You will need `render_template` to combine templates and Views.
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
- A jinja filter applies a rule to the output.
- One of these is called `safe` which treats the string given as literal.
- You can import these defined macros using `{% from "form.html" import macro_name %}`.

# Persistence
- Time to start working with a database!
- We'll be using a library called Sqlalchemy for models.
- This is called an **Object Relational Manager**.
- Make sure to install using `pip install flask-sqlalchemy`.
- Models should be contained in `models.py`.
- Make sure to have your models inherit from whatever you call your databse reference; usually db.Model.
- Instances are created using `db.Column( <db.type> , ...)`.
- You only need to import `db` from you project name ; this case `thermos`
- `__repr__` is for **regular printing**.
- You can declare the database in project.app using:
```python
import os
from flask_sqlalchemy import SQLAlchemy

basedir = os.path.asbpath( os.path.dirname(__file__))

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(basedir, 'thermos.db')
db = SQLAlchemy(app)
```
- SQLalchemy also supports lots of other databases.
- Every instance represents a column in the table.
- When creating an instance, you can pass options:
	* primary_key=True ; obv.
	* nullable = False ; don't allow field to be empty.
- To create the database, call `db.create_all()` after importing all the necessary pieces.
- To table an object in preparation to submit, use `db.session.add( <object> )`.
- To submit an object tabled, use `db.session.commit()`.
- Each model also comes along with matching reference for building queries.
- To request data, use `<object>.query.get(<rownumber>)`.
- To filter data, use `<object>.query.filter_by(username = 'duders')`
- To actually get the data though, you need to append a `.all()` to the filter call.
- Make sure to import the models from the models.py file.
- `@staticmethod` means that you don't need the model to run it.
- You can order the results based on a field using `order_by( desc(Bookmark.date) ).limit( n )`.

- There are shortcut commands which you install with `pip install flask-script`.
- You import it using `from flask.ext.script import Manager, prompt_bool`.
- The functions for this look like:
```python
# Create the database on first run.
# manage.py
@manager.command
def initdb():
	db.create_all()
	print 'Initialized the database'

@manager.command
def dropdb():
	if prompt_bool("Are you sure you want to lose all your data"):
		db.drop_all()
		print "Dropped the database"

if __name__ == '__name__':
	manager.run()
```
- This allows you to type `python manage.py <command>` to run the command.
- You create a foreign key to connect models using `db.ForeignKey('user.id')`
- To connect the source table back, use `db.relationship('Bookmark', backref='user', lazy='dynamic')`.
- Looking at the lazy variable more:
	1. `lazy = 'static'` means only load when looked at.
	2. `lazy = 'joined'` means no lazy loading at all.
	3. `lazy = 'subquery'` means no lazy loading but takes place as a subquery.
	4. `lazy = 'dynamic'` means only load part of the data at a time.
- Proper nomenclature means that configuration data should be in __init__.py.
- When you use `<var_name>` in a route, then it allows it to be passed as a parameter.
- Ex: `@app.route('/user/<username>')`.
- You should also pass along, when requesting a query, `.first_or_404()` to manage if no data is found.


# Users And Authentication
- To allows users to login, we're going to need to use `pip install flask-login`.
- In the **__init__.py** file, you're going to want to include the following:
```python
from flask_login import LoginManager

#...

login_manager = LoginMaanger()
login_manager.session_protection = strong
login_manager.init_app( app )
```
- To restrict pages to users that are only logged in, use `@login_required`.
- You will need to `from flask_login import login_required`.
- Don't forget to create a page for the 401 error.
- You don't have to write a lot of your own code thanks to `UserMixin`.
- This module adds:
	1. `is_active()`
	2. `is_authenticated()`.
	3. `is_anonymous()`.
	4. `get_id()`
- To allow for logins you will need:
```python
# in forms.py
from wtforms.fields import StringField, PasswordField, BooleanField, SubmitField

# in views.py
from flask_login import login_required, login_user
from forms import BookmarkForm, LoginForm
```

- This is starting to get very code heavy
```python
# inside views.py
@login_manager.user_loader
def load_user(userid):
	return User.query.get( int(userid))
```
- If you want users to be forwarded to the login page, then include `login_manager.login_view = "login"`
- This will tell loginmanager what the default page is.
- The request object also contains the page the user was trying to visit in `request.args.get('next')`.
- While a user is logged in, login manager maintains a variable called `current_user`.
- To assist with security around users, flask uses *Werkzeug*.
- We'll need `from werkzueg.security import check_password_hash, generate_password_hash`
- Then, we can add the has to the User model via `password_hash = db.Column(db.String)`.
```python
# include with User Model:
@property
def password(self):
	raise AttributeError('password: write-only field')

@password.setter
def password(self, password):
	self.password_hash = generate_password_hash( password )

def check_password( self, password):
	return check_password_hash(self.password_hash, password)

@staticmethod
def get_by_username( username ):
	return User.query.filter_by( username = username).first()

def __repr__(self):
	return "<User '{}'>".format(self.username)
```

- You can validate the length of a field using `Length(min, max)`.
- You can also add your own regular expression using `Regexp(..., message = "Whatever was the reason for failure")`.
- To ensure that two fields are identical, simply pass validator `EqualTo( <fieldname>, message= "")`,
- Don't forget to check if a username or a email already exists:
```
def validate_email( self, email_field):
	if User.query.filter_by( email = email_field.data).first():
		raise ValidationError('There is already a user with this email address.')

def validate_username( self, username_field):
	if User.query.filter_by( username = username_field.data).first():
		raise ValidationError('There is already a user with this username')

# Managing Bookmarks
- Another jinja filter: truncate(char_limit, killwords=True)`
- **killwords** means that it will not complete the word before truncating.
- `moment()` is a javascript call that formats dates in a clean way.
- To use this, you will need to install `pip install flask-moment` which pulls in the library.
- You will also need the lines `from flask.ext.moment import Moment` and `moment = Moment(app)` in **__init__.py**.
- Moment also includes a clean way to import jquery and itself:
```python
{{ moment.include_jquery() }}
{{ moment.include_moment() }}
```
- You can include the new file using `{% include "file.html" %}`.
- You can make a route type conditioned using `<int:value_name>`.
- You can call an error using `abort(403)`.
- Flask-WTF has the method `form.populate_obj( var_name )` to autofill values from form.
- Filters are special functions in Jinja that can be chained using `|`.
- You can even add your own filters.
- To manage database migrations, you use `pip install flask-migrate`.
- Then, you add the blocks:
```python
from flask.ext.migrate import Migrate, MigrateCommand

migrate = Migrate(app, db)
manager.add_command( 'db', MigrateCommand) # higher order function?
```
- After this is done, you *must* run `python manage.py db init`.
- Then, you can run `python manage.py db migrate` to generate the script to do the work.
- This gives you acess to two new commands: `upgrade()` and `downgrade()`.
- You can create a lower level table using `var_name = db.Table( .. )`.
```python
# code to create a many-to-many relationship
_tags = db.relationship('Tag',      # Class to use as model
	secondary = tags,               # table to connect to.
	backref=db.backref('bookmarks', # second table to connect to.
		lazy='dynamic'))            # obv.
```
- `text.strip()` will delete all white space.
- `table_name.get_or_create( value )` will insert a new value if it already doesn't exist.
- The code for this function is:
```python
@staticmethod
def get_or_create(name):
	try:
		return Tag.query.filter_by(name = name).one()
	except:
		return Tag(name = name)
```
- Worth mentioning the format for list comprehensions: `[ text.strip() for text in string.split(',')]`
- We're going to use a js library called *Select2* to assist; link below.
- Calling `super()` in a child page will insert the parent's content block instead.
- You can also pass `id="tags"` to `render_field()` to add identifying information.
- Jinja has a `map(attribute='name')` to create a generator function.
```js
// This expression takes a json object.
// And will convert this into a comma separated list
// Inserted into the element #tags.
$(#tags).select2({tags: _tags, tokenSeparators: [",", " "]});
```
- You can set a function to be global across all templates using:
```python
@app.context_processor
def inject_tags():
	return dict(all_tags=Tag.all)
```
- You delete something using `db.session.delete( item )`.
- Don't forget to commit.


# When Your App Grows
- We're going to be using a tool to debug `pip install flask
- In __init__.py, `from flask_debugtoolbar import DebugToolbarExtention`
- ..              `toolbar = DebugToolbarExtension( app )`.
- This gives you a toolbar that gives you lots of information about the webpage.
- **Blueprints** are used for breaking up projects.
- To use, create a new folder of the blueprint name.
- Then, create an init file containing:
```python
from flask import Blueprint

dir_name = Blueprint('dir_name', __name__)

from . import views
```
- This package only imports what you need.
- This means app is not imported.
- In the project __init__.py, you include:
```python
from .dir_name import dir_name as dir_name_blueprint
app.register_blueprint( dir_name_blueprint, url_prefix='/dir_name')
```
- Any calls to **auth** subdirectory will be redirected to the blueprint.
- When refering to a blueprint's views, you need to include `url_for('dir_name.signup')` for example.
- Don't forget to change the login_manager reference since it will break otherwise.
- Blueprints are app-like but is not an app.
- These should be used as often as possible so that different teams can work on different parts.
- It it proper practice to create blueprints like their own packages.
- Make sure to Unit Test your app.
- You'll need a folder test for this.
- To use them, `from flask.ext.testing import TestCase`.
- This is dependent on `pip install flask-testing`.


# Resources:
- [Initializr](http://www.initializr.com)
- [Jinja2]( http://jinja.pocoo.org)
- [Merging Flask and Bootstrap](https://pypi.pythong.org/pypi/Flask-Bootstrap)
- [Jinja Control Structures]( http://jinja.pocoo.org/docs/dev/templates/#list-of-control-structures)
- [Select2 js](https://ivaynberg.github.io/select2/)

# Research
- Alembic
- `db.relationship()`
