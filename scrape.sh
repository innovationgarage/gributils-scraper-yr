#! /bin/bash

while true; do
  DATE="$(date --iso-8601=seconds -u)"

  while read area content; do
    echo "Downloading ${content} for ${area}..."
    curl -X POST "${INDEXURL}/index/add?parametermap=yr&extra=%7B%22source%22%3A%22yr%22%2C%22yr_area%22%3A%22${area}%22%2C%22yr_content%22%3A%22${content}%22%7D" --data-binary @<(curl --location "http://api.met.no/weatherapi/gribfiles/1.1/?area=${area};content=${content}")

    sleep 1
  done <<EOF
skagerrak current
oslofjord current
sorlandet current
west_norway current
n-northsea current
nordland current
troms-finnmark current
skagerrak weather
oslofjord weather
sorlandet weather
west_norway weather
n-northsea weather
nordland weather
troms-finnmark weather
skagerrak waves
oslofjord waves
sorlandet waves
west_norway waves
n-northsea waves
nordland waves
troms-finnmark waves
EOF
  
  now="$(date +%s)"
  nextScrape="$((($now / (3600*4) + 1) * 3600*4))"
  waitTime="$(($nextScrape - $now))"
  sleep "$waitTime"
done
