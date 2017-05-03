from subprocess import call
import sys
import speech_recognition as sr

r=sr.Recognizer()
# sensitivity of silence recognition
threshold = '10%'

code=sys.argv[1]

output_filename = 'rec.wav'
cmd = ['rec', '-c', '1', output_filename, 'rate', '8k', 'silence', '1', '0.1', threshold, '1', '3.0', threshold]
call(cmd)
with sr.WavFile("rec.wav")as source:
	audio=r.record(source)
try:
	text=r.recognize_google(audio, language=code)
except sr.UnknownValueError:
	print("Google Speech Recognition could not understand audio")
except sr.RequestError as e:
    print("Could not request results from Google Speech Recognition service; {0}".format(e))
except Exception:
	print("Unknown error!!")
	sys.exit(0)

print(text)
f=open("speech.txt","w")
f.write(text.encode('utf8'))
