

# This script creates a new RSA webcertificate and key pair

# Check for openssl
if (!(Test-Path -Path "\openssl.exe")) {
    Write-Host "openssl is not installed. Please install it and try again."
    exit 1
}

# Check for configuration file
if (!(Test-Path -Path "config.cnf")) {
    Write-Host "Config file is missing. Please create it and try again."
    exit 1
}

# Create certificate and key
& "\openssl.exe" req -x509 -nodes -days 365 -newkey rsa:2048 -keyout private.key -out certificate.crt -config config.cnf

# Check for errors
if ($LASTEXITCODE -ne 0) {
    Write-Host "An error occurred. Please check the config file and try again."
    exit 1
}

Write-Host "Certificate and key pair created successfully!"
exit 0
