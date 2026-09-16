#!/bin/bash
# PluginSMP installer — installs EVERY plugin in the pack at once.
# Run this in your SERVER folder (the folder with the server jar in it):
#   curl -sL https://cloudyiceocean.github.io/PluginSMP/install.sh | bash

set -e

# ============================================================
#  The plugin list. To add a new plugin later, add one line:
#  "NameOfJar|https://link-to-the-jar"
# ============================================================
PLUGINS=(
  "SMPmoneyplugin|https://cloudyiceocean.github.io/SMPmoneyplugin/SMPmoneyplugin.jar"
  "SMPauctionplugin|https://cloudyiceocean.github.io/SMPauctionplugin/SMPauctionplugin.jar"
  "SMPtitlesplugin|https://cloudyiceocean.github.io/SMPtitlesplugin/SMPtitlesplugin.jar"
)

if [ -d "plugins" ]; then
  DEST="plugins"
elif [ -d "../plugins" ]; then
  DEST="../plugins"
elif ls *.jar >/dev/null 2>&1 || [ -f "server.properties" ]; then
  mkdir -p plugins
  DEST="plugins"
else
  echo "Hmm, I can't find your server here."
  echo "cd into your server folder (the one with the server jar or"
  echo "server.properties in it), then run this command again."
  exit 1
fi

echo "Installing the PluginSMP pack..."
echo ""
for entry in "${PLUGINS[@]}"; do
  name="${entry%%|*}"
  url="${entry##*|}"
  echo "  downloading $name..."
  curl -sL "$url" -o "$DEST/$name.jar"
done

echo ""
echo "  All plugins installed to $DEST/"
echo ""
echo "  Now restart your server and everything is on!"
echo "  Try: /bal, /pay, /baltop, /sell, /worth, /ah"
