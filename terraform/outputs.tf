output "blender_render_ip" {
  value = yandex_compute_instance.blender_render_instance.network_interface.0.nat_ip_address
  description = "Public IP address of blender render machine"
}