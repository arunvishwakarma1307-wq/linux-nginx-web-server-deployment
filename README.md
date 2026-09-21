# Linux Nginx Web Server Deployment & Administration

A hands-on Linux System Administration project built using Ubuntu Linux (WSL) and Nginx. The project demonstrates web server installation, service management, firewall configuration, custom web page deployment, HTTP verification, HTTPS/TLS configuration, and real-time access log monitoring.

## 📌 Project Overview

The goal of this project is to build and administer a Linux-based Nginx web server and progressively improve its configuration and security.

Project workflow:

Ubuntu Linux → Install Nginx → Manage Nginx Service → Configure UFW Firewall → Deploy Custom HTML Page → Test HTTP → Monitor Logs → Configure HTTPS/TLS → Enforce HTTP-to-HTTPS Redirect

## 🛠️ Technologies & Tools

- Ubuntu Linux
- WSL (Windows Subsystem for Linux)
- Nginx
- OpenSSL
- systemd
- UFW Firewall
- HTML5
- Git
- GitHub
- Linux Command Line

## ✅ Phase 1 — Web Server Deployment

### Nginx Installation

Updated Ubuntu package information:

sudo apt update

Installed Nginx:

sudo apt install nginx -y

Started the Nginx service:

sudo systemctl start nginx

Verified the service status:

sudo systemctl status nginx

Nginx was verified as active and running.

### Firewall Configuration

Allowed Nginx web traffic through UFW:

sudo ufw allow 'Nginx Full'

Enabled UFW:

sudo ufw enable

Verified firewall configuration:

sudo ufw status verbose

The Nginx Full profile allows firewall traffic for HTTP (80) and HTTPS (443).

Note: During Phase 1, HTTPS/TLS itself was not configured.

### Custom Web Page Deployment

Removed the default Nginx placeholder page:

sudo rm -f /var/www/html/index.nginx-debian.html

Deployed a custom responsive HTML5 homepage at:

/var/www/html/index.html

HTTP access was verified through:

http://localhost

### Nginx Access Log Monitoring

Monitored Nginx access logs in real time:

sudo tail -f /var/log/nginx/access.log

Successful browser requests were observed with HTTP status:

200 OK

This verified that requests were reaching the Nginx web server successfully.

## 🔐 Phase 2 — Security Hardening & HTTPS

Phase 2 focused on introducing HTTPS/TLS to the existing Nginx web server and enforcing encrypted browser access.

### 1. Self-Signed SSL/TLS Certificate Generation

Generated a 2048-bit RSA private key and a 365-day self-signed certificate using OpenSSL:

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=IN/ST=Gujarat/L=Ahmedabad/O=Enterprise/OU=IT/CN=localhost"

Certificate files were stored at:

Private Key:
/etc/ssl/private/nginx-selfsigned.key

Certificate:
/etc/ssl/certs/nginx-selfsigned.crt

### 2. Nginx HTTPS Configuration

Updated the Nginx default virtual host configuration:

/etc/nginx/sites-available/default

Configured two server blocks:

- HTTP server on port 80
- HTTPS server on port 443

HTTP traffic was configured to redirect permanently to HTTPS using:

return 301

HTTPS was configured using the generated certificate and private key paths.

### 3. Nginx Configuration Verification

Before restarting Nginx, the configuration syntax was tested:

sudo nginx -t

Verification result:

syntax is ok
test is successful

This confirmed that the modified Nginx configuration passed the Nginx syntax validation.

### 4. Nginx Service and Firewall Reload

Restarted Nginx:

sudo systemctl restart nginx

Reloaded UFW:

sudo ufw reload

### 5. HTTPS Verification

The HTTPS configuration was tested through a browser using:

https://localhost

Because the certificate is self-signed, the browser displayed its normal certificate warning.

The warning was bypassed through the browser's Advanced / Proceed option for local testing.

After proceeding, the custom HTML5 dashboard loaded successfully through HTTPS.

## 🔒 Current Security Configuration

The project currently includes:

- UFW firewall configuration
- Nginx web server
- HTTPS on port 443
- HTTP-to-HTTPS permanent redirect
- OpenSSL-generated 2048-bit RSA private key
- 365-day self-signed TLS certificate
- Nginx configuration syntax validation
- Nginx access log monitoring

### Important Security Note

The current HTTPS implementation uses a self-signed certificate for local development and learning purposes.

It is not a publicly trusted CA-issued certificate and should not be described as production-grade public HTTPS.

## 📚 Skills Practiced

### Linux Administration

- Linux System Administration
- Server Administration
- Ubuntu Linux
- Linux Command Line
- systemd
- Service Management
- UFW Firewall
- Basic Troubleshooting

### Web Server Administration

- Nginx Installation
- Nginx Service Management
- Nginx Virtual Host Configuration
- HTTP Configuration
- HTTPS Configuration
- HTTP-to-HTTPS Redirection
- Web Server Testing
- Access Log Monitoring

### Security & Networking

- OpenSSL
- SSL/TLS Certificate Generation
- RSA Key Generation
- HTTPS
- Port 80 / Port 443
- Firewall Configuration
- Basic Web Server Security Hardening

### Version Control

- Git
- GitHub
- Configuration Version Tracking

## 🔮 Future Improvements

The project is still under development. Future phases may include:

- CA-issued HTTPS certificate for a real domain
- Nginx Server Blocks for multiple websites
- Reverse Proxy Configuration
- Security Headers
- Rate Limiting
- SSH Hardening
- Prometheus and Grafana Monitoring
- Automated Monitoring Alerts
- Custom Log Rotation
- Automatic Security Updates
- Backup and Recovery of Nginx Configuration
- Additional Linux Server Administration tasks

## 📌 Project Status

Status: In Progress

This project is currently under development. Additional Linux system administration, Nginx configuration, security, monitoring, and deployment features will be implemented in future stages.

## 👨‍💻 Author

Arun Vishwakarma

GitHub:
https://github.com/arunvishwakarma1307-wq
