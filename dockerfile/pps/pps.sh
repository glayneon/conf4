#!/bin/bash

DEVFL='/proc/net/dev'
TARGETIF="${IFACE:-eth0}"

TX1=$(grep $TARGETIF $DEVFL | awk '{ print $11}')
RX1=$(grep $TARGETIF $DEVFL | awk '{ print $3}')

echo -e "DATETIME\t\tTX\tRX"
while true;
do
       sleep 1
       TX2=$(grep $TARGETIF $DEVFL | awk '{ print $11}')
       RX2=$(grep $TARGETIF $DEVFL | awk '{ print $3}')
       TX_DIFF=$(($TX2 - $TX1))
       RX_DIFF=$(($RX2 - $RX1))
       NOW=$(date +%Y-%m-%d\ %H:%M:%S)
       echo -e "$NOW\t$TX_DIFF\t$RX_DIFF"
       TX1=$TX2
       RX1=$RX2
done
