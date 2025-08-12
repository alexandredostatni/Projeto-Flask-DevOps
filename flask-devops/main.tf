provider "kubernetes" {
  config_path = "~/.kube/config"  # Caminho do kubeconfig do Minikube
}

resource "kubernetes_deployment" "flask_app" {
  metadata {
    name = "flask-app"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "flask"
      }
    }
    template {
      metadata {
        labels = {
          app = "flask"
        }
      }
      spec {
        container {
          image = "alexandredostatnidev/flask-devops:latest"
          name  = "flask"
          port {
            container_port = 5000
          }
          port {
            container_port = 8000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "flask_service" {
  metadata {
    name = "flask-service"
  }
  spec {
    selector = {
      app = "flask"
    }
    port {
      port        = 80
      target_port = 5000
    }
    type = "NodePort"
  }
}