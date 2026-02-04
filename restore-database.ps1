# Script PowerShell para restaurar la base de datos en el nuevo PC
# Ejecutar después de hacer docker-compose up -d

Write-Host "Esperando que MySQL este listo..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

Write-Host "Restaurando base de datos completa..." -ForegroundColor Blue
Get-Content wordpress-backup-complete.sql | docker exec -i wordpress_db mysql -u root -proot_pass wordpress

Write-Host "Reiniciando WordPress..." -ForegroundColor Yellow
docker-compose restart wordpress

Write-Host "Listo! Tu WordPress deberia estar disponible en http://localhost:8080" -ForegroundColor Green
Write-Host "Si aun ves la instalacion, espera unos segundos y recarga la pagina" -ForegroundColor Cyan