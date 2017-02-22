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
- RMarkdown uses Knitr package by Yihui Xie.

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


## Pandoc
- You can fine tune control of the compliation to a document using the YAML header.
- Key, Value pairs.
- Including and `output: ` line will control what format it's rendered too.
- There are Six output types right now:
	1. html_document
	2. pdf_document
	3. word_document
	4. md_document
	5. beamer_presentation
	6. slidy_presention
	7. ioslides_presentation


- `render()` if the function used to render documents via command line.
- Give `render()` the file path to create the file; YAML header used by default.
- You can override this by passing the document type has a second arg to `render()`.
- Can also pass vector of types to create multiple.
- Make sure to use ggplot2 for pdfs since ggvis is an HTML object.
- This functionality depends on the `rmarkdown` Package being installed.
```
---
title: "Demo"
output:
  pdf_document:
    highlight: zenburn
---
```
- Intendation matters.

```
---
title: "Demo"
output:
  html_document:
    theme: spacelab
---
```

- Can also use custom CSS using `css: name.css`

## Etc
- Adding `runtime: shiny` to the header allows one to add shiny apps to the R code.
- Install LaTeX for pdf creation.
- Install Pandoc

## Research

## Further Reading.
[Cheat Sheet for RMarkdown](http://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf)