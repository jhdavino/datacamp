# Building Chatbots in Python
## Alan Nichol

# Chatbots 101
- We're going to be going over regex and ML ideas.
- Afterwards, you should be able to do things like:
  * Query a database.
  * Plan a Trip.
  * Help order coffee.
- The hard part is handling state.
- The simplest solution is to simply ignore it.
- The first bot will be echo bot - which will echo everything you say back to you.
- If there is no return statement, then it returns a `None`.
- We will be using the format `"Insert text {}".format( "here.")`.
- There is some level of discomfort that users will feel when getting instant responses.
- You can `import time` and use the function `time.sleep(<n>)` to delay the response by just a little bit.
- Creating a believable personality for the bot is a key difference in this endeavor vs normal software development.
- You can use a dictionary to store common answers to look up.
- You could also include templates in the responses dictionary and then modify it on the fly with variables.
- You'll also want some variability in responses.
- You can do this by `import random` and then selecting a choice from a list instead.
- You will use the function `random.choice()`.
- We will be using regex for:
  * Matching messages against known patterns.
  * Extracting key phrases.
  * Transforming Sentences Grammatically.
- Using regex in python is done via the `import re` package.
- They're used to define patterns to see if the pattern shows up in a string.
- `.` means match any character.
- `*` means match 0 or more of this patter.
- You can check if a pattern exists in a string using `re.search(pattern, message)`.
- Adding `()` defines what is called a **Group**.
- We can use the function `match.group()` to access all the matches.
- The full string is stored in index 0.
- You can use `re.sub(<text1>, <text2>, <string>)` to substitute text1 from string and replace it with text2.
- You can use the function `<dictionary>.items()` to return key, value pairs of values from a dictionary.

# Understanding Natural Language
- There is also the term **Natural Language Understanding**.
- It is a subfield of **Natural Language Processing**.
- The first block of interest is to consider the **inent** of the user.
- The second block would be about **Entities**, such as dates and places.
- A fundamental research area is **Named Entity Recognition** (NER).
- We'll start with regex detection - which is very fast but debugging is challenging.
- Python allows you to declare a **Word Boundary Condition** with `\b` on both sides of the regex.
- Don't forget to mark the text as a *string literal* by prefixing it with `r`.
- You can compile a pattern using `re.compile( <pattern> )`.
- You can then use the function `pattern.findall( <text> )`.
- **Machine Learning** is intended to expose a computer to a task and that they will get better at it over time.
- Training word vectors takes a lot of data and computational power.
- This is already largely been done.
- We'll be using the Word Vector **GloVe Algorithm**.
- We'll be using the package *SpaCy*.
```python
import spacy               # import library
nlp = spacy.load('en')     # load english dictionary
nlp.vocab.vectors_length   # dimensionality of vector.
doc = nlp('<message>')     # check words.

for token in doc:
  print( "{} : {} ".format( toekn, token.vector[:3]))

```
- We need to realize that similarity is based on the **Cosine Similarity**.
- Interpretation:
  1. 1 means the same direction.
  2. 0 if they're perpendicular.
  3. -1 if they point in opposite direction.
- You can calculate the similarity using the function `.similarity()`.
```python
doc = nlp('cat')
doc.similarity( nlp('can'))
doc.similarity( nlp('dog'))
```
- Cat and Dog are closer than cat and can because they're detecting the meaning as opposed to the spelling.
- You can access the vector of the object using `.vector`.
- Recognizing intent is an example of a classification problem.
- *Fit*, *Test* and *Training* data.
```python
import numpy as np
X_train_shape = (len( sentences_train), nlp.vocab.vector_length ) # build container tuple
X_train = np.zero( X_train_shape ) # zero the tuple

for sentence in sentences_train:             # iterate over the sentences and
  X_train[i, : ] = nlp( sentence ).vector    # collect the vector per term.
```
- **Nearest-Neighbor Classification** is when you use already labeled data to check how similar something is.
- **scikit** has a cosine similarity function built in.
```python
from sklearn.metrics.pairwise import cosine_similarity

test_message = "" # empty for clarity.
test_x = nlp( test_message ).vector

scores = [                                  # build an array
  cosine_similarity(X[i, :], text_x)        # that tests for similarity.
  for i in range( len( sentences_train))
]
labels_ training[ np.argmax( scores )]   # get max Similarity
```
- **Support Vector Machines** are tried and tested classifiers.
- To gain access to it you'd `from sklearn.SVM import SVC`.
```python
clf = SVC()
clf.fit( X_train, y_train)
y_pred = clf.predict( X_test )
```
- *spaCy* NER built in.
- These are stored in `doc.ents`.
- And, these are further broken down into `ent.text` and `ent.label_`.
- *Entities* can also have different **Roles** such as Destination and Source of flights.
- We'll be using **NLU Rasa** which was written by Alan himself.
- It comes with much of the scaffolding of other tools.
- Data is expected to be in JSON.
```python
from rasa.nlu_converters import load_data
training_data = load_data('<file_path>')


# display data
import json
print( json.dumps( data.training_examples[22], indent = 2))
```

- You will pass messages to `interpreter.parse(<message>)` and it will return the *intent* and *entities*.
- Options will passed to the configuration function as a dictionary of options.
```python
from rasa_nlu.config import RasaNLUConfig
from rasa_nlu.model import Trainer

# generate config object
config = RasaNLUConfig(cmdline_args = {'pipeline': 'spacy_sklearn'})

# create trainer
trainer = Trainer( config )
interpreter = trainer.train( training_data )
```
- A **Rasa Pipeline** is what will be used to process text.
- When passing commands to config, you can use a predefined one or pass a list of components that you want initialized.
- Typos can really mess up the interpreter.


# Building a Virtual Assistant
- Please no more on SQL.
- We'll be using package SQLite3 for our SQL needs.
```python
import sqlite3
conn = sqlite3.connect( '<filename>.db')  # create connection to database.
c = conn.cursor()                         # generate cursor.
c.execute( " <sql statement>")            # SQL Query
c.fetchall()                              # List of results
```
- Be wary of allowing any code to be insterted into queries; this is how SQL injection works.
- The correct format is `c.execute( "SELECT * FROM <table> WHERE var1 = ? AND var2 = ?", t)`; t is a tuple of values.
- The process of collecting previous user choices is called **Slot Filling**.
- As a basic version, you can save them in a dictionary.


# Dialogue
- 


# Research:
- Dependency Parsing?


# Reference:
