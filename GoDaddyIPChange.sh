#!/bin/bash          
domain='www.example.com'  # your domain
name='@' #name of the A record to update
key='Key' #key for godaddy developer API
secret='Secret' #Secret for godday developer API

headers='sso-key '$key':'$secret

current_ip="$(curl --silent --show-error --fail ipecho.net/plain)"
convertedCurrentIp=${current_ip//[-._]/}
echo "Current IP: $current_ip"
echo "Converted Current IP: $convertedCurrentIp"

godaddy_ip=$(curl -s -X GET "https://api.godaddy.com/v1/domains/$domain/records/A/$name" -H "Authorization: $headers" | jq -r '.[].data')
convertedGodaddyIp=${godaddy_ip//[-._]/}
echo "Godaddy IP: $godaddy_ip"
echo "Converted GoDaddy IP: $convertedGodaddyIp"

if [ $convertedCurrentIp -eq $convertedGodaddyIp ]; then

echo "ip addresses are the same"
else
	# Update A record
curl -X PUT "https://api.godaddy.com/v1/domains/$domain/records/A/$name" \
    -H "Authorization: $headers" \
    -H "Content-Type: application/json" \
    --data @- <<END;
{
	"ttl": 600,
    "data": "$current_ip"
}
END

fi