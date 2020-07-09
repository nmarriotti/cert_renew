# Automated Renewal of Self-Signed Certificates

Usage: ./cert_renew.sh private_key certificate trigger

private_key = Path to private key file
certificate = Path to server certificate
trigger = Days remaining when new certificate should be generated. 

This script is intended to be executed via cron.

The expiration date is checked regularly and based on a days remaining calculation, a new certificate is generated with DN information specified within cert_vars.sh
