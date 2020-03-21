variable "do_token" {}
variable "www_release" {
	default = "master"
}
variable "db_cluster_count" {
	default = 1
}

provider "digitalocean" {
	token = var.do_token
}
