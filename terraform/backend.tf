# Change the key and region names accordingly to reflect the current application usage
terraform {
  backend "s3" {
    bucket = "sctp-ce7-tfstate"
    key    = "tf-lcchua-3010024.tfstate"
    region = "us-east-1"
  }
}