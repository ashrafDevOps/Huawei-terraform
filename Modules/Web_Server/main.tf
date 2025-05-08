resource "huaweicloud_vpc" "my_vpc" {
  name = "first-vpc"
  cidr = "192.168.0.0/16"
}

resource "huaweicloud_vpc_subnet" "my_subnet" {
  name        = "my-subnet"
  cidr        = "192.168.1.0/24"
  gateway_ip  = "192.168.1.1"
  vpc_id      = huaweicloud_vpc.my_vpc.id
  dhcp_enable = true
}

resource "huaweicloud_networking_secgroup" "web_sg" {
  name = "my-sg"
}

resource "huaweicloud_networking_secgroup_rule" "allow_http" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = huaweicloud_networking_secgroup.web_sg.id
}

resource "huaweicloud_compute_instance" "web_server" {
  name            = "apache-server"
  flavor_id       = var.flavor_id
  image_id        = var.image_id
  vpc_id          = huaweicloud_vpc.my_vpc.id
  subnet_id       = huaweicloud_vpc_subnet.my_subnet.id
  security_groups = [huaweicloud_networking_secgroup.web_sg.name]
  admin_pass      = var.admin_pass

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install apache2 -y
              echo "Hello from My First Sample Project with DDS!" > /var/www/html/index.html
              systemctl enable apache2
              systemctl start apache2
            EOF
}

resource "huaweicloud_vpc_eip" "apache_eip" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name        = "apache-bandwidth"
    size        = 5
    share_type  = "PER"
    charge_mode = "traffic"
  }
}

resource "huaweicloud_compute_eip_associate" "associate" {
  public_ip   = huaweicloud_vpc_eip.apache_eip.address
  instance_id = huaweicloud_compute_instance.web_server.id
}
