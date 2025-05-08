output "web_server_public_ip" {
  value = huaweicloud_compute_instance.web_server.access_ip_v4
}
