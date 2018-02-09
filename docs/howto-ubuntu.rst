============
Ubuntu notes
============

Status
======

:April 8th, 2016:    Last update with Ubuntu Wily 15.10
:May 25th, 2016:     Updated to Xenity 16.04
:January 17th, 2018: Updated to Ubuntu Aardvark 17.10


After installing Ubuntu
=======================

Updates::

  $ sudo apt update
  $ sudo apt upgrade

Install things::

  $ sudo apt install \
      terminator \
      gnome-tweak-tool \
      openssh-server

Fix things:

1. Open gnome tweak tool

   1. Fix the caps lock to be a ctrl

2. Install dev stuff::

     $ sudo apt install \
         build-essential \
         docker.io \
         docker-compose \
         git \
         emacs \
         vim

3. Install pipsi using their script

   1. Install tools using pipsi

4. Install shutter and the scp plugin: https://github.com/cweiske/shutter-scp

5. Install nodejs and npm: https://github.com/nodesource/distributions#debinstall


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
