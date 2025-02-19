variable "region_with_availability_zone" {
  description = "Region with availability zone"
  type        = string
}

variable "hub_cidr" {
  description = "CIDR for the hub vnet"
  type        = string
}

variable "gateway_subnet_cidr" {
  description = "CIDR for the hub vnet gateway subnet"
  type        = string
}

variable "private_endpoint_subnet_cidr" {
  description = "CIDR for the hub vnet private endpoint subnet"
  type        = string
}

variable "firewall_subnet_cidr" {
  description = "CIDR for the hub vnet firewall subnet"
  type        = string
}
