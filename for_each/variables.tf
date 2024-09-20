variable "instances" {
    type = map
    default = {
        mysql = "t3.small"
        backend = "t3.micro"
        forntend = "t3.micro"
    }
}
variable "doamin_name" {
    default = "daws81.online"
}     

variable "zone_id" {
    default = "Z04225871VP33JIETT7S8"
}    
