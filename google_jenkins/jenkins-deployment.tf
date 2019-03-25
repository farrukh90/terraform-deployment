resource "kubernetes_deployment" "jenkins-deployment" {
  metadata {
    name      = "terraform-jenkins"
    namespace = "tools"
  
    labels {
      test = "jenkins"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels {
        test = "jenkins"
      }
    }

    template {
      metadata {
        labels {
          test = "jenkins"
        }
      }
    
    spec {
      container {
          image = "fsadykov/centos_jenkins:0.2"
          name  = "jenkins"

         resources {
            limits {
              cpu    = "2"
              memory = "500Mi"
            }

            requests {
              cpu    = "2"
              memory = "500Mi"    
           }
          }
        }
      }
    }
  }
}