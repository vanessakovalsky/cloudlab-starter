#!/bin/bash
set -e

PROJECT_ID="formationgcp-417109"
ZONE="europe-west1-b"
VM_NAME="cloudlab-vm"

echo "🐳 Construction de l'image Docker..."
docker build -t cloudlab-app ./app

echo "📦 Archivage de l'application..."
docker save cloudlab-app | gzip > cloudlab-app.tar.gz

echo "📤 Transfert de l'image vers la VM..."
gcloud compute scp cloudlab-app.tar.gz ${VM_NAME}:~ --zone=${ZONE}

echo "💾 Chargement de l'image sur la VM..."
gcloud compute ssh ${VM_NAME} --zone=${ZONE} --command "gunzip -c cloudlab-app.tar.gz | sudo docker load"

echo "🚀 Lancement du conteneur sur la VM..."
gcloud compute ssh ${VM_NAME} --zone=${ZONE} --command "sudo docker run -d -p 8080:8080 cloudlab-app"

echo "✅ Application déployée avec succès !"
