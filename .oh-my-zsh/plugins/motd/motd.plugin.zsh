#
# This file is part of My Zsh Config
#
# Copyright (c) 2014-2015 Guillaume Kulakowski <guillaume@kulakowski.fr>
# Depend of Oh My Zsh (https://github.com/robbyrussell/oh-my-zsh)
#
# Distributed under the GNU GPL v2. For full terms see the file LICENSE.
#

upinfo ()
{
    echo -ne "\t ";uptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10}'
}

# Pseudo zlogin on each login
clear

echo -e "${fg[red]}Today is:\t\t${fg[cyan]}" $(date)
echo -e "${fg[red]}Uptime is: \t\t${fg[cyan]}" $(upinfo) "${reset_color}\n"

if [ -f "/usr/games/lolcat" ]; then
  /usr/games/lolcat ~/.motd
else
  cat ~/.motd
fi