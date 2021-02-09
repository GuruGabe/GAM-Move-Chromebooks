


gam cros_ous "/" print cros serialNumber annotatedAssetId annotatedLocation status>%temp%\chromebooks.csv

for /f "skip=1 tokens=1-5 delims=," %%a in (%temp%\chromebooks.csv) do call :next "%%b" "%%c" "%%d" "%%e"

exit /b

:next
set serial=
set assetid=
set location=
set status=

set serial=%1
set assetid=%2
set location=%3
set status=%4

set serial=%serial:"=%
set status=%status:"=%
set location=%location:"=%

if /I "%status%" EQU "" exit /b
if /I "%location%" EQU "" exit /b
if /I "%status%" EQU "disabled" exit /b
if /I "%status%" EQU "deprovisioned" exit /b

for /f "tokens=1 delims=," %%a in ('findstr /i /r /c:"%location%.*%assetid%" ou.csv') do set newlocation="%%a"

::Execute
echo The Chromebook with serial number %serial% updating location to %campus% and assetid to %assetid%
"D:\GAMADV-XTD3\gam.exe" cros_sn %serial% update location %newlocation%>>%temp%\result.txt

exit /b
