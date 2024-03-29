#!/bin/sh

get_ips_v4() {
  for ip in $(curl --silent -X GET https://www.cloudflare.com/ips-v4); do
    printf "$ip,"
  done | sed 's/.$//'
}

get_ips_v6() {
  for ip in $(curl --silent -X GET https://www.cloudflare.com/ips-v6); do
    printf "$ip,"
  done | sed 's/.$//'
}

ips_v4=$(get_ips_v4)
ips_v6=$(get_ips_v6)

cat <<EOF
{
  "ips_v4": "$ips_v4",
  "ips_v6": "$ips_v6"
}
EOF
