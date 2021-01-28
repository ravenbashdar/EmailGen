#!/bin/bash

##### Colors Used #####
Red="\e[1;91m"
Green="\e[1;92m"
Yellow="\e[1;93m"
White="\e[1;97m"

##### Banner #####
banner () { clear
echo -e "${Red} this tool created by ${Red} Arez Bashdar Owner System Zone     
${Red}   _     ______ ______  _______                      
${Red}  | |    |    / |             /     
${Red} |   |   |  /   |            / 
${Red}|     |  | /    |____       /
${red} |-----|  |\     |          / 
${red} |     |  | \    |_____    /____                                         
${blue} Slaw barezakam atwani ba dle xot email drust kay \n
         \e[0;96mDeveloped by: ${Red}Arez (System Zome)\n\n"
}

email () {

##### Takaya emailakat bnusa : nmuna SystemZone@gmail.com #####
read -p $'\e[1;97m[\e[1;92m*\e[1;97m]\e[1;92m Lera bnusa : \e[1;97m' email
if [[ $email =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$ ]]; then
read -p $'\e[1;97m[\e[1;92m*\e[1;97m]\e[1;92m Chan Gmail Drust kam  : \e[1;97m' number

##### Extracting name and domain from email #####
name=`echo $email | cut -d "@" -f 1`
domain=`echo $email | cut -d "@" -f 2`
echo -e "$White[${Red}!$White]$Red Drust Abe :${yallow}\e[0;97m"
sleep 1

##### Email drust bun #####
echo "import sys
def generator(name): 
 return [name] + [name[:i]+\".\"+right for i in range(1,len(name)) for right in generator(name[i:]) ]
for result in generator(sys.argv[1]):
 print(result)
" > temp.py
if [ $(($number / 2)) -gt $((2**(${#name} - 1))) ]; then
alias_number="$(( $number - (2**(${#name} - 1)) ))"
else
alias_number="$(($number / 2 ))"
fi
python3 temp.py $name > generated
rm temp.py
if [ $((number%2)) -eq 0 ]; then 
shuf -n $(( number / 2 )) generated > display
else
shuf -n $((( number / 2 ) + 1 )) generated > display
fi
rm generated
awk '$0=$0"@'$domain'"' display	> temp.lst
rm display
shuf -n $alias_number alias > names
awk '$0="'$name'+"$0"@'$domain'"' names  >> temp.lst
rm names
shuf temp.lst > $name.lst
rm temp.lst
cat $name.lst
trap "rm $name.lst &> /dev/null" EXIT

##### Save the generated output #####
read -p $'\n\e[1;97m[\e[1;92m*\e[1;97m]\e[1;92m Atawe Save kay  (y/n) : \e[1;97m' Save_output
if [ "$save_output" = "Y" ] || [ "$save_output" = "y" ]; then

##### Check if output directory exists #####
if [ ! -d "output" ]; then
mkdir output 
fi
cp $name.lst output
echo -e "$White[${Yellow}*$White]$Yellow Output saved at : ${White}output/$name.lst"
echo -e "$White[${Red}!$White]$Red Exiting...\n"; exit
else 
rm $name.lst
echo -e "$White[${Red}!$White]$Red Bo darawa batamay Che...\n"; exit
fi
else
echo -e "$White[${Red}!$White]$Red Invalid email address"
email 
fi
}
banner
email
