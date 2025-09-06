# uncomment the all lines below and
# configure the AWS Provider before using it with correct values


/*


terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.12.0"
    }
  }

  backend "s3" {
    bucket = "your-bucket-name"
    key    = "project/env/terraform.tfstate"
    region = "your-region" 

  }
}

provider "aws" {
  region = "your-region"
  access_key = "your-access-key"
  secret_key = "your-secret-key"

}


*/
