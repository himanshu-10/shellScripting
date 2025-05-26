#!/bin/bash


<< readme

this is the script for taking backup with 5 days rotation

usage: 
./backup.sh <path of the source> <path of the backup folder>
readme

function display_usage {
	echo "usage: ./backup.sh <path to your source> <path to backup folder>"
}

# check if both arguments are pass or not
if [ $# -eq 0 ];then
	display_usage
fi

# function to create backup 
# required 3 arguments : data directory / backup directory / date

source_dir=$1
backup_dir=$2
timestamp=$(date +"%Y%m%d_%H%M%S")
function create_backup {

	zip -r "${backup_dir}/backup_${timestamp}.zip" "${source_dir}" > /dev/null
    
    if [ $? -eq 0 ]; then
        echo "Backup generated successfully for ${timestamp}"
    else
        echo "Backup failed for ${timestamp}"
    fi

}

function perform_rotation {

	#echo "performing rotation"
	backups=($(ls -t "${backup_dir}/backup_"*.zip 2>/dev/null))
	# echo "${backups[@]}"    --> display all the backups 
	

	# if backup is greater than 5days
	if [ "${#backups[@]}" -gt 5 ];then
		echo "performing rotation for 5 days"

		# showing backup before 5 days
		backup_to_remove=("${backups[@]:5}")
		#echo "${backup_to_remove[@]}"

		#delete this backup
		for backup in "${backup_to_remove[@]}";
		do
			rm -f ${backup}
		done
	fi

}


create_backup
perform_rotation




