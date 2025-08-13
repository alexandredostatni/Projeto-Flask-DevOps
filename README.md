Projeto Flask-DevOps: Aplicação Monitorada com Automação

Este é um projeto de nível médio que simula a rotina de um Engenheiro DevOps, utilizando uma aplicação Flask containerizada, implantada em Kubernetes (Minikube), provisionada com Terraform, automatizada com GitHub Actions e monitorada com Prometheus e Grafana.

Descrição:

A aplicação Flask exibe "Olá, DevOps!" e inclui métricas para monitoramento. O projeto demonstra automação de build, deploy e monitoramento local, refletindo tarefas típicas de um ambiente DevOps.

Tecnologias Utilizadas:

Docker: Containerização da aplicação.
Kubernetes (Minikube): Gerenciamento de deploy local.
Terraform: Provisionamento de infraestrutura como código.
Python: Desenvolvimento da aplicação Flask.
GitHub Actions: Automação de CI/CD.
Prometheus + Grafana: Monitoramento de métricas.

Estrutura do Projeto:

app.py: Código da aplicação Flask com métricas.
Dockerfile: Configuração do container.
requirements.txt: Dependências Python.
main.tf: Configuração Terraform para Kubernetes.
deployment.yaml e service.yaml: Definições Kubernetes.
.github/workflows/ci-cd.yaml: Pipeline de CI/CD.

Pré-requisitos:

Docker
Minikube
Terraform
Python 3.9+
Helm
Repositório no GitHub com segredos (DOCKER_USERNAME, DOCKER_PASSWORD)

Como Configurar e Executar:

1. Clone o Repositório
(git clone https://github.com/alexandredostatni/flask-devops.git
cd flask-devops)

2. Configure o Ambiente
Inicie o Minikube: (minikube start --driver=docker.)
Instale dependências: (pip install -r requirements.txt.)

3. Build e Carregue a Imagem Docker
(docker build -t flask-devops:latest .
minikube image load flask-devops:latest)

4. Aplique a Configuração Terraform
(terraform init
terraform apply -auto-approve)

5. Implante no Kubernetes
(kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
minikube service flask-service --url)

6. Configure o CI/CD
Adicione segredos no GitHub (Settings > Secrets).
Faça push: git push e verifique os logs no GitHub Actions.

7. Configure o Monitoramento
(helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus prometheus-community/prometheus --set alertmanager.persistentVolume.enabled=false
helm install grafana prometheus-community/grafana --set persistence.enabled=false
minikube service grafana --url)

Resultados Esperados:

Acesse o URL do flask-service para ver "Olá, DevOps!".
Monitore métricas como requests_total no Grafana.

