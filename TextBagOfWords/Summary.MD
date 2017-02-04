# Text Mining: Bag of Words
-" The process of distilling actionable insights from text"
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

- `freq_terms()` is obvious
- "Corpus" is a collection of docuements.
- Using package tm  // Text Mining
- `VectorSource()` to convert a vector of text into a corpus
- Pass output to `Vcorpus()` to create a 'volitile corpus'
- You can also convert a data frame to a corpus using `DataframeSource()`
- Some preprocess functions:
	1. `tolower()`
	2. `removePunction()`
	3. `removeNumbers()`
	4. `stripWhiteSpace()`
	5. `removeWords()`

- Changes made to a corpus are applied using `tm_map()`
- This is passed in a functional manor.
- If the function is not from tm package, then wrap in `content_transformer()`
- `stemDocument()` takes a vector and returns the word stem of all words.
- Returned stems will sometimes need to be completed using `stemCompletion( [stems], [dictionary] )`
 
- Package qdap functions:
	1. `bracketX()` removes brackets from text.
	2. `replace_number()` convert numbers to words.
	3. `replace_abbreviation()` convert abbreviations to full versions
	4. `replace_contractions()` convert contractions into full versions
	5. `replace_symbol()` convert symbols to words.

- `stopwords("en")` are a vector of words commonly removed.
- `removeWords( [text_vector], stopwords('en') )` will delete those words from the corpus.
- You can add words to the stop words list.
- Term Document Matrix (TDM) vs Document Term Matrix (DTM)
- Create TDM by using `TermDocumentMatrix( [corpus] )`
- Create DTM by using `DocumentTermMatrix( [corpus] )`
- qdap Package depends on a Word Frequency Matrix (WFM)





## Research
- Package qdap
- What is a volitile corpus?
- Word Frequency Matrix

## Further Reading.
