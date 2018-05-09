#!/bin/bash

### DOWNLOAD ###
wget -O /tmp/torShell.zip https://github.com/SIISCAD/TorShell/archive/master.zip
unzip /tmp/torShell.zip -d /tmp/torShell_masterdir
rm /tmp/torShell.zip
mv /tmp/torShell_masterdir/TorShell-master/TorShell@siiscad.com.mx $HOME/.local/share/gnome-shell/extensions

### ACTIVATE THE EXTENSION IN GNOME-SHEL ###

value=$(dconf read /org/gnome/shell/enabled-extensions);

new_value=$(echo ${value//"]"});
new_value=$(echo "$new_value, 'TorShell@siiscad.com.mx']");

dconf write /org/gnome/shell/enabled-extensions "$new_value"
