@echo off
chcp 65001 >nul
cd /d %~dp0

echo [1/3] 设置远程仓库...
git remote remove origin 2>nul
git remote add origin https://github.com/sleep52/mini-game.git

echo [2/3] 推送 main 分支...
git push -u origin main
if errorlevel 1 (
  echo.
  echo 推送失败。如果是红色的 permission denied / could not read，说明 GitHub 登录过期了，
  echo 再双击运行一次这个脚本，会弹浏览器让你登录。
  goto end
)

echo [3/3] 完成。
echo.
echo 现在去开 Pages（这一步只能你自己在网页上点）：
echo   https://github.com/sleep52/mini-game/settings/pages
echo   Deploy from a branch  /  Branch: main  /  Folder: /(root)  /  Save
echo.
echo 等 1 分钟，游戏地址就是：
echo   https://sleep52.github.io/mini-game/

:end
echo.
pause
