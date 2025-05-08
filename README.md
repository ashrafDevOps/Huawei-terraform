# Huawei Cloud Apache Web Server Deployment with Terraform

This project uses **Terraform** to automate the deployment of an Apache web server on **Huawei Cloud Elastic Cloud Server (ECS)**. It includes configuration of the entire network infrastructure.

## 🌐 What This Project Does

- Creates a custom **Virtual Private Cloud (VPC)** and **subnet**
- Configures **security groups** to allow HTTP traffic (port 80)
- Provisions an **ECS instance** and installs Apache web server automatically
- Attaches a **public Elastic IP** to make the server accessible on the internet
- Displays a custom HTML message on the web server

## 📦 Tools and Services Used

- **Terraform** (Infrastructure as Code)
- **Huawei Cloud ECS, VPC, EIP**
- **Apache Web Server**
- **Bash script with cloud-init**

## 🔐 Authentication

This project uses **Access Key and Secret Key** authentication for the Huawei Cloud provider.

## 📍 Region

Configured for deployment in the `af-south-1` region (Cape Town).

## 🧰 How to Use

1. Set your `access_key`, `secret_key`, and other variables in `terraform.tfvars`.
2. Run `terraform init` to initialize.
3. Run `terraform apply` to create the resources.
4. Visit the public IP in your browser to see the message.

## 📢 Author

This project is part of my internship as a **Cloud Solutions Architect at DDS** and my journey in the **System Administration Track at ITI Aswan**.
