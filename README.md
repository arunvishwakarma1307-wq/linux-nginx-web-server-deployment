# Linux Nginx Web Server Deployment & Administration

A hands-on Linux System Administration project built using Ubuntu Linux (WSL) and Nginx. This project demonstrates web server installation, service management, firewall configuration, custom web page deployment, HTTP verification, and real-time access log monitoring.

## 📌 Project Overview

The goal of this project was to build and manage a basic Linux web server using Nginx.

Project workflow:

Ubuntu Linux → Install Nginx → Manage Nginx Service → Configure UFW Firewall → Deploy Custom HTML Page → Test HTTP → Monitor Nginx Logs

## 🛠️ Technologies & Tools

- Ubuntu Linux
- WSL (Windows Subsystem for Linux)
- Nginx
- systemd
- UFW Firewall
- HTML
- Git
- GitHub
- Linux Command Line

## ✅ Implemented Features

- Installed Nginx web server
- Started and verified Nginx using systemctl
- Configured UFW firewall for Nginx
- Verified HTTP access through localhost
- Removed the default Nginx page
- Deployed a custom responsive HTML homepage
- Monitored Nginx access logs in real time
- Verified successful HTTP requests with 200 OK
- Managed the project using Git and GitHub

## 🚀 Installation & Setup

### 1. Update Ubuntu Packages

sudo apt update

### 2. Create Project Directory

mkdir -p ~/webserver_lab
cd ~/webserver_lab

### 3. Install Nginx

sudo apt install nginx -y

### 4. Start Nginx

sudo systemctl start nginx

### 5. Check Nginx Status

sudo systemctl status nginx

Expected status:

active (running)

## 🔥 Firewall Configuration

Allow Nginx traffic through UFW:

sudo ufw allow 'Nginx Full'

Enable UFW:

sudo ufw enable

Check firewall status:

sudo ufw status verbose

Note: The Nginx Full profile allows HTTP (80) and HTTPS (443) firewall traffic. HTTPS/TLS itself was not configured in this project.

## 🌐 Web Server Testing

Open the following URL in a browser:

http://localhost

If Nginx is running correctly, the web page will be displayed.

## 🖥️ Custom HTML Deployment

The default Nginx page was removed:

sudo rm -f /var/www/html/index.nginx-debian.html

The custom homepage was created at:

/var/www/html/index.html

Edit the page using:

sudo nano /var/www/html/index.html

## 📊 Log Monitoring

Nginx access logs were monitored in real time using:

sudo tail -f /var/log/nginx/access.log

Successful requests were observed with HTTP status:

200 OK

This helped verify that browser requests were reaching the Nginx web server successfully.

## 🔐 Current Security Configuration

The project includes:

- UFW firewall
- Nginx firewall rules
- HTTP web server configuration
- Basic access log monitoring

This project is a Linux administration lab and is not presented as a fully production-hardened web server.

## 📚 Skills Practiced

- Linux System Administration
- Server Administration
- Nginx
- Ubuntu Linux
- systemd
- UFW Firewall
- Web Server Deployment
- Linux Command Line
- Log Monitoring
- Basic Troubleshooting
- Git & GitHub

## 🔮 Future Improvements

The following features are not implemented yet and can be added in future versions:

- HTTPS / SSL / TLS configuration
- HTTP to HTTPS redirect
- Nginx Server Blocks
- Reverse Proxy
- Security Headers
- Rate Limiting
- Prometheus and Grafana monitoring
- Automated monitoring alerts
- SSH hardening
- Custom log rotation
- Automatic security updates

## 📌 Project Status

Status: In Progress

This project is currently under development. Additional Linux system administration, Nginx configuration, security, monitoring, and deployment features will be implemented in future stages.

Current project focus:

Linux Administration + Nginx Web Server + Firewall Configuration + Web Deployment + Log Monitoring

## 👨‍💻 Author

Arun Vishwakarma

GitHub:
https://github.com/arunvishwakarma1307-wq
