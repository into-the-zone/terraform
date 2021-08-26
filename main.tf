provider "google" {
  project     = var.project
  credentials = file(var.credentials_file)
  region      = var.region
  zone        = var.zone
}

resource "google_compute_instance" "my_instance" {
  name                      = var.vm_params.name
  machine_type              = var.vm_params.machine_type
  zone                      = var.vm_params.zone
  allow_stopping_for_update = var.vm_params.allow_stopping_for_update

  boot_disk {
    initialize_params {
      image = var.os_image
    }
  }
  network_interface {
    network    = "default"
    access_config {
      //necessary even empty
    }
  }
}


