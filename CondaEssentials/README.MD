# Conda Essentials
## David Mertz

# Installing Packages
- **Conda Packages** are files that contain a bundle of resources.
- Most widely used with Python.
- When you install an Conda package then it downloads all the other stuff it needs.
- The generic format for commands is:`conda COMMAND OPTIONS --SWITCH`
- To get the version, you run `conda -V`.
- You can get help with commands using `--help`.
- This also works with subcommands as well.
- Conda will try and ensure that the versions of packages are all satisfied while downloading requirements.
- It will try and use the latest versions and work its way backwards until it can successfully install.
- **Semantic Versioning**: where the package identifier is split into `MAJOR.Minor.patch`.
  - MAJOR version number is increased when significant new functionality is introduced.
  - MINOR version number generally reflect improvements that avoid backward-incompatible API changes.
  - PATCH version number is approriate mostly for bug fixes that preserve the same MAJOR and MINOR revision numbers.
- You can list all the different installed packages using `conda list`.
- You can declare which version you want to install and it supports the full Semantic Version:
  - Example: `conda install foo-lib=14.3.2`
- **Conda** also supports multiple other comparison operations:
  - `>=`
  - `<=`
  - `>`
  - `<`
  - Example `conda install 'bar-lib>=1.3.4,<1.1'`
- Updating the package is done with `conda update <package-name>`.
- Removing the package is done with `conda remove <package-name>`.
- You can search for the versions available for a package using `conda search <package-name>`.
- You can use the `conda info` command to report all sorts of useful information about a package.


# Utilizing Channels
- A **Conda Channel** is an identifier of a path (e.g., as in a web address) from which Conda packages can be obtained.
- Not all packages are vetted by Anaconda.
- You can search for someone's channel using `conda search --channel [-c] <terms>`
- You can use the command line flag `--override-channels` to ignore default channels.
- You can use the command line argument `--platform <linux-64>` to limit the operating system searched.
- The command `anaconda` searches in a different way that allows you to search all channels for a package.
- The channel called *conda-forge* has a special status that acts as a community curation hub channel.


# Working with Environments

# Case Study on Using Environments

# Reference:

# Research:
- cytoolz?
