# Command Line Automation in Python
## Noah Gift

# IPython shell commands
- "Most of my experience has been automating myself out of a job and as a result gaining a better one."
- The Three Laws of Automation:
  1. Any task talked about being automated will be.
  2. If it isn't automated, then it is broken.
  3. If a human is doing it, then a machine will eventually do it better.
- IPython allows shell commands to be run using `!`
- Using the columnar structure, we can parse it into a Slist datatype.
- When you collect the output, it is in a datatype called **Slist**.
- This datatype is actually quite powerful and comes with ways to extract from fields.
- You can call the file itself or you can test small snippets of code using:
```bash
python -c "import datetime;print(datetime.datetime.utcnow())"
```
- One of the most important principles of Unix is that the operating system should contain simple applications which can be connected together to create complex systems.
- One way to collect the output is with the bash magic command `%%bash --output` which will run a block of bash code and collect the output.
- Standard out and standard error both must be captured while doing this.
- You can collect the errors using:
```jupyter
%%bash --out output --err error
ls -l | awk '{ SUM+=$5} END {print SUM}'
echo "no error so far" >&2
```
- There are three main methods for an *SList* object:
  1. fields.
  2. grep
  3. sort
- The `fields()` method will accept a "wildcard" column selection:
```python
ls.fields(1,5)[1:4]
```
- The `grep()` method is basically grep like inside linux.
- The `sort()` method accepts two possible arguments:
  1. which column to sort on?
  2. whether to sort of alphanumeric values.
- It is also easy to treat them like regular lists and do things like `.pop()`.


# Shell commands with subprocess

# Walking the file system

# Command line functions

# Research:

# Reference:
