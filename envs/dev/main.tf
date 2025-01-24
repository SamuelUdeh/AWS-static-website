provider "aws" {
  region = "us-east-1"
}


module "s3_static_website" {
    source = "../../modules/s3-static-website"
    bucket_name          = var.bucket_name
  index_document       = var.index_document
  error_document       = var.error_document
  index_document_source = var.index_document_source
  error_document_source = var.error_document_source
  
}