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
- A javascipt Object Notation file is just plain text with a special format.
- All JSON files are either objects or arrays.
- Values in an object can be:
	1. a "string"
	2. a number
	3. true
	4. false
	5. null
	6. another object
- You can use `http_type(<object>)` to check the response type.
- You can tell content to output the object's content as text by passing `as = "text"` as a variable.
- You can also have the object converted to a list by passing `as = "parsed"` to `content()`.
- You can also use `jsonlite::fromJSON()`.
- You can force `fromJSON()` to not alter the structure by passing `simplifyVector = FALSE`.
- You can force `fromJSON()` to convert it to a dataframe using `simplifyDataFrame = TRUE`.
- `rlist::list.select()` will extract sub-elements by name from a list.
- `rlist::list.stack()` will convert the list to a dataframe.

- Extensible Markup Language, *XML*, is comprised of markup and content.
- The markup comes in pairs of tags of the format `<tag_name> content </tag_name>`
- You can also use Attributes instead of more tags.
- You can request the data be in XML format by passing `format = "xml"`.
- You can convert to an XML object `xml2::read_xml()`.
- You can see the structure of the object using `xml_structure()`.
- xpath extends the tree metaphor of xml by allowing you to reference nodes using a folder-like reference.
- `xml_find_all()` will return something called a nodeset.
- You can extract the data from the nodes using `xml_text()`.
- `//` describes nodes at any level of the document.
- `@` allows you to extract attributes with that name.
- `xml_attrs()` will extract all attributes.
- `xml_attr()` will extract the requested attribute.
- Nodes are pointers to objects.
- HTML is defined by the content within tags.
- Tags can also contain attributes.
- `rvest` has a few functions:
	* `html_text()` to extract text.
	* `html_attr()` to extract attributes
	* `html_name()` to get tags by name.
- Tables are a structure in both R and html.
- They can be turned into a data.frame using `html_table()`.
- 

# Web scraping with XPATHs
- We'll be using something called Selectors; which can be added to a browser.
- We'lll be using the `rvest` package.
- You pass a url to `read_html()`.
- `read_html()` retuns a xml document.
- To select what you're after, use `html_node(<document>, xpath = <selector>)`


# CSS Web Scraping and Final Case Study
- Cascading Style Sheets are a way to add design to a webpage.
- CSS is applied to classes or ids.
- I know about CSS.
- For scraping with CSS, you'd check for those classes or ids.
- You select classes by preceding the value with `.`.
- You select ids by preceding the value with `#`.
- You can get the name of an object after it is captured using `html_name()`.

# Research:

# Reference:
