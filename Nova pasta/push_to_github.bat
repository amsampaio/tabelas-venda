@echo off
cd /d "C:\Users\alexandre.sampaio\Documents\Claude\Projects\Tabelas Venda"
echo.
echo === Push para GitHub ===
echo.

if exist ".git" (
    echo A remover .git antigo...
    rmdir /s /q .git
)

echo A inicializar repositorio...
git init
git checkout -b main 2>nul
git remote add origin https://github.com/amsampaio/tabelas-venda.git

echo A fazer commit...
git add .
git commit -m "Add Brother: 31 machine families"

echo A fazer push...
git push -u origin main --force

echo.
echo Concluido! Prima qualquer tecla para fechar.
pause > nul
