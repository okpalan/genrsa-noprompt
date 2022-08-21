
@echo off

rem This script creates a new RSA webcertificate and key pair

rem Check for openssl
if not exist "\openssl.exe" (
    echo openssl is not installed. Please install it and try again.
    exit /b 1
)

rem Check for configuration file
if not exist "config.cnf" (
    echo Config file is missing. Please create it and try again.
    exit /b 1
)

rem Create certificate and key
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout private.key -out certificate.crt -config config.cnf

rem Check for errors
if %errorlevel% neq 0 (
    echo An error occurred. Please check the config file and try again.
    exit /b 1
)

echo Certificate and key pair created successfully!
exit /b 0
