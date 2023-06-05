#!/bin/bash

GECKO_VERSION=$(curl -s https://api.github.com/repos/mozilla/geckodriver/releases/latest | grep "tag_name" | cut -d '"' -f 4)
GECKO_URL="https://github.com/mozilla/geckodriver/releases/download/$GECKO_VERSION/geckodriver-$GECKO_VERSION-linux64.tar.gz"

curl -L -o geckodriver.tar.gz "$GECKO_URL"
tar -xzf geckodriver.tar.gz

sudo mv geckodriver /usr/bin/geckodriver

sudo chmod +x /usr/bin/geckodriver

rm geckodriver.tar.gz

geckodriver --version
