#!/bin/bash


# creating a user 

read -p "Enter User Name: " userName

echo "creating user with username $userName"

sudo useradd -m $userName

echo "user $userName is successfully created "


