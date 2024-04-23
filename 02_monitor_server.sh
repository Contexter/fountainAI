#!/bin/bash

# Save this script as '02_monitor_server.sh' and make it executable:
# chmod +x monitor_server.sh
# Run the script using:
# ./monitor_server.sh

# Define color codes
GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m"  # No Color

# Prompt user for the domain to monitor
read -p "Please enter the domain you want to monitor: " domain

echo -e "${GREEN}Starting server monitoring checks for $domain...${NC}"

# Check if Nginx is active and running
function check_nginx {
    echo "Checking Nginx service status..."
    if systemctl is-active --quiet nginx; then
        echo -e "${GREEN}Nginx is running.${NC}"
    else
        echo -e "${RED}Nginx is not running.${NC}"
        return 1
    fi
}

# Check if the web server is serving the expected content
function check_web_server {
    echo "Checking web server response..."
    # Use curl to fetch the homepage over HTTPS and include a user-agent header to mimic browser requests
    response=$(curl -s -L --insecure -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36" https://$domain)
    if [[ "$response" == *'Nginx is working correctly'* ]]; then
        echo -e "${GREEN}Web server is serving the expected content.${NC}"
    else
        echo -e "${RED}Web server content does not match expected. Response was: $response${NC}"
        return 1
    fi
}

# Verify the SSL certificate's validity
function verify_ssl_certificate {
    echo "Verifying SSL certificate..."
    ssl_output=$(echo | openssl s_client -connect ${domain}:443 -servername ${domain} 2>/dev/null)
    if echo "$ssl_output" | grep -q 'BEGIN CERTIFICATE'; then
        expiration_date=$(echo "$ssl_output" | openssl x509 -noout -enddate | cut -d= -f2)
        echo "SSL certificate is valid until $expiration_date."
    else
        echo "SSL certificate is not found or an error occurred."
        return 1
    fi
}

# Execute monitoring functions
check_nginx
check_web_server
verify_ssl_certificate

# Final check to see if any of the steps failed
if [ $? -eq 0 ]; then
    echo -e "${GREEN}All systems functional.${NC}"
else
    echo -e "${RED}One or more checks failed. Please investigate.${NC}"
    exit 1
fi
