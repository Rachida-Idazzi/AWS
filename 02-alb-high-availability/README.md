# AWS DevOps Project: ALB, Auto Scaling Group, and Custom Domain with HTTPS

## Overview
This project demonstrates a common DevOps pattern: deploying a resilient web application behind an Application Load Balancer (ALB) across multiple Availability Zones, secured with custom DNS via Route 53 and HTTPS via ACM.

---

## Architecture & Tasks Completed

### 1. Networking & EC2 Setup
* Launched two EC2 instances across different Availability Zones within the same VPC.
* Configured a custom web server using user-data scripts to output distinct instance content for testing load balancing.
* **[Insert Screenshot: EC2 Instances running in different AZs]**

### 2. Application Load Balancer (ALB) & Target Group
* Created an ALB in public subnets with a Target Group and root path health checks.
* Configured Security Groups for strict isolation: ALB allows public HTTP/80 and HTTPS/443, while EC2 instances only accept traffic from the ALB Security Group.
* **[Insert Screenshot: Target Group showing healthy registered instances]**

### 3. Route 53 & Namecheap Domain Integration
* Registered custom domain on Namecheap and pointed its custom name servers to AWS Route 53.
* Created a Public Hosted Zone and mapped the root domain to the ALB using an **A (ALIAS) record**.
* **[Insert Screenshot: Route 53 Hosted Zone details & ALIAS record configuration]**
* **[Insert Screenshot: Namecheap Custom DNS settings with AWS name servers]**

### 4. ACM SSL Certificate & HTTPS Listener
* Requested a public SSL/TLS certificate via AWS Certificate Manager (ACM) and validated it automatically via Route 53 DNS records.
* Added an HTTPS listener (Port 443) to the ALB bound to the ACM certificate, alongside an HTTP to HTTPS redirect.
* **[Insert Screenshot: ACM Certificate status showing "Issued"]**
* **[Insert Screenshot: ALB Listeners and rules tab showing active HTTP and HTTPS listeners]**

### 5. Auto Scaling Group (ASG) Bonus
* Created a Launch Template embedding the web server user-data and proper security groups.
* Deployed an Auto Scaling Group attached to the ALB Target Group to handle self-healing and scaling (Min: 2, Max: 4).
* **[Insert Screenshot: Auto Scaling Group summary and scaling details]**

---

## Final Verification
* Visited `https://yourdomain.com` to confirm valid SSL encryption (secure padlock icon) and traffic balancing across multiple instances.
* **[Insert Screenshot: Browser showing secure custom domain with web server response]**
