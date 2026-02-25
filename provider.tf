#####################################
# Providers
#####################################

provider "aws" {
  alias  = "security"
  region = "ap-south-1"
}

provider "aws" {
  alias  = "production"
  region = "ap-south-1"

  assume_role {
    role_arn = "arn:aws:iam::696192989304:role/TerraformDeploymentRole"
  }
}