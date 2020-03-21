resource "digitalocean_certificate" "cert" {
	name = "alb"
	type = "lets_encrypt"
	domains = ["rocketcms.dev"]
}

resource "digitalocean_record" "app_record" {
	domain = "rocketcms.dev"
	type = "A"
	name = var.app_release == "master" ? "www" : "www-${var.app_release}"
	value = digitalocean_loadbalancer.alb.ip
}

resource "digitalocean_loadbalancer" "alb" {
	name = "alb"
	region = "nyc1"
	algorithm = "least_connections"

	forwarding_rule {
		entry_port = 443
		entry_protocol = "https"

		target_port = 8000
		target_protocol = "http"

		certificate_id = digitalocean_certificate.cert.id
	}

	healthcheck {
		port = 8000
		protocol = "http"
		path = "/health"
	}

	droplet_ids = [digitalocean_droplet.app.id]
}
