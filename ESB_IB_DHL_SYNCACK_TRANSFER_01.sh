#!/bin/sh
# Script name: ESB_IB_DHL_SYNCACK_TRANSFER_01.sh
# Description: this script runs from ESP scheduler Job name RTEKDC2P
# Author name: Mary Theresa 
# initial implementation date: 14 May 2017
# Change implementation:Script to remove duplicates from Venda version of the Size varient DHLRP feed
# Change implementation date: 5 July 2018
# Change implementation:Script modified to handle multiple file pickup and change of name as Venda no more exists.


echo "*************  Script start DHLRP to ESB ESB_IB_DHL_SYNCACK_TRANSFER_01.sh ESB Job name RTEKDC2P ******" >> /v/SYNCITEM/ESB_IB_DHL_SYNCACK_TRANSFER_01.log
hostname >> /v/SYNCITEM/ESB_IB_DHL_SYNCACK_TRANSFER_01.log
date >> /v/SYNCITEM/ESB_IB_DHL_SYNCACK_TRANSFER_01.log

SyncAckSourceFolder="/v/SYNCITEM/product_update"
SyncAckInboundFolder="/v/SYNCITEM/product_update"
SyncAckInboundFile="product_update*.psv"


cd $SyncAckSourceFolder
if [ -f ${SyncAckInboundFile[1]} ];
 then

for f in "$SyncAckInboundFile"; do
fileNameNoPath='basename $f'
 
awk '!seen[$0]++' $f > $SyncAckInboundFolder/fileNameNoPath.txt



 
echo "File Transfer Successful, Exiting.  return code of the script " $? >> /v/SYNCITEM/ESB_IB_DHL_SYNCACK_TRANSFER_01.log

done
rm $f
exit $?

else

	echo "There are no files to transfer at this time under /v/SYNCITEM*.  Script exiting " >> /v/SYNCITEM/ESB_IB_DHL_SYNCACK_TRANSFER_01.log
	date >> /v/SYNCITEM/ESB_IB_DHL_SYNCACK_TRANSFER_01.log
	echo "*************  Script end  DHLRP to HYBRIS ESB_IB_DHL_SYNCACK_TRANSFER_01.sh ********* " >> /v/SYNCITEM/ESB_IB_DHL_SYNCACK_TRANSFER_01.log
	exit 0
 

   fi



