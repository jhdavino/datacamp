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
- 


# Simple Topic Identification

# Named-Entity Recognition

# Building a "Fake News" Classifier

# Research:

# Reference:
