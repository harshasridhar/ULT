# cmdline arguments are of the form: MSTranslate.py code
import sys
import microsofttranslator

translator=microsofttranslator.Translator("UnivLangTransApp_1", "pbqz/lPGg47fU0GxnkstdPSMTlyoD/KRwYW7wvCp2DQ=")

f=open("speech.txt","r")
text=str(f.read())
f.close()

reload(sys)
sys.setdefaultencoding('utf-8')

code=sys.argv[1]

try:
	s=translator.translate(text.encode('utf-8'),code)
	print s.encode('utf-8')
except microsofttranslator.TranslateApiException:
	print 'Server busy\nTry again later\nInconvenience Regretted\n\n\n'
finally:
	print 'Thank you for using MSTranslator.py\nBye\n'

f=open("transText.txt","w")
f.write(s.encode('utf-8'))
f.close()
