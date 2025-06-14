#!/bin/bash

<<Task


USER MANAGEMENT SCRIPT
FEATURE :
	VALIDATE ROOT USER
        ADD USER
        DELETE USER
        LIST ALL USER



Task


# AUTHOR : HIMANSHU 😉

# check for root access 
# the script is only for root


# Colors
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"


if [[ $EUID -ne 0 ]]; then
	echo -e "${RED}The script must be run as root.${RESET}"
	exit 1
fi


# ADD USER


add_user() {
	
	read -p "Enter username to add : " username
	
	if getent passwd "$username" > /dev/null ;then
		echo -e "user '$username' already exist! "
	else 
		useradd "$username"
		passwd "$username"
		echo -e "user '$username' is successfully created"
	fi


}

#DELETE USER

delete_user() {

	read -p "Enter username to delete : " username

	if getent passwd "$username" > /dev/null;then
		read -p "do you want to delete the home directory ? (Y/N) : " del_home
	        if [[ "$del_home" == "y" && "$del_home" == "Y" ]];then
			userdel -r "$username"
		else
			userdel "$username"
		fi

		echo -e "user '$username' deleted."
	else
		echo -e "user '$username' does not exist!"
	fi

}

#LIST USERS

list_user() {
	echo -e "System Users: "
	getent passwd {1000..60000} | cut -d: -f1,3,6,7 | column -t -s :
}


while true; do
  echo -e "\n${YELLOW}========= User Management Menu =========${RESET}"
  echo "1. Add User"
  echo "2. Delete User"
  echo "3. List Users"
  echo "4. Exit"
  read -p "Enter your choice [1-4]: " choice

  case $choice in
    1) add_user ;;
    2) delete_user ;;
    3) list_user ;;
    4) echo -e "${GREEN}Exiting...${RESET}"; break ;;
    *) echo -e "${RED}Invalid choice, try again.${RESET}" ;;
  esac
done


