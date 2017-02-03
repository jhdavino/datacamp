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
 




## Research
- Package qdap
- What is a volitile corpus?


## Further Reading.
