variable "region_with_availability_zone" {
  description = "Region with availability zone"
  type        = string
  default     = "#{AZ_REGION}#"
}

variable "hub_cidr" {
  description = "CIDR for the hub vnet"
  type        = list(string)
  default     = ["#{AZ_HUB_ADDRESS_SPACE}#"]
}

variable "gateway_subnet_cidr" {
  description = "CIDR for the hub vnet gateway subnet"
  type        = list(string)
  default     = ["#{AZ_HUB_GATEWAY_SUBNET}#"]
}

variable "private_endpoint_subnet_cidr" {
  description = "CIDR for the hub vnet private endpoint subnet"
  type        = list(string)
  default     = ["#{AZ_HUB_PRIVATE_ENDPOINT_SUBNET}#"]
}

variable "firewall_subnet_cidr" {
  description = "CIDR for the hub vnet firewall subnet"
  type        = list(string)
  default     = ["#{AZ_HUB_FIREWALL_SUBNET}#"]
}

variable "private_dns_in_subnet_cidr" {
  description = "CIDR for the hub vnet private DNS in subnet"
  type        = list(string)
  default     = ["#{AZ_HUB_PRIVATE_DNS_IN_SUBNET}#"]
}

variable "private_dns_out_subnet_cidr" {
  description = "CIDR for the hub vnet private DNS out subnet"
  type        = list(string)
  default     = ["#{AZ_HUB_PRIVATE_DNS_OUT_SUBNET}#"]
}

variable "dns_zones" {
  description = "Private DNS zones"
  type        = list(string)
  default     = [#{AZ_PRIVATE_DNS_ZONES}#]
}

variable "law_retention_in_days" {
  description = "Log Analytics Workspace retention in days"
  type        = number
  default     = #{AZ_LAW_RETENTION_IN_DAYS}#
}
