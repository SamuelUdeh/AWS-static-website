# Static Website on AWS S3 with Terraform

This repository contains the Terraform configuration to deploy a static website on an AWS S3 bucket.

## Features
- **S3 Backend and DynamoDb lock Creation**: Provisions an S3  backend for state storage
- **S3 Bucket Creation**: Provisions an S3 bucket for hosting the static website.
- **Static Website Configuration**: Sets up the bucket for static website hosting with an index and error document.
- **Automatic File Upload**: Uploads all files from a specified source directory to the S3 bucket.
- **Public Access Configuration**: Configures the bucket policy for public access to website files.
- **Content Type Detection**: Automatically assigns appropriate MIME types to uploaded files based on their extensions.
- **Content Delivery**: Use Cloudfront for CDN.


## Prerequisites
Ensure you have the following before proceeding:
1. [Terraform](https://www.terraform.io/downloads.html) installed.
2. AWS CLI configured with sufficient permissions to manage S3 buckets and policies.
3. A directory containing the static website files (e.g., HTML, CSS, JavaScript).

## Folder Structure

project-root/
```
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
       
```

## Architectural Diagram
![Alt text][




## Variables
- bucket_name: The name of the S3 bucket to be created.
- tags: Key-value pairs for tagging the S3 bucket.
- index_document: The name of the main HTML file (e.g., index.html).
- error_document: The name of the error HTML file (e.g., error.html).
- source_directory: The directory containing static website files to upload.

## Setup Instructions

### Step 1: Clone the Repository
Clone this repository to your local machine:

```
git clone <repository-url>
cd <repository-folder>

```

### Step 2: Configure Variables
Update the variables.tf file with your desired values, or pass them as command-line arguments when running Terraform.

### Step 3: Initialize Terraform
Initialize the Terraform workspace to download the necessary provider plugins:

```
terraform init
```

### Step 4: Review and Apply Changes
Review the Terraform execution plan and apply the configuration:

```
terraform plan
terraform apply
```

### Step 5: Upload Static Files
Ensure your static files are located in the directory specified by var.source_directory. Terraform will automatically upload them to the S3 bucket during apply.

### Step 6: Access Your Website
- Retrieve the S3 bucket  CloudFront domain from the Terraform outputs.
- Access the static website using the endpoint:

https://dghdhvdhh.cloudfront.net

![Alt text](https://github.com/Otumiky/static-website/blob/main/cdn.png)

![Alt text](https://github.com/Otumiky/static-website/blob/main/cdnwb.png)

![Alt text](https://github.com/Otumiky/static-website/blob/main/cdnurl.png)

## Cleaning Up
To remove all resources created by Terraform:
```
terraform destroy
```

## References
- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [AWS S3 Static Website Hosting](https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html)
