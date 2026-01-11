@echo off

setlocal enabledelayedexpansion
title Quartus II 9.0 汉化补丁工具

echo ======================================================
echo       Quartus II 9.0 自动汉化工具 (教育交流版)
echo ======================================================
echo.

:: 1. 让用户输入路径
set /p target_dir="请输入或粘贴 Quartus 的 bin 文件夹路径: "

:: 去掉引号
set "target_dir=%target_dir:"=%"

:: 2. 检查文件是否存在
if not exist "%target_dir%\quartus.exe" (
    echo [错误] 在指定路径下找不到 quartus.exe
    pause
    exit /b
)

:: 3. 创建备份文件夹
if not exist "backup" mkdir "backup"

:: 4. 执行备份
echo [1/3] 正在备份原始文件...
copy /y "%target_dir%\quartus.exe" "backup\quartus.exe.bak" >nul
copy /y "%target_dir%\lmtools.exe" "backup\lmtools.exe.bak" >nul
copy /y "%target_dir%\ace_acv.dll" "backup\ace_acv.dll.bak" >nul
copy /y "%target_dir%\ace_ape.dll" "backup\ace_ape.dll.bak" >nul
copy /y "%target_dir%\ace_eco.dll" "backup\ace_eco.dll.bak" >nul
copy /y "%target_dir%\ace_lfp.dll" "backup\ace_lfp.dll.bak" >nul
copy /y "%target_dir%\ace_sprb.dll" "backup\ace_sprb.dll.bak" >nul
copy /y "%target_dir%\aog903as.dll" "backup\aog903as.dll.bak" >nul
copy /y "%target_dir%\aot803as.dll" "backup\aot803as.dll.bak" >nul
copy /y "%target_dir%\asfl203as.dll" "backup\asfl203as.dll.bak" >nul
copy /y "%target_dir%\axerces-c_2_6.dll" "backup\axerces-c_2_6.dll.bak" >nul
copy /y "%target_dir%\edt_ged.dll" "backup\edt_ged.dll.bak" >nul
copy /y "%target_dir%\edt_med.dll" "backup\edt_med.dll.bak" >nul

:: 5. 执行补丁
echo [2/3] 正在应用差异补丁...
"bin\xdelta3.exe" -d -s "%target_dir%\quartus.exe" "diff\quartus.vcdiff" "quartus_patched_tmp.exe"
"bin\xdelta3.exe" -d -s "%target_dir%\lmtools.exe" "diff\lmtools.vcdiff" "lmtools_patched_tmp.exe"
"bin\xdelta3.exe" -d -s "%target_dir%\ace_acv.dll" "diff\ace_acv.vcdiff" "ace_acv_patched_tmp.dll"
"bin\xdelta3.exe" -d -s "%target_dir%\ace_ape.dll" "diff\ace_ape.vcdiff" "ace_ape_patched_tmp.dll"
"bin\xdelta3.exe" -d -s "%target_dir%\ace_eco.dll" "diff\ace_eco.vcdiff" "ace_eco_patched_tmp.dll"
"bin\xdelta3.exe" -d -s "%target_dir%\ace_lfp.dll" "diff\ace_lfp.vcdiff" "ace_lfp_patched_tmp.dll"
"bin\xdelta3.exe" -d -s "%target_dir%\ace_sprb.dll" "diff\ace_sprb.vcdiff" "ace_sprb_patched_tmp.dll"
"bin\xdelta3.exe" -d -s "%target_dir%\aog903as.dll" "diff\aog903as.vcdiff" "aog903as_patched_tmp.dll"
"bin\xdelta3.exe" -d -s "%target_dir%\aot803as.dll" "diff\aot803as.vcdiff" "aot803as_patched_tmp.dll"
"bin\xdelta3.exe" -d -s "%target_dir%\asfl203as.dll" "diff\asfl203as.vcdiff" "asfl203as_patched_tmp.dll"
"bin\xdelta3.exe" -d -s "%target_dir%\axerces-c_2_6.dll" "diff\axerces-c_2_6.vcdiff" "axerces-c_2_6_patched_tmp.dll"
"bin\xdelta3.exe" -d -s "%target_dir%\edt_ged.dll" "diff\edt_ged.vcdiff" "edt_ged_patched_tmp.dll"
"bin\xdelta3.exe" -d -s "%target_dir%\edt_med.dll" "diff\edt_med.vcdiff" "edt_med_patched_tmp.dll"

if %errorlevel% neq 0 (
    echo.
    echo [警告] 补丁应用失败！版本不匹配或文件被占用。
    if exist "quartus_patched_tmp.exe" del "quartus_patched_tmp.exe"
    if exist "lmtools_patched_tmp.exe" del "lmtools_patched_tmp.exe"
    if exist "ace_acv_patched_tmp.dll" del "ace_acv_patched_tmp.dll"
    if exist "ace_ape_patched_tmp.dll" del "ace_ape_patched_tmp.dll"
    if exist "ace_eco_patched_tmp.dll" del "ace_eco_patched_tmp.dll"
    if exist "ace_lfp_patched_tmp.dll" del "ace_lfp_patched_tmp.dll"
    if exist "ace_sprb_patched_tmp.dll" del "ace_sprb_patched_tmp.dll"
    if exist "aog903as_patched_tmp.dll" del "aog903as_patched_tmp.dll"
    if exist "aot803as_patched_tmp.dll" del "aot803as_patched_tmp.dll"
    if exist "asfl203as_patched_tmp.dll" del "asfl203as_patched_tmp.dll"
    if exist "axerces-c_2_6_patched_tmp.dll" del "axerces-c_2_6_patched_tmp.dll"
    if exist "edt_ged_patched_tmp.dll" del "edt_ged_patched_tmp.dll"
    if exist "edt_med_patched_tmp.dll" del "edt_med_patched_tmp.dll"
    pause
    exit /b
)

:: 6. 替换原文件
echo [3/3] 正在替换原程序文件...
move /y "quartus_patched_tmp.exe" "%target_dir%\quartus.exe" >nul
move /y "lmtools_patched_tmp.exe" "%target_dir%\lmtools.exe" >nul
move /y "ace_acv_patched_tmp.dll" "%target_dir%\ace_acv.dll" >nul
move /y "ace_ape_patched_tmp.dll" "%target_dir%\ace_ape.dll" >nul
move /y "ace_eco_patched_tmp.dll" "%target_dir%\ace_eco.dll" >nul
move /y "ace_lfp_patched_tmp.dll" "%target_dir%\ace_lfp.dll" >nul
move /y "ace_sprb_patched_tmp.dll" "%target_dir%\ace_sprb.dll" >nul
move /y "aog903as_patched_tmp.dll" "%target_dir%\aog903as.dll" >nul
move /y "aot803as_patched_tmp.dll" "%target_dir%\aot803as.dll" >nul
move /y "asfl203as_patched_tmp.dll" "%target_dir%\asfl203as.dll" >nul
move /y "axerces-c_2_6_patched_tmp.dll" "%target_dir%\axerces-c_2_6.dll" >nul
move /y "edt_ged_patched_tmp.dll" "%target_dir%\edt_ged.dll" >nul
move /y "edt_med_patched_tmp.dll" "%target_dir%\edt_med.dll" >nul

echo.
echo ======================================================
echo 恭喜！汉化完成。
echo 原始文件已保存在项目目录的 backup 文件夹中。
echo ======================================================
pause