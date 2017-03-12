# Working with RStudio, Part 1
- "RStudio is awesome and you work for them."
- "Install it and stuff"
- [Download R](https://cran.r-project.org)
- [Download RStudio](https://www.rstudio.com)


## Panes
- There are multiple panes:
	1. Source Pane.
	2. Console Pane.
	3. Environmet Pane.
	4. Etc Pane

- Clear console window using `CTRL+L`.
- History complete using `CTRL + [^]`
- Tab Completion exists too.
- Autocomplete shows up after typing three characters
- Just hit Tab everywhere to get stuff; it does a lot of completion.
- Tools > Global Options > Code > Completion to change stuff.

## Source Pane
- Use it, stupid.
- You can open other types of language files too; syntax highlighting will match extension.
- Type `CTRL + [Enter]` to run a line of code; if highlighted, will run that instead.
- Type `CTRL + SHFT + S` to run whole source file.
- Don't forget command `source()` exists.
- Switch focus between panes use `CTRL + [1/2/3/4]`



- Use `View( data.frame )` to open a spreadsheet of the data.frame where the source pane was.
- `View()` has all sorts of minor ways to explore data.
- Environment tab allows you to check what's been loaded by each package.
- You can also click the arrrow next to a list to inspect the elements of it.
- There is also a save icon to save Environment to .RData file.
- RStudio has a data import feature.
- You can use the Files Pane to navigate around your own compluter instead of at the command line.
- You can cycle and export plots from the Plots Pane in the bottom right.
- You can load and unload packages via the Packages Pane.
- `detach()` will remove a package from the Environmeent.

- I DON'T NEED NO HELP PANE!
- You can open a help pane doc by highling a function and pressing `F1`
- The Viewer Pane handles HTML objects.
- I should probably use RPubs more.
- Note that Rpubs just uses a frame that you can then load the frame instead of the page to download the content.


## Keyboard Shortcuts
- `CTRL + SHFT + M` will insert a pipe operator ( %>% ) into RStudio.
- `ALT + -` will insert an assignment arrow in RStudio.
- `CTRL + SHIFT + C` will cause RStudio to insert/remove comments ahead of the highlighted area.
- Help > Keyboard shortcuts.
- `ALT + SHIFT + K` to open the keyboard shortcuts menu.
- RStudio supports snippets.
- Type the name of the snippet and then tab-complete it.
- Add snippets using Tools > Global Options > Code Pane > Edit Snippets
- EXTRACT FUNCTION IS LEGIT AWESOME; it's refactoring.
- `CTRL + ALT + X` to extract code into a function definition.
- `CTRL + ALT` will create multiple cursors
- RSTUDIO HAS VIM OPTIONS!
- To Enable, go to Tools > Global Options > Code > Enable VIM
- `SHFT + ALT + G` and enter a line number to jump there.
- `CTRL + F` will allow you to find, including with regex, values in the source pane.
- `ALT + o` will collapse all folds - which are the little arrows next to code blocks.
- `ALT + SHFT + o` will re-expand all of them.
- "Run, modify, and fail often."
- `CTRL + SHFT + F10` to restart the R session

## Error Checking
- Clicking left of a line number will add a breakpoint to the code.
- You then just need to `debugSource()` the file and the breapoints will stop execution.
- RStudio will call the debugger when it sees `browser()`.
- `debugonce( function_name)` to run through the debugger once.
- You can mark a function to always be debugged using `debug( function_name )`.
- You can undo the debug application using `undebug( function_name )`.

## Projects
- Projects will save environment, code, variables, and more.
- To Create, go to Project > New Project .
- `CTRL + SHFT + F` can find text among any open files.
- Highlight a funtion and then press `F2` to access the code of the function.

## Packrat
- What is packrat?
- This is similar to what I was trying to work on.
- When creating a new project, click the checkbox to enable it.


## Research
- `rsconnect()`
- `rapply()`
- Packrat


## Further Reading: