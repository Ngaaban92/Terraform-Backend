variable "my-ami" {
  type    = string
  default = "ami-0aa8fc2422063977a"

}

/*
variable "instance-type" {
  type    = list(string)
  default = ["t2.small", "t2.micro", "t2.medium"]

}

*/

variable "instance-type" {
  type = map(any)
  default = {
    dev  = "t2.small"
    uat  = "t2.micro"
    prod = "t2.medium"
  }
}



variable "instance-name" {
  type    = string
  default = "tla-server"


}

variable "us-region" {
  type    = string
  default = "us-east-2"
}