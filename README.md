# DevOps Projekt — Sten

## Kirjeldus
Selle projekti eesmärk on juurutada Flask veebirakendus kasutades Terraformi, Ansiblet ja Dockerit Proxmoxi keskkonnas.

## Taristu
Projektis luuakse kolm virtuaalmasinat Proxmoxis:
- **sten-web-01** → Flask rakendus Dockeris (port 5000)
- **sten-db-01** → PostgreSQL andmebaas
- **sten-monitor-01** → monitoorimise tööriistad

## Eeldused
- Proxmox server töötab ja template `sten-template` on olemas
- Terraform installitud
- Ansible installitud
- SSH ligipääs Proxmoxi serverile

## Kasutusjuhend

### 1. Terraform — virtuaalmasinate loomine
```bash
cd terraform
terraform init
terraform apply
```
Terraform loob kolm VM-i Proxmoxis automaatselt.

### 2. Ansible — rakenduse paigaldamine
```bash
cd ansible
# Muuda inventory.ini failis IP-aadress vastavaks
nano inventory.ini

# Käivita playbook
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory.ini web.yml -u sten --ask-pass --become --ask-become-pass
```
Ansible installib Dockeri ja käivitab rakenduse.

### 3. Rakendus käib!
Ava brauseris:
http://<web-vm-ip>:5000

## Projekti struktuur
ermo-projekt/
├── ansible/
│   ├── inventory.ini    # serverite IP-aadressid
│   └── web.yml          # Ansible playbook
├── studentapp/
│   ├── app.py           # Flask rakendus
│   ├── Dockerfile       # Docker image
│   ├── docker-compose.yml
│   └── requirements.txt
├── terraform/
│   ├── main.tf          # VM-ide definitsioonid
│   └── provider.tf      # Proxmox provider
└── README.md

