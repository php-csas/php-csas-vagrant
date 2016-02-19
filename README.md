# php-csas-vagrant

Vagrant config for php-csas development environment

## How To Use
- If you don't already have Virtualbox and Vagrant, follow the directions below:
    - Download and install Virtualbox: <https://www.virtualbox.org/wiki/Downloads>
    - Download and install Vagrant: <https://www.vagrantup.com/docs/installation>
- Clone or download a zip of this repository into a directory for working on the PHP CSAS project.
    - To clone: `git clone https://github.com/php-csas/php-csas-vagrant.git`
    - To download:
        - Find the button on the main page of this repo on github to download the .zip file.
        - Once downloaded, unzip the archive and put it into your working directory for PHP CSAS.
- Change directories to the repository:
    - On Unix-based systems, in your terminal change directories with `cd` to the place where you ran `git clone`.
    - On Windows systems:
        - Open up windows command prompt from the start menu by typing `cmd` in the search bar.
        - Change directories to the place where you unzipped the git archive or cloned the repo using `cd`.
- From inside the directory you cloned or unzipped, run `vagrant up` to start the virtual machine.
- Once that finished, run `vagrant ssh` to get into the dev environment.
- When it is up, on your local machine go to localhost:8000/info.php to see our PHP version being used by Apache.

## NOTE:
- If you have already ran this vagrant image, then you need to run `vagrant up` as `vagrant up --provision` to remake the image.
