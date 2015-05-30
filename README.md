# Dirtbag Tanks

This is a copy and extension of the [original dirtbag tanks code](http://dirtbags.net/tanks/).

Currently, main differences/extensions are:

 * Vagrant machine for workable deployment

### Vagrant

Centos 6.5 base box that deploys and builds an instance of Dirtbags:Tanks 
and attempts to serve it with nginx.

To run, use:

    vagrant up

Should be running at `http://tanks.dev:80/`, makes a few html files to play 
with. Look at /var/www/tanks on the machine.

#### Prerequisites

Install `vagrant` and `ansible`, I recommend using VMWare Fusion as your
virtualisation layer but Virtualbox works in a pinch. I advise using `brew`
and `brew cask` for these.

Ensure you're at the latest versions for all things.

#### Hack on stuff

    vagrant provision

Will rerun the ansible stuff.

Hack on stuff in deploy for building the instance.
