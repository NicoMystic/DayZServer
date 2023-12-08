@echo off
:start
::Nom De votre serveur
set serverName=Nom du serveur
::Localisation des fichiers du serveur
set serverLocation="D:\Program Files (x86)\Steam\steamapps\common\DayZServer"
::Port du serveur
set serverPort=2302
::Configuration du serveur
set serverConfig=serverDZ.cfg
::Nombre de coeurs à utiliser
set serverCPU=2
::NE PAS TOUCHER
title %serverName% batch
::NE PAS TOUCHER
cd "%serverLocation%"
echo (%time%) %serverName% started.
::Paramètres de lancement (edit end: -config=|-port=|-profiles=|-doLogs|-adminLog|-netLog|-freezeCheck|-filePatching|-BEpath=|-cpuCount=)
start "DayZ Server" /min "DayZServer_x64.exe" -config=%serverConfig% -port=%serverPort% "-profiles=config" "-mod=@CF;@Dabs Framework;@VPPAdminTools;@VanillaPlusPlusMap" -cpuCount=%serverCPU% -dologs -adminlog -netlog -freezecheck
::Temps en seconde avant que la procédure de redémarrage du seveur ne se fasse (14400 = 4 heures)
timeout 14390
taskkill /im DayZServer_x64.exe /F
::Temps en secondes d'attente
timeout 10
::Permet de répéter ce cycle
goto start
