@echo off
color 0A
rem ASCII art banner
echo ====================================
echo             START
echo ====================================
:menu
cls
echo ====================================
echo Select an option:
echo ====================================
echo 1. Start Appium
echo 2. Get current focus
echo 3. Open Android Studio
echo 4. Open Appium Inspector
echo 5. Open Eclipse
echo 6. Open Visual Studio Code
echo 7. Start Appium, Android Studio, and Appium Inspector
echo 8. List available AVDs
echo 9. Start an AVD
echo 10. Open ChatGPT in Google Chrome
echo 11. Open Google Chrome
echo 12. Open Microsoft Edge
echo 13. Search with Google Chrome
echo 14. Search with Microsoft Edge
echo 15. Exit
echo ====================================
set /p choice="Enter your choice: "
if "%choice%"=="1" goto start_appium
if "%choice%"=="2" goto get_current_focus
if "%choice%"=="3" goto open_android_studio
if "%choice%"=="4" goto open_appium_inspector
if "%choice%"=="5" goto open_eclipse
if "%choice%"=="6" goto open_visual_studio_code
if "%choice%"=="7" goto start_all
if "%choice%"=="8" goto list_avds
if "%choice%"=="9" goto start_avd
if "%choice%"=="10" goto open_chatgpt_in_chrome
if "%choice%"=="11" goto open_chrome
if "%choice%"=="12" goto open_edge
if "%choice%"=="13" goto search_with_chrome
if "%choice%"=="14" goto search_with_edge
if "%choice%"=="15" exit /b
echo Invalid choice. Please try again.
pause
goto menu

:start_appium
echo Starting Appium...
start appium
pause
goto menu

:get_current_focus
cd /d %LOCALAPPDATA%\Android\Sdk\platform-tools
if not exist adb.exe (
    echo adb not found in %cd%
    pause
    goto menu
)
for /f "tokens=3 delims= " %%a in ('adb shell dumpsys window ^| findstr /r "mCurrentFocus"') do (
    set result=%%a
)
for /f "tokens=1* delims=/" %%b in ("%result%") do (
    set package_name=%%b
    set activity_with_brace=%%c
)
set activity=%activity_with_brace:~0,-1%
echo Package Name: %package_name%
echo Activity: %activity%
pause
goto menu

:open_android_studio
echo Opening Android Studio...
start "" "C:\Program Files\Android\Android Studio\bin\studio64.exe"
pause
goto menu

:open_appium_inspector
echo Opening Appium Inspector...
start "" "C:\Program Files\Appium Inspector\Appium Inspector.exe"
pause
goto menu

:open_eclipse
echo Opening Eclipse...
start "" "C:\Users\269661\Downloads\eclipse-jee-2023-12-R-win32-x86_64\eclipse\eclipse.exe"
pause
goto menu

:open_visual_studio_code
echo Opening Visual Studio Code...
code .
pause
goto menu

:start_all
echo Starting Appium, Android Studio, and Appium Inspector...
start appium
start "" "C:\Program Files\Android\Android Studio\bin\studio64.exe"
start "" "C:\Program Files\Appium Inspector\Appium Inspector.exe"
pause
goto menu

:exit
exit
pause
goto menu
:open_android_studio
echo Opening Android Studio...
start "" "C:\Program Files\Android\Android Studio\bin\studio64.exe"
pause
goto menu

:open_appium_inspector
echo Opening Appium Inspector...
start "" "C:\Program Files\Appium Inspector\Appium Inspector.exe"
pause
goto menu
:open_eclipse
echo Opening Eclipse...
start "" "C:\Users\269661\Downloads\eclipse-jee-2023-12-R-win32-x86_64\eclipse\eclipse.exe"
pause
goto menu

:open_visual_studio_code
echo Opening Visual Studio Code...
code .
pause
goto menu

:start_all
echo Starting Appium, Android Studio, and Appium Inspector...
start appium
start "" "C:\Program Files\Android\Android Studio\bin\studio64.exe"
start "" "C:\Program Files\Appium Inspector\Appium Inspector.exe"
pause
goto menu

:exit
exit
:list_avds
cd C:\Users\269661\AppData\Local\Android\Sdk\emulator
echo Listing available AVDs:
emulator -list-avds
pause
goto menu

:start_avd
cd C:\Users\269661\AppData\Local\Android\Sdk\emulator
echo Listing available AVDs:
emulator -list-avds
echo.
set /p avd=Enter the name of the AVD to launch:
echo.
echo Launching AVD: %avd%
emulator -avd %avd%
pause
goto menu

:open_chatgpt_in_chrome
start chrome "https://chat.openai.com"
goto menu

:open_chrome
start chrome
goto menu

:open_edge
start msedge
goto menu

:search_with_chrome
set /p query=Enter search query:
start chrome "https://www.google.com/search?q=%query%"
goto menu

:search_with_edge
set /p query=Enter search query:
start msedge "https://www.bing.com/search?q=%query%"
goto menu

::adb -s emulator-5554 emu kill
::adb disconnect emulator-5554
::adb kill-server
::adb disconnect
::adb start-server
::adb devices