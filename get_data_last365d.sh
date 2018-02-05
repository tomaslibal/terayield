#!/usr/bin/env bash

PRICE_CSV_URL="https://api.blockchain.info/charts/market-price?format=csv"
HASHRATE_CSV_URL="https://api.blockchain.info/charts/hash-rate?format=csv"

curl $PRICE_CSV_URL -o price.csv.tmp
curl $HASHRATE_CSV_URL -o hashrate.csv.tmp

cat price.csv.tmp | cut -d',' -f 2 > price.csv
cat hashrate.csv.tmp | cut -d',' -f 2 > hashrate.csv

rm price.csv.tmp
rm hashrate.csv.tmp
