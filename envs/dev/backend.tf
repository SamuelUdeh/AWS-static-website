terraform {
  backend "s3" {
    bucket         = "samley-bucket"
    key            = "dev/terraform.tfstate"    
    region         = "us-east-1"          
    dynamodb_table = "state-locks"   
    encrypt        = true     
  }
}