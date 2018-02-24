# Unit Testing with Python
## Emily Bache

# Unit Testing with Python - Basic Example Using unittest
- A **Unit Test** is defined as a small test for a single element of code.
- Where **element of code** means a method or function.
- These are automated and report a simple pass/fail to each test.
- With the strictest definition, if must not use the filesystem, a database or the network.
- You will import from the package `unittest`:
```python
import unittest

class PhonebookTest( unittest.TestCase):
  def test_create_phonebook(self):
    phonebook = Phonebook()
```
- A **Test Case** is a test that can be run independently of other tests and is a *unit test*.
- You will **Assert** a return value against what you expect to check for mode errors.
- An example would be with `self.assertEqual()`.
- A **Test Runner** is a program that executes the test and displays the results.
- For *Python3*, it is already builtin and can be called using `-m unittest`.
```python
def test_missing_entry_raises_KeyError(self):
  phonebook = Phonebook()
  with self.assertRaises(KeyError):
    phonebook.lookup('missing')
```
- You can run only a single test using `python3 -m unittest -q test_phonebook.PhonebookTest.test_lookup_entry_by_name`.
- A **Test Suite** is just a bunch of *Test Cases* that can been ran together.
- You use a decorator to tell the testing run to skip that test:
```python
@unittest.skip('WIP') # the passed string is a comment.
```
- You can refactor code so that it uses a *Test Setup* function.
- It's simply `def setUp(self)` and then whatever code you need inside it.
- There is also a `def tearDown(self)` that runs after each case too.
- A *Test Case* will have a name as well as three parts:
  1. Arrange: set up the object and collaborators.
  2. Act: Exercise the functionality on the object.
  3. Assert: Make claims about the object & its collaborators.
- There can, and maybe should be, a fourth step called **Clean up**.


# Why and When Should You Write Unit Tests
- There are a few reason why to labor through the *Testing Suite* building:
  * Understand what you want to build.
  * They document the code you've written.
  * They help you design the units.
  * They protect against regression in the project.
- To understand what you need to build, you will certainly need to collaborate.
- You can think of the tests as *Executable Specification*.
- The tests will force you to decompose your problem into units that are independently testable.
- A **Regression** is when something used to work by no longer does.
- There are three places for tests:
  1. Test First.
  2. Test Last.
  3. Test Driven.


# Using Pytest for Unit Testing in Python
- We'll be switching over to using **PyTest** now.
- **xUnit** is based on **JUnit** which is authored by Kent Beck and Erich Gamma.
- *PyTest* is not included by default and you wil need to install it yourself.
- This can be done using `pip install -U pytest`.
- Functions and files *must* be prefixed with `test_` for *pytest* to find it.
- When you run tests - using `python -m pytest` - it will show you relevant information around the failure.
- You will see details such as the line that failed, the objects on both sides and the code around it.
- You can add the error for pytest to include with `assert <assertion code>, 'Text to be used for printing'`.
- To check for exceptions, you will need to import *pytest* and use the `pytest.raises( <KeyError> )` function.
- You can also tell *pytest* to skip a test using `pytset.skip('text to display')`.
- If you use the decorator `@pytest.skip('text')` then the whole file is skipped with all the tests ignored.
- Instead of setup and teardown functions, *pytest* uses decorator test fixtures instead.
```python
@pytest.fixture
def resource():
  return Resources()
```
- The name of the function becomes the name of the resource and will be used by functions further down.
- *Pytest* actually comes with quite a few fixtures built in by default.
- If you need to clean up changes before moving on to the next test, then you'll include a **Finalizer** inside the fixutre.
```python
# ... other stuff
def cleanup_resource():
  # code to clean up.
request.addfinalizer( cleanup_resource )
```
- Don't forget to adjust the fixture call to accept a `request` object.
- *Pytest* can create a temporary directory that gets cleaned up after running.
- The directory is actually one of the fixtures and is called `tmpdir`.
- You can see all the fixtures being added by appending `--fixtures` to you call to python.
- *Pytest* will still run *unittest* tests if it finds them in the directory.
- They don't deal well with each other's fixtures though so be wary.


# Testable Documentation with Doctest
- The point of doctest is to make documentation comments more truthful.
- It's good practice to include **Docstrings** to document how to use your functions.
- Those, however, end up out of date much of the time - which is where *doctest* comes in.
- The tests are included in the docstring and will be pulled from there.
- You run it using `python -m doctest <file>`; output is only displayed on errors.
- If you want to see all the tests and the outputs then pass `-v`.
- If you want *pytest* to find *doctest* then you need to pass `--doctest-modules` to *pytest*.
- *Doctest* is a stickler about exact results and variable outputs will sometimes throw false positives.
- You can intentionally sort the results so it's not dependent on the machine.
- *Doctest* is careful to strip out the line information when testing for Type Errors.
- It also uses `...` to stand for text you don't care about.
- You can tell *doctest* to ignore output using `#doctest: +ELLIPSIS`.
- Using wildcards can be dangerous.
- You can request that *doctest* run a text file full of the tests using `python -m doctest <filename>`.
- Make sure to import the python dependencies at the top of the file.


# Test Doubles: Mocks, Fakes and Stubs
- 

# Test Coverage and Parameterized Tests

# Research:
- Continuous Integration Server?


# Reference:
- [Martin Fowler Continuous Integration](www.martinfowler.com/articles/continuousIntegration.html)
