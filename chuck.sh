#!/bin/bash

fact=$(curl --silent https://api.chucknorris.io/jokes/random?category=dev | jq | grep value | cut -c 13- | sed 's/"$/ /' | sed 's/\\//g')

notify-send "$fact" -i /home/baptiste/Images/Memes/chuck.jpeg
