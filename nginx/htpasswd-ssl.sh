#!/bin/sh

# https://gist.github.com/samba/789122387e7f7330890b#file-htpasswd-ssl-sh

# Writes an APR1-format password hash to the provided <htpasswd-file> for a provided <username>
# This is useful where an alternative web server (e.g. nginx) supports APR1 but no `htpasswd` is installed.
# The APR1 format provides signifcantly stronger password validation, and is described here: 
#	 http://httpd.apache.org/docs/current/misc/password_encryptions.html

help (){
cat <<EOF
  Usage: $0 <htpasswd-file> <username>

  Prompts for password (twice) via openssl.

EOF
}

[ $# -lt 2 ] && help;
[ $# -eq 2 ] && printf "${2}:`openssl passwd -apr1`\n" >> ${1}
