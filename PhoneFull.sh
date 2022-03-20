#!/bin/bash

DATE=$(date)
V="\e[0;32m"
negro="\e[1;30m"
azul="\e[1;34m"
verde="\e[1;32m"
cian="\e[1;36m"
rojo="\e[1;31m"
purpura="\e[1;35m"
amarillo="\e[1;33m"
blanco="\e[1;37m"

PhoneHack(){
	clear
	sleep 0.5
echo -e "
██████╗ ██╗  ██╗ ██████╗ ███╗   ██╗███████╗  •  ╔═╗═╗ ╦╔═╗  •  <^GREP^>
██╔══██╗██║  ██║██╔═══██╗████╗  ██║██╔════╝  •  ║╣ ╔╩╦╝║╣   •  <^GREP^>
██████╔╝███████║██║   ██║██╔██╗ ██║█████╗    •  ╚═╝╩ ╚═╚═╝  •  <^GREP^>
██╔═══╝ ██╔══██║██║   ██║██║╚██╗██║██╔══╝    • ╔╗ ╔═╗╔═╗╦ ╦ •  <^GREP^>
██║     ██║  ██║╚██████╔╝██║ ╚████║███████╗  • ╠╩╗╠═╣╚═╗╠═╣ •  <^GREP^>
╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝  • ╚═╝╩ ╩╚═╝╩ ╩ •  <^GREP^>
.:.:.:. ${DATE} .:.:.:." | lolcat -S 99
}
PhoneHackApi(){
	PhoneHack
echo ""
echo -e -n "${verde}* ${negro}Ingresa un nunero con prefijo >${V}>${verde}>" ${verde}
read -r Number
apinumber=$(curl -s "http://apilayer.net/api/validate?access_key=5c8cc90d6e39f2643e01454fb4bb4172&number=${Number}")

local_format=$(echo ${apinumber} | grep -Po '(?<="local_format":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
inter_format=$(echo ${apinumber} | grep -Po '(?<="international_format":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
prefi_format=$(echo ${apinumber} | grep -Po '(?<="country_prefix":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
code_format=$(echo ${apinumber} | grep -Po '(?<="country_code":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
dname_format=$(echo ${apinumber} | grep -Po '(?<="country_name":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
locaf_format=$(echo ${apinumber} | grep -Po '(?<="location":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
carrie_format=$(echo ${apinumber} | grep -Po '(?<="carrier":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
lined_format=$(echo ${apinumber} | grep -Po '(?<="country_prefix":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')

echo ""
echo -e "${negro}>${verde}> ${negro}Numero: ${verde}${Number}"
echo -e "${negro}>${verde}> ${negro}Local format: ${verde}${local_format} "
echo -e "${negro}>${verde}> ${negro}Formato internacional: ${verde}${inter_format}"
echo ""
echo -e "${negro}>${verde}> ${negro}Country prefix: ${verde}${prefi_format}"
echo -e "${negro}>${verde}> ${negro}Country code: ${verde}${code_format}"
echo -e "${negro}>${verde}> ${negro}Country name: ${verde}${dname_format}"
echo -e "${negro}>${verde}> ${negro}Country locstion: ${verde}${locaf_format}"
echo ""
echo -e "${negro}>${verde}> ${negro}Carrier: ${verde}${carrie_format}"
echo -e "${negro}>${verde}> ${negro}Line type: ${verde}${lined_format}"
echo ""
echo -e "${verde}* ${negro}Created by ${negro}>${V}>${verde}> JoséDíaz\n"
echo -e "${verde}* ${negro}Para continuar presione ${negro}>${V}>${verde}> ENTER"
read enter
echo ""
}
PhoneHackApi
