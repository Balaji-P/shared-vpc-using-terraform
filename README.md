# Applying The Terraform Plan
1. Requires a GCP user assigned the Compute Shared VPC Admin role.  

**Note** Service accounts cannot be assigned the Shared VPC Admin role.

2. Enable the Compute API in both the host and service projects.  Enabling API service through Terraform is problematic. It's much easier to enable using gcloud instead.

Execute the following gcloud commands to enable the APIs. Appropriate permissions required.

```
gcloud services enable compute.googleapis.com [--project project_id]
gcloud services enable container.googleapis.com [--project project_id]
```

3. Authenticate with GCP using the gcloud init command. Provide email address for the GCP user with Compute Shared Admin permissions.

4. Amend the terraform.tfvars file accordingly.

5. Run the following commands:

```
    terraform init
    terrafrom plan
    terraform apply
```
