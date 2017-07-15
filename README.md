# scripts

Collection of scripts I use for personal use.

# Getting Started

Currently, there is only one script, but I will add more as I continue to create more.

GoDaddyIPChange.sh - Checks the IP on ipecho.net, and compares it to the IP address GoDaddy has for a given record.

## Prerequisites

**GoDaddyIPChange.sh** - cURL and jq

```
sudo apt-get update
sudo apt-get install curl
sudo apt-get install jq
```

## Configuration

**GoDaddyIPChange.sh** - Add your domain, name of A record, GoDaddy API Key, and Godaddy API Secret. 

Copy the script to any location on your linux machine. I currently have mine setup to use cron to run the script every 5 minutes. Below is an example of how I set mine up. It also logs to a the file godaddylog.log

```
crontab -e
*/5 * * * * /home/travis/Documents/godaddy.sh > /home/travis/Documents/godaddylog.log 2>&1
```

## Authors

* **Me me and me**