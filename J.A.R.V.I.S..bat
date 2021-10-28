@echo off

rem This is for java speaker
set num=%random%
if exist temp%num%.vbs goto num
echo ' > "temp%num%.vbs"
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "temp%num%.vbs

:setname
echo Hello sir, can you tell me your name please, for the records?
set num=%random%
if exist temp%num%.vbs goto num
echo ' > "temp%num%.vbs"
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "temp%num%.vbs
echo speech.speak "Hello sir, can you tell me your name please, for the records?" >> "temp%num%.vbs"
start temp%num%.vbs
set /P name=
goto apresentation

:apresentation
cls
set num=%random%
if exist temp%num%.vbs goto num
echo ' > "temp%num%.vbs"
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "temp%num%.vbs
echo speech.speak "Hello, my name is Jarvis, and I'm here to serve you sir %name%" >> "temp%num%.vbs"
start temp%num%.vbs
rem echo Hello, my name is Jarvis, and im here to serve you sr. %name%
    timeout /t 5 /nobreak >nul
goto start

:start
echo What did %name% want to do?
set /p choice=R.:
if '%choice%' == 'time' goto time
if '%choice%' == 'date' goto date
if '%choice%' == 'write' goto write
if '%choice%' == 'nothing' goto rude
if '%choice%' == 'Nothing, thank you' goto finish

:time
cls
    @echo Time: %time%
    pause >nul
    goto polite

:date
cls
    @echo Date: %date%
    pause >nul
    goto polite

:write
cls
    echo File name that you want to write:
    set /p docname=R.:
    
    type nul > C:\Users\SCHOOL ACCOUNT\OneDrive\Documentos\Jarvis\%docname%.txt
    goto polite


:rude
cls
echo That's rude mr.%name%. Can you please have some education please?
set /p education=
if '%education%' == 'sorry Jarvis :(' goto polite
if '%education%' == 'NO' goto notpolite
if not '%education%' == 'sorry Jarvis :(' goto notpolite

:notpolite
cls
echo Ok, %name%. You will be punished for 5 minutes !
    timeout /t 10  /nobreak > nul
cls
echo Your punishment has finished.
timeout 5 /nobreak > nul
cls
echo You learn your lesson?
set /p response=

if '%response%' == 'YES' goto polite
if '%response%' == 'yes' goto polite
if '%response%' == 'NO' goto notpolite
if '%response%' == 'no' goto notpolite



:polite
    cls
    goto start

:finish
exit