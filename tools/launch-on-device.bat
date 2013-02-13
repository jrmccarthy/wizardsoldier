call ../tools/settings.bat
rem adb shell am start -a android.intent.action.VIEW -n 'com.bullno1.moainao/.MoaiActivityPortrait' -d 'file:///data/local/tmp/%BUNDLE_NAME%'
rem to use landscape, comment the above line and uncomment the line below
adb shell am start -a android.intent.action.VIEW -n 'com.bullno1.moainao/.MoaiActivityLandscape' -d 'file:///data/local/tmp/%BUNDLE_NAME%'