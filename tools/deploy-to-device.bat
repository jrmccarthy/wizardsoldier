call ../tools/settings.bat
7z u -r -tzip %BUNDLE_NAME% -x@../tools/exclude.txt @../tools/include.txt
adb wait-for-device
adb push %BUNDLE_NAME% /data/local/tmp/%BUNDLE_NAME%
../tools/launch-on-device.bat