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

# Building a Virtual Assistant

# Dialogue

# Research:

# Reference:
