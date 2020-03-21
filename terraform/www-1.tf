resource "digitalocean_droplet" "www-1" {
	image = "ubuntu-14-04-x64"
	name = "www-1"
	region = "nyc1"
	size = "512mb"
	private_networking = true
	user_data = file("${path.module}/config/www.config")
}
