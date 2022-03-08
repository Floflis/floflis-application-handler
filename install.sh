#!/bin/sh

echo "Installing floflis-application-handler..."

sudo cp -f floflis-application-handler /usr/bin/floflis-application-handler

#sudo mkdir /usr/lib/floflis-application-handler

echo "Installing shortcut in /usr/share/applications..."
cat > /usr/share/applications/floflis-application-handler.desktop <<EOF
[Desktop Entry]
Type=Application
Name=Floflis Application Handler
Exec=floflis-application-handler %u
Icon=central
StartupNotify=false
MimeType=application-x-apps;application-x-game;
EOF

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
