provider "local" {}

terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = ">=2.2.0"
    }
  }
}

resource "local_file" "my_pet" {
  filename = "peacock.txt"
  content = "I like to have peacock as my pet!!"
}