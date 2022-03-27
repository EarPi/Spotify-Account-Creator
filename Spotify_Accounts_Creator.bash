#!/bin/bash

red='\033[0;31m'
cyan='\033[0;36m'
yell='\033[1;33m'
white='\033[1;37m'
green='\033[1;92m'

echo ""
echo -e "======================================= \n"
echo -e "      +++ SPOTIFY ACCOUNT CREATOR +++\n"
echo -e "======================================= \n"
echo -e "           CREATED BY @EARPi \n"
echo -e "======================================= \n"

cat <<EOF
EOF

create_account(){

	random=$(echo $RANDOM)
    password="Password${random}"
    prefix_domain="Spotify"
    domain="protonmail.com"
    	
    curl=$(curl -s "https://spclient.wg.spotify.com:443/signup/public/v1/account/" -H 'User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: https://www.spotify.com/id/signup/' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 'X-Requested-With: XMLHttpRequest' -H 'Connection: keep-alive' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' --data "iagree=true&birth_day=10&platform=Android-ARM&creation_point=client_mobile&password=${password}&key=142b583129b2df829de3656f9eb484e6&birth_year=1992&email=${prefix_domain}${random}@${domain}&gender=female&app_version=849800892&birth_month=10&password_repeat=${password}")
	
    status=$(echo $curl | jq '.status')
	
    if [[ $status == "1" ]]; then
    	echo -e "${white} [ $(date +%H:%M:%S) ] [ ${green} Success ${white} ] => ${prefix_domain}${random}@${domain}|${password}"
    	echo "[ $(date +%H:%M:%S) ] [ Success ] ${prefix_domain}${random}@${domain}|${password}" >> accounts.txt
	else
    	echo -e "${white} [ $(date +%H:%M:%S) ] [ ${red} Failed ${white} ] => ${prefix_domain}${random}@${domain}|${password}"
        echo -e "Status code: ${status}\n"
        echo $curl
	fi
}

read -p "Nombre de comptes : " number

for (( i = 0; i < $number; i++ )); do
	create_account
done