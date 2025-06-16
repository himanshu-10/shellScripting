#!/bin/bash

<< Task
	backup  script with 5 days rotation + Email notification

	usages: ./backup.sh <source dir> <backup dir>

Task

#configure mail

EMAIL_TO="himanshusrivastava5390@gmail.com"

#check for arguments

function display_usage {

	echo "! Usage : ./backup.sh <source_dir> <backup_dir>"
	exit 1
}

#validate

if [[ $# -ne 2  ]];then
	display_usage
fi

source_dir=$1
backup_dir=$2
time_stamp=$(date +"%Y%m%d_%H%M%S")

#validate source dir is present or not

if [[ ! -d "$source_dir"  ]];then
	echo "source directory not found : $source_dir" 
	echo "backup failed ." | mail -s "Backup failed at $time_stamp" "$EMAIL_TO"
	exit 2
fi

mkdir -p "$backup_dir"


# function to create backup

function create_backup {
	
	zip -r "${backup_dir}/backup_${time_stamp}.zip" "$source_dir" > /dev/null
	
	#check the output of previous  line 
	# #? store it
	# if it 0 -- true 
	# if it 1 or other than 0 -- false 
	

	if [[ $? -eq 0  ]];then
		echo "backup created successfully : backup_${time_stamp}.zip"
	else
		echo "backup failed for : {time_stamp}"
		exit 3
	fi	

}


# function to perform 5 day backup rotation : store latest 5 days backup only


function perform_rotation {

	backups=($(ls -t "${backup_dir}/backup_"*.zip 2>/dev/null))

	if [[ "${#backups[@]}" -gt 5  ]];then
		echo "Rotation : removing old backups..."
		
		# :5 slicing - include everything after 5
		# @ -- whole array

		backup_to_remove=("${backups[@]:5}")
		for old_backup in "${backup_to_remove[@]}";do
			echo "deleting : $old_backup"
			rm -f "$old_backup"
		done
	fi
}


#function calling

create_backup
perform_rotation














