#/bin/bash

set -euo pipefail

backup_dir="/mnt/c/Users/ayqaz/OneDrive/Documents/Cloudership/BluehostBackups"
timestamp="$(date +%F-%H-%M-%S)"
sshcmd="ssh clouder1@162.241.252.47"

${sshcmd} -- tar -jc public_html \
                 --exclude 'public_html/wp-content/uploads/wpforms/.htaccess.*' \
               > "${backup_dir}/public_html-${timestamp}.tar.bz2"

dbpass="$(${sshcmd} -- sed -E -n -e "\"s/define\('DB_PASSWORD', '(.+)'\);/\1/p\"" public_html/wp-config.php)"

${sshcmd} -- mysqldump -u clouder1_WPDEG \
                       -h localhost \
                       --password="'${dbpass}'" \
                       clouder1_WPDEG \
               > "${backup_dir}/mysql-${timestamp}.tar.bz2"
