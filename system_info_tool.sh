#/bin/bash


<< Task 
Hostname and current user
Uptime
OS and kernel version
CPU info
Memory usage
Disk usage
IP address

run every mins
store each run's output in seperate log file
keep all logs inside a dedicate log(already created mkdir -p log)
log file name foramt --- systemInfo_yyyymmdd.log

Task

LOG_DIR="/home/ubuntu/shellScripting/logs"
DATE=$(date '+%Y%m%d')
LOG_FILE="$LOG_DIR/systemInfo_$DATE.log"   # file name


{
echo "======================================="
echo "          SYSTEM INFORMATION           "
echo "======================================="

echo "Hostname		: $(hostname)"
echo "Loggin User		: $(whoami)"
echo "Uptime 			: $(uptime | awk '{print $1}')"
echo "kenel version 		: $(uname -r)"
echo "OS Version 		: $(grep VERSION_ID /etc/os-release | cut -d "=" -f2 |tr -d '"')"
echo "Memory Uses 		: $(free -m |awk '/^Mem:/ {print $4 "/" $2}')"
echo "Disk utilization	: $(df -h | awk '/^\/dev\/root/ {print $5}')"
echo "IP Address 		: $(hostname -I | awk '{print $1}')"
echo "======================================="

} >> "$LOG_FILE" 2>&1









