variable "bucket_name" {
  description = "The name of the S3 bucket"
}

variable "index_document" {
  description = "The index document for the website"
}

variable "error_document" {
  description = "The error document for the website"
}

variable "index_document_source" {
  description = "Path to the local index.html file"
}

variable "error_document_source" {
  description = "Path to the local error.html file"
}