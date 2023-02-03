#!/bin/sh

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
flouser=$(logname)

echo "Installing Floflis Packager..."
cd include/Floflis-Packager
if [ ! -e .git ]; then git clone --no-checkout https://github.com/Floflis/Floflis-Packager.git; fi
if [ -e .git ]; then git pull; fi
git checkout -f
sudo sh ./install.sh
cd "$SCRIPTPATH"

echo "Installing floflis-application-handler..."

sudo cp -f floflis-application-handler /usr/bin/floflis-application-handler

#sudo mkdir /usr/lib/floflis-application-handler

echo "Installing shortcut in /usr/share/applications..."
cat > /usr/share/applications/floflis-application-handler.desktop <<EOF
[Desktop Entry]
Type=Application
Name=Floflis Application Handler
Exec=floflis-application-handler %f
Icon=central
StartupNotify=false
MimeType=application-x-apps;application-x-game;
NoDisplay=true
EOF

echo "Turning floflis-application-handler into the default program (to user $flouser) for .apps and .game applications..."
#cat >> $flouser/.config/mimeapps.list <<EOF
cat >> /home/$flouser/.config/mimeapps.list <<EOF
application/x-apps=floflis-application-handler.desktop
application/x-game=floflis-application-handler.desktop
EOF
# this is continuously adding the same entries to mimeapps.list and have to be fixed
#-<- should check if line is already added, before re-adding!

installfail(){
   echo "Installation has failed."
   exit 1
}

if [ -f /usr/bin/floflis-application-handler ];then
   echo "- Turning floflis-application-handler into an executable..."
   sudo chmod +x /usr/bin/floflis-application-handler
   if floflis-application-handler babyisalive; then echo "Done! Running 'floflis-application-handler' command as example to use it:" && (floflis-application-handler &);exit 0; else installfail; fi
   else
      installfail
fi
