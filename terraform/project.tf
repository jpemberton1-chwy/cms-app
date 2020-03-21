resource "digitalocean_project" "app" {
	name = "app-${var.app_release}"
	description = "App release ${var.app_release}"
	environment = var.app_release == "master" ? "Production" : "Development"
}

resource "digitalocean_project_resources" "app_resources" {
	project = digitalocean_project.app.id

	resources = [
		# digitalocean_database_cluster.db-cluster.id,
		digitalocean_droplet.app.urn,
		digitalocean_loadbalancer.alb.urn,
	]
}
