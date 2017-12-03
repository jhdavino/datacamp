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
- 



# Named-Entity Recognition

# Building a "Fake News" Classifier

# Research:

# Reference:
