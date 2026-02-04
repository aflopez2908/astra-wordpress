#!/bin/bash

# Script para restaurar la base de datos en el nuevo PC
# Ejecutar después de hacer docker-compose up -d

echo "🔄 Esperando que MySQL esté listo..."
sleep 10

echo "🗄️ Restaurando base de datos completa..."
docker exec -i wordpress_db mysql -u root -proot_pass wordpress < wordpress-backup-complete.sql

echo "🔄 Reiniciando WordPress..."
docker-compose restart wordpress

echo "✅ ¡Listo! Tu WordPress debería estar disponible en http://localhost:8080"
echo "🌐 Si aún ves la instalación, espera unos segundos y recarga la página"