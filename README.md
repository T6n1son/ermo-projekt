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
## Tulemus

Rakendus on kättesaadav:

http://192.168.10.37:5000

## Käivitamine

### Terraform (virtuaalmasinate loomine)
```bash
cd terraform
terraform init
terraform apply
``
