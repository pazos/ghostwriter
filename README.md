![ghostwriter](http://wereturtle.github.io/ghostwriter/images/logo.png)

About *ghostwriter*
===================

*ghostwriter* is a text editor for Markdown, which is a plain text markup format created by John Gruber. For more information about Markdown, please visit John Gruber’s website at <http://www.daringfireball.net>.  *ghostwriter* provides a relaxing, distraction-free writing environment, whether your masterpiece be that next blog post, your school paper, or your NaNoWriMo novel.  For a tour of its features, please visit the [*ghostwriter* project page](http://wereturtle.github.io/ghostwriter/).

ghostwriter is available for Windows, Linux and MacOS.

Screenshots
===========

You can view screenshots of the application at [*ghostwriter's* project page](http://wereturtle.github.io/ghostwriter).

Installation from binaries
==========================

Windows
-------

On Windows, you can either download the installer or a portable version.

To install via the setup wizard, download `ghostwriter-setup.exe` to a location of your choice, double click on its icon to run, and follow the installation steps.  Note that you must have administrator rights to install in certain folders (like C:\Program Files)

The portable version is a zip file which you can unzip to any location on your computer.  Within the zip file is a simple folder containing the `ghostwriter.exe` file.  Double click on this file to run the program. 


Linux
-----

On linux, you can either download the appImage from [ghostwriter webpage](https://wereturtle.github.io/ghostwriter) or install it from a repo.

- Ubuntu and Linux Mint 

	If you are running Ubuntu or one of its derivatives (Linux Mint, Xubuntu, etc.), simply add the [wereturtle Launchpad PPA](http://launchpad.net/~wereturtle/+archive/ubuntu/ppa) to your system.  Open a terminal, and enter the following:

    ```bash
    sudo add-apt-repository ppa:wereturtle/ppa
    sudo apt-get update
	```
You can now install the ghostwriter package.

	```bash
    sudo add-get install ghostwriter
	```

	Please consult the Launchpad guide, [*Installing software from a PPA*](https://help.launchpad.net/Packaging/PPA/InstallingSoftware), for further details.

- Fedora and openSUSE 

	just need to visit https://software.opensuse.org/package/ghostwriter – The Fedora releases are Community Packages.

MacOS
-----

On MacOS, you can either download the install dmg or the application as a zip file.

install/unzip it somewhere. It runs from everywhere, but you need to install it on /Applications or $HOME/Aplications for registering application mimetypes (and be able to open files from finder/system-wide)

Portable Mode
=============

You can download the Windows Portable version of *ghostwriter*, or make your own on any OS.  Just as with FocusWriter, simply create a folder named `data` in the same folder as the `ghostwriter.exe` or `ghostwriter` executable file (depending on the OS).  The application will now use settings and themes in this folder.  If you need to migrate existing themes you created while running in non-portable mode, simply copy them from the relevant folder below:

- Windows:  C:\\Users\\\<your_user_name\>\\AppData\\Roaming\\ghostwriter\\themes
- Linux:  /home/\<your_user_name\>/.config/ghostwriter/themes
- MacOS:  /Users/\<your_user_name\>/.config/ghostwriter/themes

The `data` subfolder contains the location of your personal dictionaries, themes, and application settings.  The portable version is an excellent alternative for when you do not have administrative rights to install the application.  You can take it anywhere on a thumb drive and run it--at school, a friend's house, etc.


Installation from sources
=========================

If you wish to build from the source code, you will need either Qt 4.8 or Qt 5, available from <http://www.qt.io/> if you are on Windows or MacOS, or in your Linux distribution's repository. This documentation assumes you already have the source code unzipped in a folder.

Windows
-------

Instructions based on MinGW (gcc)
You'll need to download Qt5.6 from [download.qt.io](http://download.qt.io/official_releases/qt/5.6/5.6.3/) (a lower version should work)

Open a DOS terminal window, and enter the following commands:

    > cd <your_ghostwriter_folder_location>
    > qmake
    > mingw32-make

Linux
-----

These instructions are for Debian or Ubuntu distributions.  However, they will be similar for other Linux flavors.

1 - Before proceeding, ensure that you have the following dependencies installed:


```bash
sudo apt-get install qt5-default qtbase5-dev libqt5svg5-dev qtmultimedia5-dev libqt5webkit5-dev libhunspell-dev pkg-config libqt5concurrent5 libqt5printsupport5 libqt5svg5 git
```


2 - Clone ghostwriter repo

```
git clone https://github.com/wereturtle/ghostwriter ghostwriter
```


3 - Build ghostwriter

``` shell
mkdir ghostwriter/build
cd ghostwriter/build
qmake ..
make
make install
```

The last command will install *ghostwriter* on your machine.  If you need to install the application in an alternative location to `/usr/local`, enter the following command in lieu of the second command above, passing in the desired value for `PREFIX`:

    $ qmake PREFIX=<your_install_path_here>

For example, to install under `/opt`, you would enter:

    $ qmake PREFIX=/opt


MacOS
-----

By default Qt needs XCode installed for building applications. You can also follow this guide to build qt applications without XCode installed. This guide will assume that XCode or XCode commandline tools are installed before building the application.

1 - Install [homebrew](http://brew.sh):

``` shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```


2 - Install Qt5.5 from brew.

``` shell
brew install qt@5.5 
```


3 - Clone ghostwriter repo

```
git clone https://github.com/wereturtle/ghostwriter ghostwriter
```


4 - Build ghostwriter

``` shell
mkdir ghostwriter/build
cd ghostwriter/build
qmake ..
make
```

Command Line Usage
==================

For terminal users, *ghostwriter* can be run from the command line.  In your terminal window, simply type the following:

    $ ghostwriter myfile.md

where `myfile.md` is the path to your Markdown text file.

***Note for mac users:*** if you want to run ghostwriter from the command line you'll need to link 	the application executable to your prefered PATH. As an example (tested in a system with brew installed)

```bash
	sudo ln -s /Applications/ghostwriter.app/Contents/MacOS/ghostwriter /usr/local/bin
```        

Themes
======
José Geraldo Gouvêa has generously provided a GitHub theme repository for *ghostwriter* [here](https://github.com/jggouvea/ghostwriter-themes). You may download new themes here, or create your own and put in a pull request to add a new theme to the repository.

Wiki
====
*ghostwriter* has a community wiki [here](https://github.com/wereturtle/ghostwriter/wiki).  You can read up on help topics or contribute your own.

Contribute
==========

Please submit any bugs you find through [GitHub](http://github.com/wereturtle/ghostwriter) with a detailed description on how to replicate the problem.  New translations are also welcome. However, please note that new feature requests are no longer being accepted.  Please read the [contributing guide](https://github.com/wereturtle/ghostwriter/blob/master/CONTRIBUTING.md) for further details on how you can contribute to the project.

Roadmap
========

- *ghostwriter* added into the various Linux distribution repositories (Debian, Fedora, etc.).  **Help wanted!**
- Translation of *ghostwriter* into other languages via *Qt Linguist* or Transifex.  **Help wanted!**

Licensing
=========

	Copyright (C) 2014-2018 wereturtle


contains parts of code from focuswriter.


	Copyright (C) 2009, 2010, 2011, 2012, 2013, 2014 Graeme Gott <graeme@gottcode.org>




The source code for *ghostwriter* is licensed under the [GNU General Public License Version 3](http://www.gnu.org/licenses/gpl.html).  However, various icons and third-party FOSS code have different licenses compatible with GPLv3.  Please read the COPYING files in the respective folders for the different licenses.

For more information you can read about [third party submodules used in ghostwriter](external/README.md)
