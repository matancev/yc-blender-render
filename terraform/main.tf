resource "yandex_vpc_network" "blender_network" {}

resource "yandex_vpc_subnet" "blender_subnet" {
  v4_cidr_blocks = ["10.2.0.0/16"]
  zone       = var.zone
  network_id = yandex_vpc_network.blender_network.id
}

resource "yandex_compute_instance" "blender_render_instance" {
  name        = "blender-render"
  platform_id = "standard-v1"
  zone        = var.zone

  metadata = {
    ssh-keys = "${local.instance_user}:${file(var.ssh_public_key_path)}"
  }

  resources {
    cores  = var.instance_cores
    memory = var.instance_memory_gb
    core_fraction = 100
    gpus = 0
  }

  boot_disk {
    initialize_params {
      # ubuntu-20-04-lts-v20220124
      image_id = "fd89ka9p6idl8htbmhok"
      type = "network-hdd"
      size = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.blender_subnet.id
    nat = true
  }

  # Install required software using remote-exec provisioner.
  connection {
    type = "ssh"
    user = local.instance_user
    host = self.network_interface.0.nat_ip_address
    private_key = file(var.ssh_private_key_path)
  }

  provisioner "remote-exec" {
    script = "${path.module}/scripts/provision.sh"
  }
}

