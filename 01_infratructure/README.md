# ☁️ CloudLab Starter – Infrastructure Terraform (Modules Réseau + VM)

Ce guide décrit comment déployer une infrastructure de base sur GCP avec **Terraform**, 
organisée en **modules** pour garantir un déploiement propre, ordonné et réutilisable.

---

## 🧩 Structure du projet

```
cloudlab-starter/
└── 01_infrastructure/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    ├── modules/
    │   ├── network/
    │   │   ├── main.tf
    │   │   ├── variables.tf
    │   │   └── outputs.tf
    │   └── vm/
    │       ├── main.tf
    │       ├── variables.tf
    │       └── outputs.tf
    └── README.md
```

---

## ⚙️ Étapes d'installation

### 1️⃣ Installer Terraform et GCloud

Suis le guide d’installation de Terraform et GCloud (dans le dossier `docs/installation.md` ou ton guide précédent).  
Assure-toi que :
- Terraform fonctionne (`terraform -version`)
- gcloud est configuré (`gcloud auth login` et `gcloud config set project <ID>`)
- la variable d’environnement est bien exportée :

```bash
export GOOGLE_APPLICATION_CREDENTIALS=~/gcp-terraform-key.json
```

---

## 🚀 Déploiement de l’infrastructure modulaire

### 2️⃣ Initialiser Terraform

```bash
cd 01_infrastructure
terraform init
```

### 3️⃣ Vérifier le plan

```bash
terraform plan
```

### 4️⃣ Appliquer la configuration

```bash
terraform apply
```

Confirme avec `yes`.

---

## 🧱 Détails des modules

### 🧩 Module Réseau (`modules/network`)

Ce module crée :
- un réseau VPC (`cloudlab-vpc`),
- un sous-réseau (`cloudlab-subnet`),
- une règle de pare-feu SSH + HTTP (`cloudlab-allow-ssh-http`).

#### Exemple d’output :
```bash
network_name = "cloudlab-vpc"
subnet_name  = "cloudlab-subnet"
```

---

### 💻 Module VM (`modules/vm`)

Ce module crée une VM Debian avec Docker préinstallé.

Ressources :
- VM nommée `cloudlab-vm`
- Disque persistant 20Go
- Accès SSH autorisé via la règle du réseau

#### Exemple d’output :
```bash
vm_name        = "cloudlab-vm"
vm_external_ip = "34.12.56.78"
```

---

## 🔍 Vérification

### Vérifier depuis Terraform

```bash
terraform output
terraform state list
```

### Vérifier depuis GCloud

```bash
gcloud compute networks list
gcloud compute instances list
```

---

## 🧪 Connexion SSH à la VM

```bash
gcloud compute ssh cloudlab-vm --zone=europe-west1-b
```

Tester Docker :

```bash
sudo docker run hello-world
```

---

## 🧹 Nettoyage

Pour supprimer toute l’infrastructure :

```bash
terraform destroy
```

---

## ✅ Étapes suivantes

Passe au dossier `02_application/` pour :
- builder ton image Docker,
- la déployer sur la VM CloudLab,
- ou préparer la migration vers GKE.

---

© CloudLab Starter – Formation DevOps GCP / Terraform