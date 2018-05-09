#!/bin/bash

### DOWNLOAD ###
wget -O /tmp/torShell.zip https://github.com/SIISCAD/TorShell/archive/master.zip
unzip /tmp/torShell.zip -d /tmp/torShell_masterdir
rm /tmp/torShell.zip

### DELETE PREVIOUS INSTALATIONS ###
rm -r $HOME/.local/share/gnome-shell/extensions/TorShell@siiscad.com.mx

### INSTALL NEW ONE ###

mv /tmp/torShell_masterdir/TorShell-master/TorShell@siiscad.com.mx $HOME/.local/share/gnome-shell/extensions
rm -rf /tmp/torShell_masterdir/

### ACTIVATE THE EXTENSION IN GNOME-SHEL ###

value=$(dconf read /org/gnome/shell/enabled-extensions);

new_value=$(echo ${value//"]"});
new_value=$(echo "$new_value, 'TorShell@siiscad.com.mx']");

dconf write /org/gnome/shell/enabled-extensions "$new_value"
