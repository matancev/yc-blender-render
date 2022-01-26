variable "folder_id" {
  type = string
}

variable "instance_cores" {
  type = number
  default = 12
}

variable "instance_memory_gb" {
  type = number
  default = 12
}

variable "zone" {
  type = string
  default = "ru-central1-a"
}

variable "ssh_public_key_path" {
  type = string
  default = "~/.ssh/id_rsa.pub"
}

variable "ssh_private_key_path" {
  type = string
  default = "~/.ssh/id_rsa"
}