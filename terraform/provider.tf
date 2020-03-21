variable "do_token" {}
variable "db_cluster_count" {
	default = 1
}

provider "digitalocean" {
	token = var.do_token
}
