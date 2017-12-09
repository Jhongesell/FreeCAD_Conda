# CONDA-PACKAGES for FreeCAD
The idea behind the usage of conda for FreeCAD is the wish for a consistend package-manager for linux (all distros), windows and mac. Furthermore conda gives FreeCAD the ability to install 3rd-party modules with dependencies easily.

For more information about conda, you can follow this link:
https://conda.io/docs/intro.html

## What is conda?
conda is a cross-plattform package-manager written in python similar to pip. The main advantage over pip is a very simple way to create packages for more difficult libraries which are not written in python and often need some special dependencies to get build. So conda fits in somewhere between system-package-managers like apt and yum and pip. But conda is not only useable for python. There are also a lot of packages for other interpreters available (eg.: R)

## What is anaconda?
anaconda is a distribution of common conda-packages bundled in one installable archive. Installing anaconda is a very simple way to get many of the scintific python-packages. Anaconda is available in version 2 and 3. The version number refers to the python version of the root-environment. But there is always the option to create an environment with python2 /python3 from any of those two. So my suggestion is to always use Anaconda3!

## What is miniconda?
minoconda is similar to anaconda, but only bundles a little subset of packages. Miniconda aims to be a minimalistic installation for the conda-package-manager. With the conda-package-manager you are able to install any package which is provided by Anaconda, and many more.

## What are environments?
An environment has it's own environment-variables and an own directory structure. With environments it's possible to use different dependency-structures which is very useful for development and staying up to date with some of the latest packages while still having stable versions. Maybe the most important advantage of development in environments is the fact that you don't have to make any changes to your system and therefore can ran the latest packages on a very stable (old) system.
Such environments are not a new idea. This is also available through the python-package `virtual-env`.

## What is conda-build?
conda-build is a python-package to create packages for the conda-package-manager. conda-build provides some simple commands to package any kind of programms. Mainly this is done by a `meta.yaml` file where all dependencies and build-commands are specified. For more complex packages there are scripts (`build.sh`, `build.bat`) used to do the installation. Maintainer have to simple build and install some sources in a conda-build-environment and conda-build takes care of creating the package.

## What is conda-forge?
conda-forge is the community channel for conda-packages. It provides a really big set of packages. Many opf the dependencies FreeCAD uses are already provided by conda-forge. One goal of FreeCAD_Conda is to get all the dependencies applied to conda-forge.


# HOW TO INSTALL FreeCAD WITH CONDA
## INSTALL MINICONDA:

### unix
- first get miniconda: http://conda.pydata.org/miniconda.html choose python3 (it's not necessary, you could also choose python2 but you can have a python2 env anyway)
- install miniconda: bash <miniconda-file>.sh (not as root!!!)
- at the end of the install it will ask you if you want to add the anaconda-dir to the $PATH, say yes.
- if you do not want anaconda to be the default python open the ~/.bashrc and edit the new line:
    -from this: __export PATH="path_to_anaconda/bin:$PATH"__
    -to this: __alias initConda='export PATH="path_to_anaconda/bin:$PATH" '__
    this way conda isn't perpended by default. As soon as you call "initConda" python will be the anaconda version.

### windows
- first get miniconda: http://conda.pydata.org/miniconda.html choose python3 (it's not necessary, you could also choose python2 but you can have a python2 env anyway)
- install by double-clicking the downloaded file
- follow the instruction and install for user.

## INSTALL FREECAD

- first we have to add some channels to get all the necesarry packages:
  - you can add them one by one with: `conda config --add channels <name>`
  - or you can open the ~/.condarc and add them directly to this file
at the end this file have to look like this.
__open ~.condarc with a editor and make the channels section look like this__

```
channels:
  - conda-forge
  - defaults
  - freecad
```

 - the channels hosting this libraries:
    - freecad: freecad, coin, pivy, boost, occt, ...
    - conda-forge: pyside, shiboken, ...


### create new environment
#### windows:
- open the anaconda prompt/terminal
- create an env: `conda create -n env-name freecad` # with <env-name> is the name of the env, eg. fc_test
    (this will install all necessary packages needed to run FreeCAD)
- `activate <env-name>`
- start FreeCAD by entering: `FreeCAD`

#### unix
- type in terminal: `initConda` (now the "conda" command should be available)
- create an env: `conda create -n env-name freecad` # with <env-name> is the name of the env, eg. fc_test
    (this will install all necessary packages needed to run FreeCAD)
- at the end of this process a short statement is printed how to activate the new env.: ```source activate <env-name>```
- start FreeCAD by entering: `FreeCAD`


### use specific dependency versions
to create an enviroment with secific versions of packages you can add these packages with versions to the create command. This will give you the oppertunity to reproduce a enviroment. eg.: in case some newer dependencies are broken.

```conda create -n freecad freecad=0.17=py35_0 netgen=6.1=5 ...```


# ADDITIONAL INFORMATION

- list all enviroments:
`conda env list`

- update:  
`conda update --all`  
`conda update conda`
- list added channels:
`conda config --show-sources`
