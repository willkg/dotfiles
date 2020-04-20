============
Ubuntu notes
============

Status
======

* April 20th, 2020: Switch to tilix; remove ``$``
* December 13th, 2019: Updated to Ubuntu 19.10
* February 11th, 2019: Switch pipsi to pipx
* January 17th, 2018: Updated to Ubuntu Aardvark 17.10
* May 25th, 2016: Updated to Xenity 16.04
* April 8th, 2016: Last update with Ubuntu Wily 15.10


Installing Ubuntu
=================

1. Download Desktop image from http://releases.ubuntu.com/19.10/
2. Burn to DVD: https://help.ubuntu.com/community/BurningIsoHowto
   
   or
   
   Install to USB flash drive: https://help.ubuntu.com/community/Installation/FromUSBStick

3. Boot off of DVD or USB flash drive and run the install process

   * Pick defaults through install process.
   * Make sure to enable encrypting the disk.


After installing Ubuntu
=======================

Updates::

  sudo apt update

  sudo apt upgrade

Install things::

  sudo apt install \
      tilix \
      gnome-tweak-tool

Fix things:

1. Open gnome tweak tool

   1. Fix the caps lock to be a ctrl

2. Install dev stuff::

     sudo apt install \
         build-essential \
         docker.io \
         docker-compose \
         git \
         vim

   Install things for pyenv::

     sudo apt install \
         libssl-dev \
         zlib1g-dev \
         libbz2-dev \
         libreadline-dev \
         libsqlite3-dev \
         wget \
         curl \
         llvm \
         libncurses5-dev \
         libncursesw5-dev \
         xz-utils \
         tk-dev \
         libffi-dev \
         liblzma-dev \
         python-openssl 

3. Add user to docker group. Reboot.

4. Install pyenv using their installer. https://github.com/pyenv/pyenv-installer

5. Set global Python::

      pyenv global VERSION

6. Install virtualenvwrapper::

      pip install --user virtualenvwrapper

7. Install pipx::

      pip install --user pipx

      pipx ensurepath

8. Install tools using pipx one tool at a time::

      autopep8
      aws
      bandit
      black
      check-manifest
      crashstats-tools
      docker-compose
      docutils
      flake8
      hashin
      pipdeptree
      piprot
      sphinx
      tox
      twine
      youtube-dl


OpenVPN
=======

openvpn 2.4 removes the ``-tls-remote`` option.


Solution 1: Downgrade to openvpn 2.3
------------------------------------

Had to downgrade to openvpn 2.3. Repository was here:

https://community.openvpn.net/openvpn/wiki/OpenvpnSoftwareRepos


Used this source::

    deb http://build.openvpn.net/debian/openvpn/release/2.3 xenial main


Then installed 2.3.17 ignoring initscripts dependency issue

This created a bunch of problems with my system, though.


Solution 2: Switch some settings
--------------------------------

See:

   https://bugzilla.mozilla.org/show_bug.cgi?id=1329380#c2

And you have to switch to "Verify Name Exactly" in the Advanced TLS pane:

   https://bugzilla.mozilla.org/show_bug.cgi?id=1328583#c15


How to deal with packaging issues
=================================

View all the versions of a package::

    apt-cache madison <packagename>


How to install a specific version of a package::

    apt-get install <package>=<version>


How to ignore package install errors::

    apt-get download <package>=<version>

    dpkg -i --ignore-depends=<badpackage> <filename.deb>
