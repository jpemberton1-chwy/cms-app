variable "do_token" {}

variable "app_release" {
	default = "master"
}

variable "db_cluster_count" {
	default = 1
}

provider "digitalocean" {
	token = var.do_token
}
