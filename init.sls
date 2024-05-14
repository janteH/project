# Discord installation
/home/discord.deb:
  file.managed:
    - source: salt://project/discord.deb

apt install -y   /home/discord.deb:
  cmd.run

# Steam installation
/etc/apt/trusted.gpg.d/steam.gpg:
  file.managed:
    - source: salt://project/steam.gpg

/usr/share/keyrings/steam.gpg:
  file.managed:
    - source: salt://project/steam.gpg

/etc/apt/sources.list.d/steam-stable.list:
  file.managed:
    - source: salt://project/steam-stable.list

dpkg --add-architecture i386:
  cmd.run

libgl1-mesa-dri:amd64:
  pkg.installed  

libgl1-mesa-dri:i386:
  pkg.installed:
    - refresh: True

libgl1-mesa-glx:amd64:
  pkg.installed

libgl1-mesa-glx:i386:
  pkg.installed

steam-launcher:
  pkg.installed:
    - refresh: True
