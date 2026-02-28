@echo off
chcp 65001 >nul
cd /d "d:\sigweb_ap"

where git >nul 2>&1
if errorlevel 1 (
  echo Git nao encontrado no PATH. Instale em https://git-scm.com/ ou use o Git pelo GitHub Desktop.
  pause
  exit /b 1
)

if not exist .git (
  echo Inicializando repositorio...
  git init
)

git remote remove origin 2>nul
git remote add origin https://github.com/gabrielwebgis/sigweb_ap.git

git add .
git status
echo.
echo Confira os arquivos acima. Deseja fazer commit e push? (S/N)
set /p conf=
if /i not "%conf%"=="S" exit /b 0

git commit -m "WebGIS: index.html, camadas GeoJSON e README para GitHub Pages"
git branch -M main
git push -u origin main

echo.
echo Pronto. Ative o GitHub Pages em Settings - Pages - Deploy from branch main.
pause
