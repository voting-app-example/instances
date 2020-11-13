module "staging" {
  source             = "git::https://github.com/voting-app-example/infra//terraform?ref=v0.0.1"
  kubeconfig_name    = "kubeconfig_staging"
  loadbalancer_name  = "loadbalancer-staging"
  cluster_name       = "staging"
  cluster_nodes_name = "staging-node"
  digitalocean_token = var.digitalocean_token
}

module "prod" {
  source             = "git::https://github.com/voting-app-example/infra//terraform?ref=v0.0.1"
  kubeconfig_name    = "kubeconfig_production"
  loadbalancer_name  = "loadbalancer-prod"
  cluster_name       = "prod"
  cluster_nodes_name = "prod-node"
  digitalocean_token = var.digitalocean_token
}

resource "github_actions_secret" "staging_kubernetes_config" {
  repository      = "catalogue-microservice"
  secret_name     = "STAGING_KUBERNETES_KUBECONFIG"
  plaintext_value = module.staging.kubeconfig
}


resource "github_actions_secret" "staging_public_ip" {
  repository      = "catalogue-microservice"
  secret_name     = "STAGING_PUBLIC_IP"
  plaintext_value = module.staging.public_ip
}


resource "github_actions_secret" "produ_kubernetes_config" {
  repository      = "catalogue-microservice"
  secret_name     = "PRODUCTION_KUBERNETES_KUBECONFIG"
  plaintext_value = module.prod.kubeconfig
}


resource "github_actions_secret" "production_public_ip" {
  repository      = "catalogue-microservice"
  secret_name     = "PRODUCTION_PUBLIC_IP"
  plaintext_value = module.prod.public_ip
}
