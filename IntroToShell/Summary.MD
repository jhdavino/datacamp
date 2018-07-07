# Introduction to Shell for Data Science
## Greg Wilson

# Manipulating Files and Directories
- **Filesystem** manages the files and folders of a computer system.
- Files and directories are identified by an absolute path.
- `pwd` is to print the working directory.
- `ls` is to list files in the current directory.
- A **relative path** starts from where you are.
- `cd` to change directory.
- **..** means *traverse to the parent of this directory**.
- **~** is to refer to your home.
- `cp` is for copy.
- `mv` is for move.
- `mv` can also be used to rename files.
- `rm` for remove.
- `rmdir` to remove a directory.

# Manipulating Data
- You can print the contents of a file using `cat`.
- You can use `less` to manage input larger than a single console.
- You can open multiple files and then jump to the next one using `:n`.
- You can open multiple files and then jump to the previous one using `:p`.
- You can check the first few rows using `head`.
- **Tab Completion is a thing**
- You can limit the number of lines display with `head` using the flag `-n`.
- You can list recusively using the flag `-R`.
- You can have `ls` designate directories and executables using the flag `-F`.
- You can use `tail` to list the bottom of input.
- You can see the manual for a command using `man`.
- You can use `cut` to select columns from the input.
- You can use the `!` character to repeat a similar command.

# Combining Tools
- You can use `>` to send output to that file.
- You can also use `|` to *pipe* input from one command to another.
- You can pipe more than once.
- `wc` stands for word count.
- Most shell commands will work on multiple files if you give them multiple filenames.

# Batch Processing
- The shell stores variables by default called environmental variables.
- `echo` will display the variable or etc to standard out.
- You can make assignments using `variable=>input>`; make sure there are no spaces.
- You can then dereference the variable using `$`.
- You can also do for loops:
```
for suffix in gif jpg png; do echo $suffix; done
```
- You can also use wildcards in the for loop.

# Creating New Tools
- NANO *REEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE*
- You can save scripts into *.sh* files since they're just text.
- You can run the file using `bash <filename.sh>`.
- `$@` means *run this against all parameters passed to this command*.
- You can stop a running function using `CTRL+C`.

# Research:

# Reference:
