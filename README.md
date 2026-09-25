# Linux Nginx Web Server Deployment & Administration

A hands-on Linux System Administration project built using Ubuntu Linux (WSL) and Nginx. The project demonstrates web server installation, service management, firewall configuration, custom web page deployment, HTTP verification, HTTPS/TLS configuration, Nginx log management, log rotation, Bash-based RAM monitoring, and Git/GitHub version control.

## 📌 Project Overview

The goal of this project is to build and administer a Linux-based Nginx web server and progressively improve its configuration, security, monitoring, and log management capabilities.

Project workflow:

Ubuntu Linux → Install Nginx → Manage Nginx Service → Configure UFW Firewall → Deploy Custom HTML Page → Test HTTP → Monitor Access Logs → Configure HTTPS/TLS → Enforce HTTP-to-HTTPS Redirect → Configure Log Rotation → Monitor RAM Usage → Track System Status

## 🛠️ Technologies & Tools

- Ubuntu Linux
- WSL (Windows Subsystem for Linux)
- Nginx
- OpenSSL
- systemd
- UFW Firewall
- logrotate
- Bash / Shell Scripting
- HTML5
- Git
- GitHub
- Linux Command Line

---

# ✅ Phase 1 — Web Server Deployment

## Nginx Installation

Updated Ubuntu package information:

    sudo apt update

Installed Nginx:

    sudo apt install nginx -y

Started the Nginx service:

    sudo systemctl start nginx

Verified the service status:

    sudo systemctl status nginx

Nginx was verified as active and running.

## Firewall Configuration

Allowed Nginx web traffic through UFW:

    sudo ufw allow 'Nginx Full'

Enabled UFW:

    sudo ufw enable

Verified firewall configuration:

    sudo ufw status verbose

The Nginx Full profile allows firewall traffic for HTTP (80) and HTTPS (443).

Note: During Phase 1, HTTPS/TLS itself was not configured.

## Custom Web Page Deployment

Removed the default Nginx placeholder page:

    sudo rm -f /var/www/html/index.nginx-debian.html

Deployed a custom responsive HTML5 homepage at:

    /var/www/html/index.html

HTTP access was verified through:

    http://localhost

The custom HTML5 dashboard was successfully displayed through the Nginx web server.

## Nginx Access Log Monitoring

Monitored Nginx access logs in real time:

    sudo tail -f /var/log/nginx/access.log

Successful browser requests were observed with HTTP status:

    200 OK

This verified that requests were reaching the Nginx web server successfully.

---

# 🔐 Phase 2 — Security Hardening & HTTPS

Phase 2 focused on introducing HTTPS/TLS to the existing Nginx web server and enforcing encrypted browser access.

## 1. Self-Signed SSL/TLS Certificate Generation

Generated a 2048-bit RSA private key and a 365-day self-signed certificate using OpenSSL:

    sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=IN/ST=Gujarat/L=Ahmedabad/O=Enterprise/OU=IT/CN=localhost"

Certificate files were stored at:

Private Key:

    /etc/ssl/private/nginx-selfsigned.key

Certificate:

    /etc/ssl/certs/nginx-selfsigned.crt

The private key and certificate were used locally for the Nginx HTTPS configuration.

## 2. Nginx HTTPS Configuration

Updated the Nginx default virtual host configuration:

    /etc/nginx/sites-available/default

Configured two server blocks:

- HTTP server on port 80
- HTTPS server on port 443

HTTP traffic was configured to redirect permanently to HTTPS using:

    return 301

HTTPS was configured using the generated certificate and private key paths.

## 3. Nginx Configuration Verification

Before restarting Nginx, the configuration syntax was tested:

    sudo nginx -t

Verification result:

    syntax is ok
    test is successful

This confirmed that the modified Nginx configuration passed Nginx syntax validation.

## 4. Nginx Service and Firewall Reload

Restarted Nginx:

    sudo systemctl restart nginx

Reloaded UFW:

    sudo ufw reload

## 5. HTTPS Verification

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

The private key and certificate are kept outside the GitHub project repository.

---

# 📊 Phase 3 — Automated Monitoring & Log Optimization Lifecycle

Phase 3 focused on Nginx log lifecycle management and Bash-based system resource monitoring using native Linux tools.

## 1. Nginx Log Rotation Configuration

Customized the Nginx logrotate configuration:

    /etc/logrotate.d/nginx

The configuration includes:

- Daily log rotation
- Retention of 7 rotated logs
- gzip compression of rotated logs
- Delayed compression using delaycompress
- Skipping of empty log files
- Creation of rotated logs with defined ownership and permissions
- Shared post-rotation script execution
- Nginx log file reopening through the USR1 signal after rotation

The configured log path is:

    /var/log/nginx/*.log

The configuration was validated using logrotate debug/dry-run mode:

    sudo logrotate -d /etc/logrotate.d/nginx

The validation confirmed that the Nginx access and error logs were correctly recognized by the rotation configuration.

During validation, logrotate reported the current logs did not require another rotation because they had already been rotated. This was expected behavior and did not indicate a configuration error.

A project copy of the configuration is maintained as:

    nginx_logrotate.conf

## 2. Bash RAM Monitoring Script

Created a Bash-based RAM monitoring script:

    server_monitor.sh

The script:

- Defines an 80% RAM usage threshold
- Reads total and used RAM using Linux command-line utilities
- Calculates current RAM usage percentage
- Compares the calculated usage against the configured threshold
- Generates an alert log entry when RAM usage exceeds 80%
- Records a healthy status when RAM usage does not exceed the threshold
- Adds a timestamp to each monitoring record
- Stores monitoring results in:

    server_alerts.log

The threshold logic uses a greater-than comparison, meaning an alert is generated only when RAM usage exceeds 80%.

## 3. Script Execution & Verification

Made the monitoring script executable:

    chmod +x server_monitor.sh

Executed the monitoring script manually:

    ./server_monitor.sh

Reviewed the generated monitoring record:

    cat server_alerts.log

During verification, the script successfully recorded:

    [🟢 HEALTHY] 2026-09-22 15:03:43_UTC - System Optimized. Live RAM Usage is at 12%

This confirmed that the script successfully collected the current RAM information, calculated the usage percentage, evaluated the threshold condition, and recorded the resulting status.

The monitoring script currently runs through manual invocation. Continuous or scheduled execution using Cron or a systemd timer has not yet been implemented.

## 4. Phase 3 Skills Practiced

- Linux System Administration
- Linux Log Management
- Nginx Log Management
- logrotate
- Log Rotation
- Log Retention
- Log Compression
- Bash Scripting
- Shell Scripting
- RAM Monitoring
- Resource Monitoring
- Threshold-Based Monitoring
- Linux Command-Line Tools
- Basic System Monitoring
- Configuration Validation
- Linux File Permissions
- Git
- GitHub

---

# 🌐 Phase 4 — Multi-Tenant Virtual Hosting & Server Blocks Architecture

Phase 4 focused on configuring Nginx name-based virtual hosting so multiple independent local websites could run on a single Nginx server using separate server blocks and isolated web roots.

## 1. Site A Server Block

Created the Nginx server block configuration:

    /etc/nginx/sites-available/siteA

Configured Site A with:

    server_name sitea.local;
    root /var/www/siteA/html;

The server block listens on HTTP port 80 and serves the Site A website from its independent document root.

## 2. Site B Server Block

Created the Nginx server block configuration:

    /etc/nginx/sites-available/siteB

Configured Site B with:

    server_name siteb.local;
    root /var/www/siteB/html;

The server block listens on HTTP port 80 and serves the Site B website from its independent document root.

## 3. Independent Web Roots

Created separate web directories for both local sites:

    sudo mkdir -p /var/www/siteA/html /var/www/siteB/html

Configured ownership for the web directories using the current Linux user.

Distinct responsive HTML5 homepages were deployed for Site A and Site B.

This provides separate website content while using the same Nginx server instance.

## 4. Nginx Site Enablement

Enabled both server block configurations through the Nginx `sites-enabled` directory using symbolic links.

The previous default site symlink was removed so the new Site A and Site B server blocks could handle the local hostnames.

## 5. Nginx Configuration Validation

Validated the Nginx configuration before restarting the service:

    sudo nginx -t

The configuration test completed successfully. Nginx was then restarted using:

    sudo systemctl restart nginx

## 6. Host-Based Routing Verification

Tested Nginx server-block routing by sending custom HTTP Host headers:

    curl -H "Host: sitea.local" http://localhost

    curl -H "Host: siteb.local" http://localhost

The first request returned the Site A homepage and the second request returned the Site B homepage.

## 7. Local Hostname Resolution

Added local hostname mappings to `/etc/hosts`:

    127.0.0.1 sitea.local
    127.0.0.1 siteb.local

Verified hostname resolution using:

    getent hosts sitea.local
    getent hosts siteb.local

Direct hostname requests were then verified using:

    curl http://sitea.local
    curl http://siteb.local

Both hostnames successfully resolved to the local system and returned their corresponding websites.

## 8. Configuration Backup

Project copies of the active Site A and Site B Nginx configurations are maintained as:

    nginx_siteA.conf
    nginx_siteB.conf

These files are stored in the project repository for configuration version tracking.

### Phase 4 Note

Phase 4 currently provides HTTP-based local virtual hosting for `sitea.local` and `siteb.local`. The earlier Phase 2 HTTPS configuration for the default `localhost` server is not currently active after the default site was disabled; HTTPS has not yet been integrated into the Site A and Site B virtual-host architecture.

---

# 🔄 Phase 5 — Nginx Reverse Proxy & HTTP Security Hardening

Phase 5 focused on configuring Nginx as a reverse proxy for `sitea.local` and adding HTTP security response headers.

## 1. Reverse Proxy Configuration

Updated the Nginx Site A server block:

    /etc/nginx/sites-available/siteA

Configured Nginx to forward incoming requests for `sitea.local` to the internal application endpoint:

    http://127.0.0.1:8080

The reverse proxy configuration includes the following forwarded request headers:

- Host
- X-Real-IP
- X-Forwarded-For
- X-Forwarded-Proto

## 2. HTTP Security Headers

Added the following HTTP response security headers:

- X-Frame-Options: SAMEORIGIN
- X-XSS-Protection: 1; mode=block
- X-Content-Type-Options: nosniff
- Referrer-Policy: no-referrer-when-downgrade

These configured headers were verified in the live HTTP response.

## 3. Nginx Configuration Validation

Validated the Nginx configuration using:

    sudo nginx -t

The configuration test completed successfully with:

    syntax is ok
    test is successful

Restarted the Nginx service:

    sudo systemctl restart nginx

## 4. Reverse Proxy Verification

Tested the Site A reverse proxy using:

    curl -I -H "Host: sitea.local" http://localhost

The request returned:

    HTTP/1.1 502 Bad Gateway

The response also included the configured HTTP security headers.

The `502 Bad Gateway` response occurred because the configured upstream application endpoint at:

    http://127.0.0.1:8080

did not have an active backend service listening on port 8080 during verification.

The Nginx error log confirmed the upstream connection failure:

    connect() failed (111: Connection refused) while connecting to upstream

This confirmed that Nginx received the request and attempted to connect to the configured upstream backend.

## 5. Configuration Backup

A project copy of the Phase 5 Site A reverse proxy configuration is maintained as:

    nginx_proxy_siteA.conf

The configuration was committed and pushed to the GitHub repository.

### Phase 5 Note

The reverse proxy configuration is currently configured for the internal endpoint `127.0.0.1:8080`. A backend application has not yet been configured on port 8080, so the current verification returns `502 Bad Gateway` while the proxy and configured response headers remain active.

---

# 📚 Skills Practiced

## Linux Administration

- Linux System Administration
- Server Administration
- Ubuntu Linux
- Linux Command Line
- systemd
- Service Management
- UFW Firewall
- Linux Log Management
- Resource Monitoring
- Bash Scripting
- Basic Troubleshooting

## Web Server Administration

- Nginx Installation
- Nginx Service Management
- Nginx Virtual Host Configuration
- Nginx Server Blocks
- Name-Based Virtual Hosting
- Virtual Hosting
- Reverse Proxy Configuration
- HTTP Configuration
- HTTPS Configuration
- HTTP-to-HTTPS Redirection
- Web Server Testing
- Access Log Monitoring
- Nginx Log Management
- Log Rotation

## Security & Networking

- OpenSSL
- SSL/TLS Certificate Generation
- RSA Key Generation
- HTTPS
- Port 80 / Port 443
- Firewall Configuration
- HTTP Security Headers
- Basic Web Server Security Hardening

## Monitoring & Log Management

- logrotate
- Log Rotation
- Log Retention
- Log Compression
- Bash-Based RAM Monitoring
- Threshold-Based Monitoring
- Resource Monitoring
- Configuration Validation
- Linux Log Management

## Version Control

- Git
- GitHub
- Configuration Version Tracking

---

# 🔮 Future Improvements

The project is still under development. Future phases may include:

- CA-issued HTTPS certificate for a real domain
- Rate Limiting
- SSH Hardening
- Prometheus and Grafana Monitoring
- Scheduled Monitoring using Cron or systemd timers
- Automated Monitoring Alerts
- Advanced Log Rotation Policies
- CPU and Disk Usage Monitoring
- Email or external alert integration
- Automatic Security Updates
- Backup and Recovery of Nginx Configuration
- Backend Application Deployment for Reverse Proxy
- Additional Linux Server Administration tasks

---

# 📌 Project Status

Status: In Progress

Phase 1: Web Server Deployment — Completed

Phase 2: HTTPS/TLS Configuration — Completed

Phase 3: Log Management & RAM Monitoring — Completed

Phase 4: Multi-Tenant Virtual Hosting & Server Blocks Architecture — Completed

Phase 5: Nginx Reverse Proxy & HTTP Security Hardening — Completed

The project is currently under development. Additional Linux system administration, Nginx configuration, security, monitoring, and deployment features will be implemented in future stages.

---

# 👨‍💻 Author

Arun Vishwakarma

GitHub:

https://github.com/arunvishwakarma1307-wq
