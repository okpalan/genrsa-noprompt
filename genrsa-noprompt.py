#!/usr/bin/env python
import os
import sys

# This script creates a new RSA webcertificate and key pair

# Check for openssl
if not os.path.isfile("/usr/bin/openssl"):
    print "openssl is not installed. Please install it and try again."
    sys.exit(1)

# Check for configuration file
if not os.path.isfile("config.cnf"):
    print "Config file is missing. Please create it and try again."
    sys.exit(1)

# Create certificate and key
retcode = os.system("openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout private.key -out certificate.crt -config config.cnf")

# Check for errors
if retcode != 0:
    print "An error occurred. Please check the config file and try again."
    sys.exit(1)

print "Certificate and key pair created successfully!"
sys.exit(0)
 