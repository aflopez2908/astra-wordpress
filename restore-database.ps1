# Script PowerShell para restaurar la base de datos en el nuevo PC
# Ejecutar después de hacer docker-compose up -d

Write-Host "🔄 Esperando que MySQL esté listo..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

Write-Host "🗄️ Restaurando base de datos..." -ForegroundColor Blue
Get-Content wordpress-backup.sql | docker exec -i wordpress_db mysql -u wp_user -pwp_pass wordpress

Write-Host "🔄 Reiniciando WordPress..." -ForegroundColor Yellow
docker-compose restart wordpress

Write-Host "✅ ¡Listo! Tu WordPress debería estar disponible en http://localhost:8080" -ForegroundColor Green
Write-Host "🌐 Si aún ves la instalación, espera unos segundos y recarga la página" -ForegroundColor Cyan