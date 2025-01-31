@echo off
:start
::Server name
set serverName=Server1
::Server files location
set serverLocation="G:\SteamLibrary\steamapps\common\DayZServer"
::Server Profile folder
set profile=Server1
::Server Port
set serverPort=2302
::Server config
set serverConfig=serverDZ.cfg
::Logical CPU cores to use (Equal or less than available)
set serverCPU=2

::Sets title for terminal (DONT edit)
title %serverName% batch
::DayZServer location (DONT edit)
cd "%serverLocation%"
echo (%time%) %serverName% started.
::Launch parameters
start "DayZ Server" /min "DayZServer_x64.exe" -profiles=%profile% -config=%serverConfig% -port=%serverPort% "-mod=@CF;@ZomBerry Admin Tools" -cpuCount=%serverCPU% -dologs -adminlog -netlog -freezecheck

::Time in seconds before kill server and BEC process (14400 = 4 hours)
timeout 14390
taskkill /im DayZServer_x64.exe /F
::Time in seconds to wait before..
timeout 10
::Go back to the top and repeat the whole cycle again
goto start