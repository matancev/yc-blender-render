provider "yandex" {
  # Do not forget to specify iam token via YC_TOKEN env variable.
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}