# Working with Web Data in R
## Oliver Keyes
## Charlotte Wickham

# Downloading Files and Using API Clients
- Goals:
	1. Downloading data using special packages.
	2. Using httr to interact with APIs
	3. Working with JSON and XML
	4. Using CSS to extract data.
- Many base R functions can accept urls.
- You can use `download.file()` to copy files to your machine.
- `download.file( <URL>, destfil = "<file_name>")`
- You can save data and retain its stucture using `saveRDS(<object>, <file>)`.
- You can load the data again using `readRDS( <file> )`
- **Application Prgramminng Interfaces**, APIs, are to expose website data for computers to use.
- It's common that R has a package to access an API.
- The *pageviews* package lets you see how many views a wiki page has.
- `pageviews::article_pageviews(project = "<website_name>", "<page_name>")`
- There is an API etiquette for most websites.
- Many APIs have access tokens that are used to identify you.
- We'll be using the *birdnik* package to interact with the Wordnick API.
- `word_frequency(api_key, "<word>")`


# Using httr to Interact With APIs Directly

# Handling JSON and XML

# Web scraping with XPATHs

# CSS Web Scraping and Final Case Study

# Research:

# Reference:
