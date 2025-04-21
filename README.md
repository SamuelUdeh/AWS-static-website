**Static Website on AWS S3 with Terraform**

This repository contains the Terraform configuration to deploy a static website on an AWS S3 bucket.

**Features**
**S3 Backend and DynamoDb lock Creation:** Provisions an S3 backend for state storage
**S3 Bucket Creation:** Provisions an S3 bucket for hosting the static website.
**Static Website Configuration:** Sets up the bucket for static website hosting with an index and error document.
**Automatic File Upload**: Uploads all files from a specified source directory to the S3 bucket.
**Public Access Configuration:** Configures the bucket policy for public access to website files.
**Content Delivery:** Use Cloudfront for CDN.

**Prerequisites**
Before you can deploy this project, make sure you have the following:
[Terraform](https://developer.hashicorp.com/terraform)
AWS CLI configured with sufficient permissions to manage S3 buckets and policies.
A directory containing the static website files (e.g., HTML, CSS, JavaScript)

**Folder Structure**
project-root/
├── modules/
│   └── s3-static-website/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── envs/
│   └── dev/
│       ├── main.tf
│       ├── variables.tf
│       ├── cloudfront.tf
│       ├── outputs.tf
│       └── terraform.tfvars
│        ├── backend.tf
├── website/
│   └──
│      ├── index.html
│      ├── error.html
       

**Architectural Diagram**
