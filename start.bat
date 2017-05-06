@echo off
title 内核编译脚本--不白大米

:menu
color f0
cls
echo.++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo.
echo.          1.编译内核
echo.
echo.          2.安装内核
echo.
echo.          3.启动内核
echo.
echo.++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set /p input=请选择功能（1,2,3）:
if %input%==1 goto make
if %input%==2 goto flash
if %input%==3 goto boot
pause
goto menu

:make
bash  fastbuild_kernel.sh NX549J perf
echo 编译结束
pause
goto menu

:flash
prebuilts\tools\adb reboot bootloader
prebuilts\tools\fastboot flash boot out/target/product/NX549/boot.img
prebuilts\tools\fastboot reboot
pause
goto menu

:boot
prebuilts\tools\adb reboot bootloader
prebuilts\tools\fastboot boot out/target/product/NX549/boot.img
pause
goto menu