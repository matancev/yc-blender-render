provider "yandex" {
  # Do not forget to specify iam token via YC_TOKEN env variable.
  folder_id                = var.folder_id
  zone                     = var.zone
}