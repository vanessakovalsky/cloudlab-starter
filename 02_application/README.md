# 🚀 CloudLab Starter - Application Node.js / Docker

Cette mini-application Node.js fait partie du projet **CloudLab Starter** et te permet de déployer un conteneur Express sur ta VM GCP via Docker.

---

## 📦 Contenu
- App Node.js (Express)
- Dockerfile prêt à l’emploi
- Script `deploy.sh` pour automatiser le déploiement sur la VM

---

## 📂 Structure
```
02_application/
├── app/
│   ├── Dockerfile
│   ├── package.json
│   ├── index.js
│   └── package-lock.json (auto-généré)
├── deploy.sh
└── README.md
```

---

## ⚙️ Déploiement local
```bash
cd app
npm install
npm start
```

Accède ensuite à http://localhost:8080

---

## 🐳 Docker (local)
```bash
docker build -t cloudlab-app ./app
docker run -p 8080:8080 cloudlab-app
```

---

## ☁️ Déploiement sur la VM GCP
```bash
cd ..
./deploy.sh
```

Tu peux ensuite ouvrir ton navigateur sur :  
👉 `http://<EXTERNAL_VM_IP>:8080`

---

## 🧹 Nettoyage
```bash
gcloud compute ssh cloudlab-vm --zone=europe-west1-b --command "sudo docker stop $(sudo docker ps -q)"
```

---

## 🧠 Notes
- L’image Docker est transférée sur la VM via `gcloud compute scp`
- L’application démarre automatiquement sur le port **8080**
- Tu peux modifier le script `deploy.sh` pour utiliser un registre Docker distant (GCR ou Artifact Registry)