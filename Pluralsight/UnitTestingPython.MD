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
- To understand what you need to build, you will certainly need to collabrate.
- You can think of the tests as *Executable Specification*.
- The tests will force you to decompose your problem into units that are independently testable.
- A **Regression** is when something used to work by no longer does.
- There are three places for tests:
  1. Test First.
  2. Test Last.
  3. Test Driven.
-



# Using Pytest for Unit Testing in Python

# Testable Documentation with Doctest

# Test Doubles: Mocks, Fakes and Stubs

# Test Coverage and Parameterized Tests

# Research:
- Continuous Integration Server?


# Reference:
- [Martin Fowler Continuous Integration](www.martinfowler.com/articles/continuousIntegration.html)
