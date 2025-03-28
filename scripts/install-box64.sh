#!/bin/bash
# check if .list file already exists
if [ -f /etc/apt/sources.list.d/box64.list ]; then
  rm -f /etc/apt/sources.list.d/box64.list || exit 1
fi

# check if .sources file already exists
if [ -f /etc/apt/sources.list.d/box64.sources ]; then
  rm -f /etc/apt/sources.list.d/box64.sources || exit 1
fi

# download gpg key from specified url
if [ -f /usr/share/keyrings/box64-archive-keyring.gpg ]; then
  rm -f /usr/share/keyrings/box64-archive-keyring.gpg
fi
mkdir -p /usr/share/keyrings
wget -qO- "https://pi-apps-coders.github.io/box64-debs/KEY.gpg" | gpg --dearmor -o /usr/share/keyrings/box64-archive-keyring.gpg

# create .sources file
echo "Types: deb
URIs: https://Pi-Apps-Coders.github.io/box64-debs/debian
Suites: ./
Signed-By: /usr/share/keyrings/box64-archive-keyring.gpg" | tee /etc/apt/sources.list.d/box64.sources >/dev/null
