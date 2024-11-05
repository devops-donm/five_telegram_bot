#!/bin/bash

# Variables
DOMAIN="example.com"               # Replace with your domain name
CERT_DIR="./certs"                 # Directory to store the certificate
KEY_FILE="${CERT_DIR}/${DOMAIN}.key"
CERT_FILE="${CERT_DIR}/${DOMAIN}.crt"
DAYS_VALID=365                     # Certificate validity in days

# Create directory for certificates if it doesn't exist
mkdir -p "${CERT_DIR}"

# Generate the private key
echo "Generating private key..."
openssl genpkey -algorithm RSA -out "${KEY_FILE}" -aes256 -pass pass:your_password_here
# Remove -aes256 -pass pass:your_password_here if you want an unencrypted key

# Generate the certificate signing request and self-signed certificate
echo "Generating certificate..."
openssl req -new -x509 -key "${KEY_FILE}" -out "${CERT_FILE}" -days "${DAYS_VALID}" -subj "/C=US/ST=State/L=City/O=Organization/OU=Org Unit/CN=${DOMAIN}"

echo "Certificate and key generated in ${CERT_DIR}"
