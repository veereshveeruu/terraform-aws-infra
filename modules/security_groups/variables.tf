variable "project" {}
variable "vpc_id" {}
variable "allowed_cidrs" {
  type = list(string)
}
