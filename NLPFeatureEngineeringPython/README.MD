# Feature Engineering for NLP in Python
## Rounak Banik

# Basic Features and Readability Scores
- Going to learn about how to extract features to input into Machine Learning Algorithms.
- They can also work on Categorical Values assuming that they're converted into Numerical form via **One-Hot Enconding**.
- To do this in python, we'll use the pandas function `pd.get_dummies(<df>, columns = ['<name>'])`.
- If you don't include the column, then it will do this to all non-numeric features.
- The first step to the process is to standardize the text.
- This involves potentially converting all words to lower case and reducing words to their base form.
- It may be useful to know things such as the word count, number of characters and the average word length.
- For some applications, you'll want to know what the different Parts of Speech are.
- Another useful piece of information would be the **Named Entity Recognition** to tell the difference between People and Organizations.
- The most basic feature we can extract is the number of characters.
```python
df['numChars'] = df['review'].apply(len)
```
- Another is the number of words - assuming that all words are separated by a space.
- Instructor wants us to create a new function to apply over.
- However, a lambada would be more appropriate here:
```python
df['numWords'] = df['review'].apply( lambda x: len(x.split()))
```
- We can also compute the average word length as well.
- We might also want to include code to extract special parts of text - such as hashtags.
```python
def count_mentions(string):
	# Split the string into words
    words = string.split()

    # Create a list of words that are mentions
    mentions = [word for word in words if word.startswith('@')]

    # Return number of mentions
    return(len(mentions))
```
- Now we're discuss **Readability Tests**.
- At what educational level a person needs to be at to understand the passage?
- This is done with a mathematical formula that takes into account words, syllables and sentence count.
- Some examples of such tests are:
  * The Flesch Reading Ease.
  * Gunning Fog Index.
  * Simple Measure of Gobbledygook
  * Dale-Chall Score
- We'll only touch two of them in this class.
- **Flech Reading Ease** is one of the oldest and most widely used tests.
- Depends on:
  1. Greater the average sentence length; the harder it is to read.
  2. The Greater the number of average syllables; the harder it is to read.
- The higher the score, the greater the readability.
![Flesh Rubric of Readability](images/Flesch-Rubric.png)
- The **Gunning Fog index** was developed in 1954.
- It also uses the average sentence length.
- It uses the percentage of complex words to tell how hard it is to read.
- *Complex* is defined as words with three or more syllables.
- The higher the score, the less readable it is.
![Gunning Fox Index Rubric](images/FOG-Rubric.png)
- These tests are found in the package **textatistic**.
-  You will import class Textatistic from it.
- You then pass the text itself and look at the `.score` attribute of the returned object.
```python
# Import Textatistic
from textatistic import Textatistic

# Compute the readability scores
readability_scores = Textatistic(sisyphus_essay).scores

# Print the flesch reading ease score
flesch = readability_scores['flesch_score']
print("The Flesch Reading Ease is %.2f" % (flesch))
```
```python
# Import Textatistic
from textatistic import Textatistic

# List of excerpts
excerpts = [forbes, harvard_law, r_digest, time_kids]

# Loop through excerpts and compute gunning fog index
gunning_fog_scores = []
for excerpt in excerpts:
  readability_scores = Textatistic(excerpt).scores
  gunning_fog = readability_scores['gunningfog_score']
  gunning_fog_scores.append(gunning_fog)

# Print the gunning fog indices
print(gunning_fog_scores)
```

# Text Preprocessing, POS Tagging and NER

# N-Gram Models.

# TF-IDF and Similarity Scores

# Research:

# Reference:
