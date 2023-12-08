echo "command ./bp.sh P1 P2"
echo "$1 $2 $3 $4"
source_from=$3
destination_to=$4
rsync_option=-a -e 'ssh -p 2211 -i /home/thanachai/.ssh/key' --append-verify
rsync_exclude_before=--exclude='thumbnail*'
log_success=./sync_success.log

date
time rsync $rsync_option $rsync_exclude_before --include="$1*" --include="$2*" --exclude='*' --info=progress2 --stats --human-readable $source_from $destination_to && echo "Success $1 $2 $3 $4" >> $log_success
date