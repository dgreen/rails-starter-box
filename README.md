# A Virtual Machine for Ruby on Rails Application Development

## Introduction

This project automates the setup of a development environment for general Ruby on Rails application development. 

Inspired by the book ["Deploying Rails"](http://pragprog.com/book/cbdepra/deploying-rails) and fxn's [rails-dev-box](https://github.com/rails/rails-dev-box)

## Requirements

* [VirtualBox](https://www.virtualbox.org)

* [Vagrant](http://vagrantup.com)

## How To Build The Virtual Machine

Building the virtual machine is this easy:

    host $ git clone https://github.com/amaia/rails-starter-box.git
    host $ cd rails-starter-box
    host $ git submodule init
    host $ git submodule update
    host $ vagrant up

If the base box (rails32rsb) is not present that command fetches it first.  See the master branch for the original base.

    host $ vagrant ssh
    Welcome to Ubuntu 12.04 LTS (GNU/Linux 3.2.0-23-generic-pae i686)
    ...
    vagrant@rails-starter-box:~$

A private network is set up with the vm computer placed at 192.168.33.10.

## What's In The Box

* Git

* SQLite3, MySQL, and Postgres

* RVM (with ruby 1.9.3 and 1.8.7 installed)

* Bundler, Rails and Rake gems for both rubies


## Recommended Workflow

The recommended workflow is

* edit files in the host computer

* while git can be run on either side, it is perhaps more convenient to do this on the host computer

* run within the virtual machine


## Virtual Machine Management

When done just log out with and suspend the virtual machine

    host $ vagrant suspend

then, resume to hack again

    host $ vagrant resume

Run

    host $ vagrant halt

to shutdown the virtual machine, and

    host $ vagrant up

to boot it again.

You can find out the state of a virtual machine anytime by invoking

    host $ vagrant status

Finally, to completely wipe the virtual machine from the disk **destroying all its contents**:

    host $ vagrant destroy # DANGER: all is gone

Please check the [Vagrant documentation](http://vagrantup.com/v1/docs/index.html) for more information on Vagrant.
