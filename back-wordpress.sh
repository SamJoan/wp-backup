#!/bin/bash

set -u
set -e

. credentials.sh
echo $u $p
exit 0

# login
http -f POST "https://$u.wordpress.com/wp-login.php" "log=$u&pwd=$p&wp-submit=Acceder&redirect_to=https%3A%2F%2Fdroope.wordpress.com%2Fwp-admin%2F&testcookie=1"
