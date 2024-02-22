
packer {
  required_plugins {
    googlecompute = {
      source  = "github.com/hashicorp/googlecompute"
      version = ">=1"
    }
  }
}

source "googlecompute" "centos_stream_8" {
  project_id           = var.project_id
  source_image_family  = var.source_image_family
  ssh_username         = "centos"
  image_name           = "${var.image_name}-{{timestamp}}"
  image_description    = var.image_description
  zone                 = var.zone
}

build {
  sources = [
    "source.googlecompute.centos_stream_8"
  ]

    provisioner "file" {
    source      = "../csye6225.service"
    destination = "/tmp/csye6225.service"
  }

  provisioner "file" {
    source      = "setup.sh"
    destination = "/tmp/setup.sh"
  }

  provisioner "file" {
    source      = "webapp.zip"
    destination = "/tmp/webapp.zip"
  }

  provisioner "shell" {
    script = "setup.sh"
  }
}