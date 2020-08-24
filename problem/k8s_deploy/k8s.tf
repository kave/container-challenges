resource "kubernetes_namespace" "container_challenges" {
  metadata {
    name = "container-challenges"
  }
}

module "one" {
  source     = "./modules/nodeport_service"
  name       = "one"
  namespace  = kubernetes_namespace.container_challenges.metadata[0].name
  label_name = "serviceOne"
  nodePort   = 30001
  image      = "localhost:5000/one:one"
}

module "two" {
  source     = "./modules/nodeport_service"
  name       = "two"
  namespace  = kubernetes_namespace.container_challenges.metadata[0].name
  label_name = "serviceTwo"
  nodePort   = 30002
  image      = "localhost:5000/two:two"
}

module "three" {
  source     = "./modules/nodeport_service"
  name       = "three"
  namespace  = kubernetes_namespace.container_challenges.metadata[0].name
  label_name = "serviceThree"
  nodePort   = 30003
  image      = "localhost:5000/three:three"
}

module "four" {
  source     = "./modules/nodeport_service"
  name       = "four"
  namespace  = kubernetes_namespace.container_challenges.metadata[0].name
  label_name = "serviceFour"
  nodePort   = 30004
  image      = "localhost:5000/four:four"
}

module "five" {
  source     = "./modules/nodeport_service"
  name       = "five"
  namespace  = kubernetes_namespace.container_challenges.metadata[0].name
  label_name = "serviceFive"
  nodePort   = 30005
  image      = "localhost:5000/five:five"
}