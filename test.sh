#!/bin/sh
echo "======================================"
echo "     Cloudflare Threat Score Test"
echo "  < https://lab.skk.moe/cf-threat/ >"
echo "======================================"

http_code=200
x=71
i=1

echo "Testing. It may takes about 30 seconds..."

while [ "$http_code" = "200" ]; do
    x=$[x-i]
    http_code=$(curl -o /dev/null -s -m 10 -w %{http_code} "https://cf-threat.sukkaw.com/collect.gif?threat=$x")
done

echo "======================================"
echo "Your threat score is "$x
echo "======================================"
