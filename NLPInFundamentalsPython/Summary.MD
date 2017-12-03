# Natural Language Processing Fundamentals in Python
## Katharine Jarmul
## Hugo Bowne-Anderson
## Yashas Roy

# Regular Expressions & Word Tokenization
- Massive Field of study focused on making sense of language
- Going over basics NLP:
  1. Topic Identification
  2. Text Classification
- Some topics are:
  * Chatbots
  * Translation
  * Sentiment Analysis
  * + more.
- **Regular Expressions** are strings with special context.
- They allow us to match patterns in other strings.
- You can use them to:
  * Find links in a webpage.
  * Parse email addresses.
  * Remove/Replace unwanted characters.
- Python will be using the library *re*.
- We can match a substring using the `re.match()` function; matches pattern with a string.
- This does **not** return a result, but instead returns a *match object*.
- There are also special patttens that are accepted.
- `\w+` will match a word.
- `\d` will match numbers.
- `\s` will match a space.
- `.*` is a wildcard.
- `+` or `*` cause the match to be *greedy* or match as many characters as it can.
- If you capitalize the letters, then it negates the argument.
- You can also create a group of characters using `[asdlkjflk]`.
- The function `split()` will split a string on the match.
- The function `findall()` will match all patterns.
- The function `search()` will return the index of the match.
- You always pass the pattern first, and then the string.
- Make sure your pattern starts with `r""` first.
- **Tokenization** is when you turn a string document into *tokens*.
- There are many different theories and rules around it.
- A commonley used library for this is *nltk*.
- Tokenizing text can:
  * make it easier to map out parts of speech.
  * Match common words.
  * Remove unwanted tokens.
- The function `sent_tokenize()` will tokenize a document into sentences.
- The function `regexp_tokenize()` will tokenize a string or document based on a regex pattern.
- The function `TweetTokenizer` will allow you to token tweets into separate hashtags, mentions, etc.
- The difference between `match()` and `search()` is that match always starts at the beginning while search doesn't.
- You can print the starting and ending indexes of searches/matches using `x.start()` and `x.end()`.
- The or symbol `|` is very useful.
- You can define a group using `()`.
- The pattern `('(\d+|\w+))'` will match all words and digits but ignore punctuation.
- Groups mean explicitly *only* match what is in between.
- The backslash is called the *escape character*.
- An example to remember is `all_tokens = [tknzr.tokenize(t) for t in tweets]`.
- Unicode looks like : `'\U0001F300-\U0001F5FF'`.
- The library `matplotlib` is used by most everyone for Python.
- It is normal to write the import as `from matplotlib import pyplot as plt`.
- You can pass a small array to the `plt.hist()` function to draw a histogram.
- Then, you use `plt.show()` to have it plot the graph.
- You can substitute characters or patterns using `re.sub()`.

# Simple Topic Identification
- **Bag-of-Words** is a basic method for finding topics in a text.
- First tokenize, then count the tokens.
- We'lll be using `from collections import Counter`.
- The *Counter Object* has a similar structure to a dictionary.
- The object also has a method called `.most_common(<n>)`; n for return that number of results.
- **Text Preprocessing** is to help make better input data.
- Other techniques are:
  * Lemmatization
  * Stemming
  * Removing stop words.
- To handle stop words `from nltk.corpus import stopwords`.
- To use it, you'd use `if t not in stopwords.words('english')`.
- You use `x.isalpha()` will tell you if all characters are from the alphabet.
```python
# Instantiate the WordNetLemmatizer
wordnet_lemmatizer = WordNetLemmatizer()

# Lemmatize all tokens into a new list: lemmatized
lemmatized = [wordnet_lemmatizer.lemmatize(t) for t in no_stops]
```
- We will be using `gensim` to process next.
- The library is open source and can be used by anyone.
- It uses top academic models to perform complex tasks.
- A **Word Vector** is a multidimensional representation of a word.
- **LDA Visualization**; where LDA stands for **Latent Dirichlet Allocation**
- To import and use it, you'd `from gensim.corpora.dictionary import Dictionary`.
- Pass the tokens into the funtion call: `dictionary = Dictionary(tokenized_docs)`.
- You can see a list of tokens and their ids using `dictionary.token2id`.
- Then, you create a **corpus** using `corpus = [dictionary.doc2bow(doc) for doc in tokenized_docs]`.
- And, this model can be easily saved, updated and reused.
- Since it's treated as a dictionary, you can use `computer_id = dictionary.token2id.get("computer")`.
- **Term-Frequency - Inverse Document Frequency** or *tf-idf* which assists us in understanding the most important words.
- The assumpttion in the model is that the corpus might have more shared words than just the stopwords.
- These common words are *down-weighted* due to how common they are.
- You can build a model using the previous corpus.
- First, you will need to import `from gensim.models.tfidfmodel import TfidfModel`.
- Then, pass the corpus into the function: `tfidf = TfidfModel(corpus)`.
- You can calculate the weights using `tfidf_weights = tfidf[ doc ]`.
```python
# Print the top 5 weighted words
for term_id, weight in sorted_tfidf_weights[:5]:
    print(dictionary.get(term_id), weight)
```

# Named-Entity Recognition
- 


# Building a "Fake News" Classifier

# Research:
- `defaultdict()`?
- `itertools.chain.from_iterable()`
- `sorted(total_word_count.items(), key=lambda w: w[1], reverse=True)``

# Reference:
