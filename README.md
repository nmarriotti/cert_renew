# Automated Renewal of Self-Signed Certificates  
**Usage**  
```
./cert_renew.sh /path/to/privatekey /path/to/x509 trigger
```  
The expiration date is checked regularly and based on a days remaining calculation, a new certificate is generated using DN information specified within cert_vars.sh  

## Trigger
The trigger is a value passed in that is used to determine when a new certificate should be generated. The default value is 14 days out from the current certificates expiration date.  

## Example ##
![image](https://drive.google.com/file/d/1Ggvt7fKkqdCBpgg1TT0aNLywnwOGsOFU/view?usp=sharing)  
![image](https://drive.google.com/file/d/1sFNdpew11x2NvhER9b328CDbpSQDT2sJ/view?usp=sharing)  
![image](https://drive.google.com/file/d/1KK0aqhWrsAzmw-a3FQpbU695pwWZCYcF/view?usp=sharing)  
![image](https://drive.google.com/file/d/13uFVKGWGQbCr5mhM0BLJHA2dvZwVHYL9/view?usp=sharing)  
