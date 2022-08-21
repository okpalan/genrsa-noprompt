
#!/bin/bash

# This script creates a new RSA webcertificate and key pair

# Check for openssl
if ! command -v openssl &> /dev/null; then
    echo "openssl is not installed. Please install it and try again."
    exit 1
fi

# Check for configuration file
if [ ! -f "config.cnf" ]; then
    echo "Config file is missing. Please create it and try again."
    exit 1
fi

# Create certificate and key
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout private.key -out certificate.crt -config config.cnf

# Check for errors
if [ $? -ne 0 ]; then
    echo "An error occurred. Please check the config file and try again."
    exit 1
fi

echo "Certificate and key pair created successfully!"
exit 0 
