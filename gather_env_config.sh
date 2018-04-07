#!/usr/bin/env bash

global_configs="/etc/bashrc /etc/profile /etc/global_shell_aliases /etc/bashrc"
local_configs="~/.zshrc ~/.oh-my-zsh ~/.vimrc"
application_configs="~/Projects/config/env.sh ~/Projects/config/PyCharm ~/Projects/config/intellij"
os_label='OS X'
os_type='osx'

targets="${global_configs} ${local_configs} ${application_configs}"
echo "${targets}"

[ -d ${os_type} ] || mkdir -p ${os_type} || { echo "mkdir ${os_type} failed:"; exit 1; } && cd ${os_type}

exec 1>README.md
echo -e "# env-conf-${os_type}\n\n### Environment configuration files for ${os_label}\n\n" 
echo '```'

for t in ${targets}
  do
    target="${t/#\~/$HOME}"
    [ -e ${target} ] || continue
    file_info=$(stat -f "%N: %HT%SY, Modified: %Sm" ${target}) && echo "* ${file_info}" 
    rsync -avqRL "${target}" .    
done

echo '```'

exec 1>/dev/tty
find . -type f -exec egrep -qi 'access|key|api|secret' "{}" \; -exec perl -pi -e 's/.*(?:ACCESS.?KEY|API.?KEY|SECRET.*?KEY).*?=.*/#REDACTED#/gi' "{}" \; -exec grep -H 'REDACTED' "{}" \;

stat_ops=$(cat <<'EOF' 
\n
  amc     Display date in strftime(3) format.\n
  dr      Display actual device name.\n
  gu      Display group or user name.\n
  p       Display the mode of file as in ls -lTd.\n
  N       Displays the name of file.\n
  T       Displays the type of file.\n
  Y       Insert a `` -> '' into the output.\n
EOF
)


