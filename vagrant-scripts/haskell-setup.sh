#!/bin/sh
# Installs everything you need to get up and running
echo "Updating apt-get"
echo yes | sudo apt-get update

echo "Installing Haskell"
echo yes | sudo apt-get install haskell-platform

echo "Updating Cabal"
cabal update

echo "Installing Hspec"
cabal install hspec
