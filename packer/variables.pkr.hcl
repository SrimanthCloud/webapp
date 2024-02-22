variable "project_id" {
  type    = string
  default = "devproject-414921"
}

variable "zone" {
  type    = string
  default = "us-east1-b"
}

variable "image_name" {
  type    = string
  default = "centos-8-stream_push_testing"
}

variable "image_description" {
  type    = string
  default = "Custom image with node, and MySQL for my web application"
}

variable "source_image_family" {
  type    = string
  default = "centos-stream-8"
}
