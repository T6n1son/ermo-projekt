# DevOps Projekt

## Kirjeldus
Selle projekti eesmärk on juurutada Flask veebirakendus kasutades:
- Terraform
- Ansible
- Docker
- Proxmox

## Taristu (Infrastructure)
Projektis on kolm virtuaalmasinat:

- **web-01** → Flask rakendus Dockeris
- **db-01** → PostgreSQL andmebaas
- **monitor-01** → monitoorimise tööriistad

## Kasutatud tehnoloogiad
- Flask (Python veebiraamistik)
- Docker (containerid)
- PostgreSQL (andmebaas)
- Terraform (taristu loomine)
- Ansible (seadistamine)

## Käivitamine

### Terraform (virtuaalmasinate loomine)
```bash
cd terraform
terraform init
terraform apply
``
