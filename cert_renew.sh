#!/bin/bash
# Renew server certificate based on expiration date
# Nick Marriotti - 7/8/2020

source cert_vars.sh

if [ `echo $#` -lt 2 ]; then
	echo "Usage: ./cert_renew.sh private_key certficiate"
	exit 1
fi

private_key=$1
certificate=$2
trigger=$3

if [ ! -f $private_key ] || [ ! -f $certificate ]; then
	echo "Invalid arguments!"
	exit 1
fi

if [[ $trigger == "" ]]; then
	trigger=14
fi

expiration=`echo | openssl s_client -servername localhost -connect localhost:443 2> /dev/null | openssl x509 -noout -dates | grep notAfter | cut -d '=' -f 2`

today=`date +%s`
expiration=`date -d "$expiration" "+%s"`
days_remaining=$((($expiration-$today)/(60*60*24)))

if [ $days_remaining -lt $trigger ]; then
	openssl req -new -days 730 -x509 -text -key $private_key -out $certificate -subj "/C=$Country/ST=$State/L=$Locality/O=$Org/CN=$CN"
	echo "Self-signed certificate has been renewed!"
	echo "Restarting httpd..."
	service httpd restart
	exit 0
else
	echo "Certificate valid for $days_remaining more days"
fi
