#!/bin/sh
echo ""
echo "Changing ID for Global in progress ..."
echo -e '\x35''\x31''\x30''\x30''\x32' | dd of=/dev/block/mmcblk0p28 bs=1 seek=515 count=5 2>/dev/null
echo "We are finished."
echo "Checking ..."
cat /dev/block/mmcblk0p28
echo ""

exit 0