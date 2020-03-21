resource "digitalocean_database_db" "db-web" {
	cluster_id = digitalocean_database_cluster.db-cluster.id
	name = "cms_production"
}

resource "digitalocean_database_firewall" "db-firewall" {
	cluster_id = digitalocean_database_cluster.db-cluster.id

	rule {
		type = "droplet"
		value = digitalocean_droplet.www-1.id
	}
}

resource "digitalocean_database_cluster" "db-cluster" {
	name = "db-cluster"
	engine = "pg"
	version = "11"
	size = "db-s-1vcpu-1gb"
	region = "nyc1"
	node_count = var.db_cluster_count
}
