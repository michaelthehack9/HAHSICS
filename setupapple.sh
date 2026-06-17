#!/bin/sh

# Install needed packages
apk add curl jq

# Ask if you would like to add an api key
echo -n "Would you like to add a new API key? (y or n, default=n): "
read need_api

# If answer is "y", ask for and save the key
if [ "$need_api" == "y" ]; then
  echo -n "Enter your API key: "
  read api_key

  echo "$api_key" > key.txt
  echo "✅ API key saved to ICSkey.txt"
else
  echo "✅ Using existing API key from ICSkey.txt"
fi

# Give run permissions
chmod +x HAHSICS/ICSapple

# Make script a command
mv HAHSICS/ICSapple /usr/local/bin/ICS

# Move key to etc
mv ICSkey.txt /etc/ICSkey.txt

# Change startup text
echo "Welcome to iSH! To open the client please type ICS\n" | tee /etc/motd

# Clear the console to make it look good
clear

# Tell the user it was successful
echo "Successfully installed ICS client!"

# Remove junk
rm -rf HAHSICS
