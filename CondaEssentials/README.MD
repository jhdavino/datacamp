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
- Conda environments allow multiple incompatible versions of the same (software) package to coexist on your system.
- You are always in an environment - even if its the called base or root.
- You can get a list of existing environments using `conda env list`.
  - It will also show you which is current using an `*`.
- It also supports simple names or globbing.
- You can also query inside an environment using the flag `--name|-n`.
- The act of switching between environments is called **Activating** them.
- You *activate* by using `conda activate <ENVNAME>`.
- There is an older version - pre v4.4 - that had different ways to do this per OS.
- This sucked though and was fixed in v4.4.
- You can leave an environment using `conda deactivate`.
- If you know you don't want an environment around anymore, then you can remove it.
- You do this using `conda env remove --name <ENVNAME>`.
- You can also create your own to configure using `conda create ...`.
- There are lots of configurable flags but the basics would be:
```
conda create --name recent-pd python=3.6 pandas=0.22 scipy statsmodels
```
- You can output the installed packages using `conda env export`.
- You can specify the environment using `--name|-n`.
- You can specify the file using `--file|-f`.
- You can also write your own YAML files:
```
name: shared-project
channels:
  - defaults
dependencies:
  - python=3.6
  - pandas>=0.21
  - scikit-learn
  - statsmodels
```
- To create an environment using a file, use `conda env create --file <file-name.yml>`.


# Case Study on Using Environments
- The function `pd.rolling_mean()` exists.


# Reference:

# Research:
- cytoolz?
