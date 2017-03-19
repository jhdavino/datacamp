# Working with Rstudio, Part 2

## Introduction to R Packages
- "R Packages" by Hadley Wickham ; can get online for free.
- Steps:
	1. Create package structure


- R Packages are just an agreed upon structure.
- Make Struture by `File > New Project > New Directory > R Package`.
- The UI now contains the 'Build Tab'.
- `Description Page` file contains the meta information about the package.
- In the file, you should replace the information with your name, etc.
- There are other lines you can include - depends, includes, suggests?
- `Namespace` file contains the functions your package will contain.
- This file is auto-generated and updated.

- Create RProject out of existing code using `File > New Project > Existing Directory > R Package`.
- Make sure to add the script files to the package before finalizing.
- To work around sync issue with packages, use `Build Tab > More > Load All`.
- Keyboard shortcut: `CTRL + SHFT + L` (load)
- `CTRL + SHFT + F10` to reload R Session.


## Documentation
- `Roxygen` package?
- `Tools > Project Options > Generate Documentation > Select 'Generate Documentation with Roxygen'`.
- `CTRL + ALT + SHFT + R` to insert Roxygen skeleton for a function.
- First line will become the title of the Doc.
- The second filled in line will become the Description.
- `CTRL + SHFT + /` to 'reflow' a block of text.
- To create the documentation, go to `Build Tab > More > Document`.
- Keyboard shortcut is `CTRL + SHFT + D`.


## Testing Package
- testthat package is the main package used for Testing in R
- Installing package Devtools is a good idea too.
- Calling use_testthat() from package devtools will auto create the directory structure.
- Test scripts go in the test folder
- Create a context using `context( "[function_name")`.
- `test_that( "description of test", { code block with expect statements })`
- Expect function calls start with expect_ and end with what we're testing: `expect_equal( func_call, result )`.
- You can run tests by using `Build Tab > More > Test Package`.
- Keyboard shortcut: `CTRL + SHFT + T`.

- As long as your upload the exact file structure to github, then `install_github()` will work.
- R comes with a built-in command to check for common errors.
- Command is `R CMD check` at a terminal window.
- This command will work inside RStudio.
- Or, use `Build Tab > Check`.
- Or, use `CTRL + SHFT + C`
- The check is optional, but CRAN will block package upload without it.

## Bulding Your Package
- R Packages are saved in a tarball.
- To build package select `Build Tab > Build and Reload`.
- Keyboard shortcut: `CTRL + SHFT + B`.!@

- You can call Dev Mode using `devtools::dev_mode()`.
- Dev mode puts packages in a separate folder structure to keep new changes isolated.
- Source package is just a compressed version of your package.
- Binary Package is optomized for your environment.

- [CheetSheets](www.rstudio.com/resources/cheatsheets)

## Version Control
- I already know about git.
- Git is a linked list.
- Commits contain elements:
	1. commit unique id.
	2. commit user details.
	3. commit changes.
	4. commit message.
	4. commit parent id.

- Initialize a directory to use git: `Tools > Global Options > Git/SVN`.
- Lecture interface is a bit outdated; git appears to be setup by default.
- Pretty much everything past this point is outdated; only exists inside of projects.
- I know how .gitignore works.

- Head just means the most current commit.
- Undo in git is `checkout`
- Open a shell in Rstudio using `Tools > Shell`.
- `Shell` opens up xterm and not xterminal nor bash

## Reporting
- Shiny, RMarkdown, Shiny
- "Literate Programming"
- There is a whole class on RMarkdown...
- rticles package?
- `CTRL + ALT + I` to insert rmarkdown code block
- Compile notebook convnerts current script into a report.
- You can use Latex directly; use extension .tex .


## Shiny
- Wont focus on how to build Shiny Apps 'cause it's complicated.
- There is an option to create a new Shiny App, including setup files.
- Launch app with `CTRL + SHFT + ENTER`.
- Upload Shiny apps to [here](www.shinyapps.io).
- You will need:
```
install.packages("devtools")
devtools::install_github("rstudio/shinyapps")
```
- Only lets you host 5 apps at a time for free.


## Research
- Gelphi?
- rticle package

## Further Reading:
["R Packages" by Hadley Wickham](http://r-pkgs.had.co.nz/)
