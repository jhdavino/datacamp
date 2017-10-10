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
- HTTP Requests:
	1. Conversation between you machine and the server.
	2. What do you want?
	3. "Methods" for different tasks.
- **GET** requests data.
- **POST** pushes data.
- **HEAD** returns meta data.
- **DELETE** remove from remote.
- Others that wont be discussed.
- `response<- GET( url = "<address>")`
- To read the data, use `content( response )`.
- `GET()` comes back with a status code about its success.
- Guideline:
	1. 2xx > Fine.
	2. 3xx > Fine.
	3. 4xx > Your code is wrong.
	4. 5xx > Their code is wrong.
- `http_error()` will check if there is an error code.
- Most Urls don't change.
- You can stitch together urls from the constant and dynamic parts.
- You can pass a list to the `query` parameter of `GET()` to build the query.
- You can send a *User Agent* to help the API identify you.
- You can use `user_agent()` to send those details.
- APIs usually have limits to the number of calls that you're allowed per time period.
- Make sure to intentionally slow down your own requests so that you don't get blocked: **Rate Limiting**
- You can do this using the `Sys.Sleep()` function.

# Handling JSON and XML

# Web scraping with XPATHs

# CSS Web Scraping and Final Case Study

# Research:

# Reference:
