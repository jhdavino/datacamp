# Text Mining: Bag of Words
- "The process of distilling actionable insights from text"
- Unorganized -> Organized -> Insight.
- Six Steps:
	1. Problem definition
	2. Identify text to collect.
	3. Organize the text.
	4. Feature extraction
	5. Perform Analysis
	6. Conclusion

- Two approaches:
	1. Semantic Parsing
	2. Bag of Words

- `freq_terms()` is obvious.
- "Corpus" is a collection of documents.
- Using package tm.  // Text Mining
- `VectorSource()` to convert a vector of text into a corpus.
- Pass output to `Vcorpus()` to create a 'volitile corpus'.
- You can also convert a data frame to a corpus using `DataframeSource()`.
- Some preprocess functions:
	1. `tolower()`
	2. `removePunction()`
	3. `removeNumbers()`
	4. `stripWhiteSpace()`
	5. `removeWords()`

- Changes made to a corpus are applied using `tm_map()`.
- This is passed in a functional manor.
- If the function is not from tm package, then wrap in `content_transformer()`.
- `stemDocument()` takes a vector and returns the word stem of all words.
- Returned stems will sometimes need to be completed using `stemCompletion( [stems], [dictionary] )`.


## Text Mining Visuals
- Good visuals lead to quick conclusions.
- Due to brain's ability to efficiently process visual information.

```
frequency<-
  freq_terms(
    text,                       // Obv.
    top = 10,                   // Obv.
    at.least = 3,               // Obv.
    stopwords = "Top200Words"   // Predefned set of words to remove
  )
  ```

- Creating a word cloud requires:
  1. Create TDM
  2. Convert to matrix
  3. Rowsum the matrix to create frequency vector
  4. Create a data frame:
  
  ```
  data.frame(
    term = names( term_frequency ),
    num = term_frequency
  )
  ```
  5. `wordcloud( word_freq$term, word_freq$num, max.words = 100, colors = 'red' )`

- If you expect words in the cloud, then delete them else they may mask relationships.
- `colors()` has a over 600 precoded colors to pull from.
- There are tons more colors in package RColorBrewer.
- The package organizes the colors into:
  1. Sequential: light to dark.
  2. Qualitative: Pleasing together.
  3. Diverging: 'two distinct colorspectra'
- `purple_orange<- brewer.pal(10, "PuOr")` will select 10 colors from Purple to Orange.


- Package qdap functions:
	1. `bracketX()` removes brackets from text.
	2. `replace_number()` convert numbers to words.
	3. `replace_abbreviation()` convert abbreviations to full versions
	4. `replace_contractions()` convert contractions into full versions
	5. `replace_symbol()` convert symbols to words.

- `stopwords("en")` are a vector of words commonly removed.
- `removeWords( [text_vector], stopwords('en') )` will delete those words from the corpus.
- You can add words to the stop words list.
- Term Document Matrix (TDM) vs Document Term Matrix (DTM).
- Create TDM by using `TermDocumentMatrix( [corpus] )`.
- Create DTM by using `DocumentTermMatrix( [corpus] )`.
- qdap Package depends on a Word Frequency Matrix (WFM).


- Commonality Cloud is the intersection of terms in two corpus.
- Collapse all text into a single block for each set of terms.
- Place the collapsed terms into a two length vector.
- Convert to Corpus, then convert to a matrix and pass to `commonality.cloud()`.

```
combined_text  <- VectorSource( length_two_vector )
combined_corpus<- VCorpus( combined_text )
combined_clean <- clean_corpus( combined_corpus )  // function built inside class; not in packages.
combined_tdm   <- TermDocumentMatrix( commbined_clea )
combined_m     <- as.matrix( combined_tdm )

commonality.cloud( combined_m, colors = "steelblue1", max.words = 100)
```

- Comparison Cloud does the same thing, but it gives you the difference instead.
- Ensure to to name the columns of teh Term Document Matrix!
- `comparision.cloud( combined_m, colors = c('purple', 'orange'), max.words = 50 )`


- Pyramind plots are ugly, but might be useful:
```
// These names are terrible.
commond_words <- subset( combined_tdm,
                         combined_tdm[, 1] > 0 & combined_tdm[, 2] > 0 )

difference<- abs( commond_words[, 1] - common_words[, 2] )
common_words<- cbind( commond_words, difference)
common_words<- common_words[order( common_words[, 3], decreasing = TRUE)]
top25_df<- data.frame( x = common_words[1:25, 1],
                       y = common_words[1:25, 2],
                       labels = rownames( common_words[1:25, ]))


// The ugly monster itself:
pyramind.plot( top25_df$x                 // left side.
               top25_df$y,                // right side.
               labels = top25_df$labels,  // Obv.
               main = "Words in Common",  // Obv.
               gap = 8,                   // Area between both sides.
               laxly = NULL,              // Not sure.
               top.labels = c('Chardonnay', 'Words', 'Coffee')
            )
```

```
word_associate( vector_of_text,                                 // Obv.
                match.string = c('barista'),                    // ?
                stopwords = c(Top200Words, 'coffee', 'amp'),    // Words to ignore.
                network.plot = TRUE,                            // if false, then no plot
                cloud.colors = c('blue', 'red')                 // Obv.
               )
```

## Simple Word Clustering
- `dist()` creates a pairwise distances between each location.
- `hclust()` 
- `plot( hclut_object )` creates a simple dendogram.
- Package dendextend to improve dendograms.
- dendextend allows one to modify the dendogram as a class.
- `branches_attr_by_labels( [object], [labe_names], [colors])`.
- `rect.dendogram()` comes from the Grid package // see GGGPLOT folders.
- `removeSparseTerms(char_vecctor, sparse = [threshold] )`.
- as sparse -> 0, more terms left in.
- `findAssocs( [TDM], [term], [corlimit] )`.   // from tm; what is corlimit?

- Increasing the tokenization make the size larger.
- Use `NGramTokeenizer( [vector], Weka_control( min = #, max = #))` from RWeka package to create tokens.
- You can control how tokens are made in 'TDM()' using `control = list( tokenize = tokenizer)` passed as an arg.
- You can weight terms in a TDM  via Term frequency-inverse.
- Do this by passing `control = list( weighting = weightTfIdf )`.
- `readTabular()` can associate variables in the corpus with attributes from the data.
```
custom_reader<- readTabular( mapping = list(
                   content = "text", 
                   id ="num",
                   author = "screenName",
                   date = "created")
               ))
```

- Then, you can add `readerControl = list( reader = custom_reader))` to use the declared variables.
- The created corpus acts as a list with nested elements now.

## Research
- Package qdap
- What is a volitile corpus?
- Word Frequency Matrix
- How does dist create the difference matrix?
- What are all functions of readTabular() ?

## Further Reading:
