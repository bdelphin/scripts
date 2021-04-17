#!/bin/bash

listgpg () {
	mapfile -d '' pw_list < <(find -L . -name '*.gpg' -print0)
	pw_list=("${pw_list[@]#./}")
	printf '%s\n' "${pw_list[@]}" | sort -n
}

# get all password files and output as newline-delimited text
list_passwords() {
	cd "$HOME/.password-store" || exit
	mapfile -t pw_list < <(listgpg)
	printf '%s\n' "${pw_list[@]%.gpg}" | sort -n
}


# working !
#list_passwords | rofi -dmenu -theme custom -p "Select password to copy " | xargs pass show | xclip -sel clipboard


password="$(list_passwords | rofi -dmenu -theme custom -p "Select password to copy ")"
username="$(echo $password | awk -F/ '{print $NF}')"

if [ $username = "totp" ]
then
    pass otp $password | xclip -sel clipboard
    notify-send "OTP code copied !"
else
    pass show $password | xclip -sel clipboard
    notify-send "Password $username copied !"
fi

#notify-send "Password copied."
