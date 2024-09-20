variable "instance_name" {
    type = list(string)
    default = ["mysql", "backend", "frontend"]
}

variable "common_type" {
    type = map
    default = {
        project = "expense"
        Environment = "dev"
        Terraform ="true"
    }
}     