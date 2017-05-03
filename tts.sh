#!/bin/bash
echo "Hello"
#echo -e "\n\n Enter the text that you want to translate:\c"
#read text
echo 'Do u want the list of languages and the associated codes?'
echo -e '[Enter Y for yes and N for NO]:\c'
read choice
#echo $choice
if [ "$choice" = "Y" -o "$choice" = "y" ]; then
	#echo $choice
	python menu1.py | more
	echo "Press [ENTER] to exit"
	read choice
	echo -e "\n\n\n"
elif [ "$choice" = "N" -o "$choice" = "n" ]; then
	echo -e "\c"
	#read code
else
	echo "Invalid Choice"
fi
#echo $
while [ -z "$code"  ]; do
	echo -e  "Enter the code:\c"
	read code
done
echo -e "\nCODE:$code"
python find1.py $code 	#check if language code's correct else display error message and exit 
if [ "$?" == "1" ]; then
	python mysox.py
	python MSTranslate.py $code
	`espeak -v$code -f  "transText.txt" -s140`
else
	echo "Bye"
fi
rm transText.txt
rm speech.txt
