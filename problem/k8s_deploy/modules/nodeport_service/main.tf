resource "kubernetes_deployment" "deployment" {
  metadata {
    name      = var.name
    namespace = var.namespace
    labels = {
      App = var.label_name
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        App = var.label_name
      }
    }
    template {
      metadata {
        labels = {
          App = var.label_name
        }
      }
      spec {
        container {
          image             = var.image
          image_pull_policy = "IfNotPresent"

          name = var.name

          port {
            container_port = 80
          }

          resources {
            limits {
              cpu    = "0.5"
              memory = "128Mi"
            }
            requests {
              cpu    = "250m" # 0.25 cpu
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "service" {
  metadata {
    name      = var.name
    namespace = var.namespace
    labels = {
      App = var.label_name
    }
  }
  spec {
    selector = {
      App = var.label_name
    }
    port {
      node_port   = var.nodePort
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}