resource "digitalocean_droplet" "app" {
	image = "ubuntu-14-04-x64"
	name = "app-${var.app_release}"
	region = "nyc1"
	size = "512mb"
	private_networking = true
	user_data = templatefile("${path.module}/config/app.config", {
		tag = var.app_release
	})
}
