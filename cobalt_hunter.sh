#!/bin/bash
if [[ $1 = '-h' ]]
then
  echo -e "\033[34musage: enter the ports as the first argument and the IP as the second.\033[m"
else
  nmap --script=grab_beacon_config.nse -p$1 $2 --script-args http.useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0" | grep config | cut -d ':' -f 2-100 | jq .
fi
