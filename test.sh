cat > /usr/share/mime/packages/x-html5.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns='http://www.freedesktop.org/standards/shared-mime-info'>
  <mime-type type="application/x-html5">
    <comment>HTML5 application</comment>
    <generic-icon name="application-x-html5"/>
    <glob pattern="*.html5"/>
  </mime-type>
</mime-info>

EOF
cat > /usr/share/mime/packages/x-apps.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns='http://www.freedesktop.org/standards/shared-mime-info'>
  <mime-type type="application/x-apps">
    <comment>Floflis application</comment>
    <generic-icon name="application-x-apps"/>
    <glob pattern="*.apps"/>
  </mime-type>
</mime-info>

EOF
cat > /usr/share/mime/packages/x-game.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns='http://www.freedesktop.org/standards/shared-mime-info'>
  <mime-type type="application/x-game">
    <comment>Floflis game</comment>
    <generic-icon name="application-x-game"/>
    <glob pattern="*.game"/>
  </mime-type>
</mime-info>

EOF
sudo update-mime-database /usr/share/mime
sudo gtk-update-icon-cache /usr/share/icons/gnome/ -f
