# Reporting with R Markdown

- R Markdown files are comprised of three parts:
	1. The YAML header.
	2. Narrative Text.
	3. R code chunks.

```
---
title: "Untitled"        // Obv.
author: "Anonymous"      // Obv.
date: "January 1, 2015"  // Obv.
output: html_document    // Obv.
---

- R Markdown contents:
	1. R
	2. Markdown.
	3. Knitr.
	4. Pandocs
	5. Shiny

-`*italics*`
-`**bold**`
-And, code is exactly like the github markup
- Headings and links are done the same way as normal Markdown.
- Lists are the same as in Markdown.
- You can use $$ formula $$ to imbed a block containing the formula
- You can use $ formula $ to imbed inline formulas.
- LaTex is suable inside of the formula notation.
- RMarkdown uses Knitr package by Yihue Xie.

```
R code can be inserted using `r code here`
```

- Insert r code blocks using three backticks, then `{r}`, then close with three more backticks.
- You can use `engine = [language]` to select other programming languages.
- You can tell R to ignore warnings, errors by passing `warnings = FALSE, errors = FALSE` inside the curly braces.
- `echo = FALSE` will not display the code during runtime.
- `eval = FALSE` will not display the output nor run the code during runtime.
- `results = 'hide'` will not display the results of the code durig runtime.
- You can control graph dimensions using `fig.height` and `fig.width`.
- You can label code chunks by passing a variable name.
- You can then refer to that block by using `ref.label = [blockname]` to paste that block again.
- 


## Research

## Further Reading.
