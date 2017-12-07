# Sentiment Analysis in R
## Ted Kwartler
## Richie Cotton
## Sumedh Panchadhar

# Fast & dirty: Polarity Scoring
- **Sentiment Analysis** is the process of extracting the the emotional intent of the author.
- The function `qdap::polarity()` will tell you how positive or negative the text is.
- You can check the polarity of a dataframe by passing the name of the column to `polarity()`.
- It also accepts a second argument to condition on.
- Ex: `(datacamp_conversation <- text_df %$% polarity(text, person))`
- Wrapping an assignment call in parenthesis will both assign and print the results to stdout.
- You can use `VectorSource()` to convert characters into a source.
- You can then pass that to `VCorpus()` to turn that into a corpus.
- You can look at the text in the corpus by passing it to `content()`.
- The **Document Term Matrix** is the base of much analytical methods.
- You generate this using `DocumentTermMatrix()`.
- The **Subjectivity Lexicon** is a predefined list of words associated with emotional context such as positive/negative, or specific emotions like "frustration" or "joy".
- There are different lexicon libraries found in the library *lexicon*.
- Here are some of them:
  1. `dodds_sentiment`: Mechanical Turk Sentiment Words
  2. `hash_emoticons`: Translations of basic punctuation emoticons.
  3. `hash_sentiment_huliu`: Univesity of Illinois Polarity Words Research.
  4. `has_sentiment_jockers`: Lexicon inherited from `library( syuzhet )`.
- You can create a **Metrics Javascript Plot** using `metricsgraphics::mjs_plot()`.
- Ex: `mjs_plot( <data>, x = <x.col>, y = <y.col>, show_rollover_text = FALSE)`.
- **Valence Shifters** are words that adjust the polarity of the words.
- A **Context Cluster** is 4 words before and two words after the word being analyzed.
- Glossary of terms:
  * *Polarized Term* Words associated with positive/negative.
  * *Nuetral Term* no emotional context.
  * *Negator* words that invert the polarized meaning.
  * *Valence Shifters* words that effect the emotional context.
  * *Aplifiers* Words that increase emotional intent.
  * *De-Aplifiers* words that decrease emotional intent.
- The `%$%`operator exposes the columns to the function on the right.
- You will need to adjust the lexicon library being used per your case.
- `negation.words` is the predefined data in qdap for negation.
- `amplification.words` is the predefined data in qdap for amplification terms.
- `deamplification.words` is the predefined data in qdap for deamplification terms.
- You can create a new lexicon using `sentiment_frame(<positive_words>, <negative_words>)`.
- Then, you can pass that as a parameter to `polarity()` as `polarity.frame = <frame>`.
- ex:
```r
polarity( text.var = text$words,
  grouping.var = text$speaker,
  polarity.frame = key.pol,
  negators = negation.words,
  amplifiers = amplification.words,
  deamplifiers = deamplification.words)
```

# Sentiment Analysis the Tidytext Way
- In reality, sentiment is more complex than just + or -.
- One popular model is **Plutchik's Wheel of Emotion**.
- To convert a *Document Term Matrix* to tidy format use the function `broom::tidy()`.
- The package *tidytext* contains the subjectivity lexicons from three different libraries contained in `sentiments`.
- You can collect the different sentiment libraries `get_sentiments()` with the options:
  * "afinn"
  * "nrc"
  * "bing"
- To use *bing* requires you to do an **Inner Join**.
- To use the join functions requires the `by` parameter.
- *Moby Dick* is a mostly negative book.
- You can use `%in%` as a substitute for `setdiff()`.

# Visualizing Sentiment
- When doing *Sentiment Analysis*, there is two pieces of advice:
  1. Avoid wordclouds.
  2. Avoid sentiment analysis that leads to no conclusion.
- You can insert the row number as an index using the function `row_number()`.
- A **Kernel Density Plot** can be thought of as a smoothed histogram.
- Comparing multiple distributions can be easier with box plots.
- A **Radar Chart**, sometimes called a **Spider Chart**, can emulate the Plutchik's Wheel.
- For a **Tree Map**, there are multiple arguments.
- You can use `tally()` to count up fields.
- You can use `radarchart::chartJSRadar()`
- Example of *Tree Map*:
```r
# Make the visual
treemap(book_tree,
        index = c("author", "book"),
        vSize = "n",
        vColor = "mean_score",
        type = "value",
        title = "Book Sentiment Scores",
        palette = c("red", "white", "green"))
```


# Case study: Airbnb reviews

# Research:
- `%$%`?
- Subjectivity Lexicon?
- Zipfs Law?

# Reference:
