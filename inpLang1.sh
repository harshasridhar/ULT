#!/bin/bash
espeak "From which langauage do you want to translate ? "
python mysox.py
code1=`python findl.py`
 
if [ "$?" == "1" ] ; then
	#str="Translating to " + $var
	espeak "Language present and Translating "

else 
	espeak "Langauge Not found or supported"
fi
echo "$code1"

espeak "To which language do you want to translate to? "
python mysox.py
code2=`python findl.py`

if [ "$?" == "1" ] ; then
	espeak "Language present"
else
	espeak "Language not found or supported"
fi
echo "$code2"

python mysox1.py $code1
python MSTranslate.py $code2

espeak -v$code -f  "transText.txt" -s140 2> /dev/null
