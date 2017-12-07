#!/system/bin/sh


#Checking root permisions granted
set `id`
UC=$1
UR='uid=0(root)'
if [ ${UC} = ${UR} ]; then
    echo "."
    echo ". Root permision granted ..."
    echo "."

L_D=`dd if=/dev/block/mmcblk0p28 bs=1 skip=517 count=1 2>/dev/null`
L_ID=`dd if=/dev/block/mmcblk0p28 bs=1 skip=514 count=8 2>/dev/null`
M_4D=`dd if=/dev/block/mmcblk0p28 bs=1 skip=525315 count=1 2>/dev/null`
M_8D=`dd if=/dev/block/mmcblk0p28 bs=1 skip=525319 count=1 2>/dev/null`
M_ID=`dd if=/dev/block/mmcblk0p28 bs=1 skip=525312 count=8 2>/dev/null`

 if [ ! -z "${L_ID}" -a -z "${M_ID}" ]; then
  echo ". This is M3Note model L681, with ID-"${L3N_ID}
  echo ". You could install only firmware with index G"
  echo ". Do not use any firmware version below 5.1.3.2G"
  echo ". Downgrade only through Beta ID, but at your own risk !!!"
  echo "."
  exit 0
 elif [ -z "${L_ID}" -a ! -z "${M_ID}" ]; then
  echo "---------------- MENU ---------------------"
  echo "| Check devices ID, input - 1             |"
  echo "| Change devices ID to global, input - 2  |"
  echo "| Change devices ID to chinese, input - 3 |"
  echo "| Reboot to recovery, input - 4           |"
  echo "| Reboot device, input - 5                |"
  echo "| Exit, input - 6                         |"
  read CH_D
  echo "-------------------------------------------"
    if [ "${CH_D}" -eq "1" ]; then
	M3N_ID=`dd if=/dev/block/mmcblk0p28 bs=1 skip=525312 count=8 2>/dev/null`
        if [ "${M3N_ID}" -eq "68151001" ]; then
	    echo ""
	    echo "Device with internationl ID - "${M3N_ID}
	    echo "You can install firmware with index [G],[A]"
	    echo ""
	elif [ "${M3N_ID}" -eq "68101006" ]; then
	    echo ""
	    echo "Device with chinese ID - "${M3N_ID}
	    echo "You can install only firmware with index [A]"
	    echo "You can change for global ID and install firmware 5.1.11.0G or greater."
	    echo ""
	elif [ "${M3N_ID}" -eq "68101001" ]; then
	    echo ""
	    echo "Device with chinese ID - "${M3N_ID}
	    echo "You can install only firmware with index [A]"
	    echo "You can change for global ID and install firmware 5.1.11.0G or greater."
	    echo ""
	elif [ "${M3N_ID}" -eq "68101002" ]; then
	    echo ""
	    echo "Device with chinese ID - "${M3N_ID}
	    echo "You can install only firmware with index [A]"
	    echo "You can change for global ID and install firmware 5.1.11.0G or greater."
	    echo ""
	elif [ "${M3N_ID}" -eq "68101003" ]; then
	    echo ""
	    echo "Device with chinese ID - "${M3N_ID}
	    echo "You can install only firmware with index [A]"
	    echo "You can change for global ID and install firmware 5.1.11.0G or greater."
	    echo ""
	elif [ "${M3N_ID}" -eq "68101005" ]; then
	    echo ""
	    echo "Device with chinese ID - "${M3N_ID}
	    echo "You can install only firmware with index [A]"
	    echo "You can change for global ID and install firmware 5.1.11.0G or greater."
	    echo ""
	elif [ "${M3N_ID}" -eq "68151001" ]; then
	    echo ""
	    echo "Device with chinese ID - "${M3N_ID}
	    echo "You can install only firmware with index [A]"
	    echo "You can change for global ID and install firmware 5.1.11.0G or greater."
	    echo ""
	elif [ "${M3N_ID}" -eq "68151002" ]; then
	    echo ""
	    echo "Device with chinese ID - "${M3N_ID}
	    echo "You can install only firmware with index [A]"
	    echo "You can change for global ID and install firmware 5.1.11.0G or greater."
	    echo ""
	elif [ "${M3N_ID}" -eq "68151003" ]; then
	    echo ""
	    echo "Device with chinese ID - "${M3N_ID}
	    echo "You can install only firmware with index [A]"
	    echo "You can change for global ID and install firmware 5.1.11.0G or greater."
	    echo ""
        elif [ "${M3N_ID}" -eq "68151006" ]; then
	    echo ""
	    echo "Device with chinese ID - "${M3N_ID}
	    echo "You can install only firmware with index [A]"
	    echo "You can change for global ID and install firmware 5.1.11.0G or greater."
	    echo ""
	elif [ "${M3N_ID}" -eq "68161006" ]; then
	    echo ""
	    echo "Device with chinese ID - "${M3N_ID}
	    echo "You can install only firmware with index [A]"
	    echo "You can change for global ID and install firmware 5.1.11.0G or greater."
	    echo ""
	elif [ "${M3N_ID}" -eq "68161001" ]; then
	    echo ""
	    echo "Device with chinese ID - "${M3N_ID}
	    echo "You can install only firmware with index [A]"
	    echo "You can change for global ID and install firmware 5.1.11.0G or greater."
	    echo ""
	elif [ "${M3N_ID}" -eq "68100000" ]; then
	    echo ""
	    echo "Device with beta ID - "${M3N_ID}
	    echo "Attantion!!! Be careful with this ID."
	    echo ""
	else
	    echo ""
	    echo "What the f.ck is this. ID - "${M3N_ID}
	    echo ""
	fi
    sh ./$0
    elif [ "${CH_D}" -eq "2" ]; then
	echo ""
	echo "Changing ID for global in progress ..."
	echo -e '\x35''\x31''\x30''\x30''\x31' | dd of=/dev/block/mmcblk0 bs=1 seek=797443075 count=5 2>/dev/null
	echo "We are finished. Please check your ID by choosing 1."
	echo "If everything is OK then REBOOT by choosing 5 or EXIT by choosing 6."
	echo ""
	sh ./$0
    elif [ "${CH_D}" -eq "3" ]; then
	echo ""
	echo "---------- Select chinese ID -----------"
	echo "Change ID to chinese 68101001, input - 1"
	echo "Change ID to chinese 68101002, input - 2"
	echo "Change ID to chinese 68101003, input - 3"
	echo "Change ID to chinese 68101005, input - 5"
	echo "Change ID to chinese 68101006, input - 6"
	echo "Change ID to chinese 68151001, input - 51"
	echo "Change ID to chinese 68151002, input - 52"
	echo "Change ID to chinese 68151003, input - 53"
	echo "Change ID to chinese 68151006, input - 56"
	echo "Change ID to chinese 68161001, input - 61"
	echo "Change ID to chinese 68161006, input - 66"
	read CHI
	echo "----------------------------------------"
	if [ "${CHI}" -eq "6" ]; then
	    echo ""
	    echo "Changing ID for chinese 68101006 in progress ..."
	    echo -e '\x30''\x31''\x30''\x30''\x36' | dd of=/dev/block/mmcblk0 bs=1 seek=797443075 count=5 2>/dev/null
	    echo "We are finished. Please check your ID by choosing 1."
	    echo "If everything is OK then REBOOT by choosing 5 or EXIT by choosing 6."
	    echo ""
	    sh ./$0
	elif [ "${CHI}" -eq "5" ]; then
	    echo ""
	    echo "Changing ID for chinese 68101005 in progress ..."
	    echo -e '\x30''\x31''\x30''\x30''\x35' | dd of=/dev/block/mmcblk0 bs=1 seek=797443075 count=5 2>/dev/null
	    echo "We are finished. Please check your ID by choosing 1."
	    echo "If everything is OK then REBOOT by choosing 5 or EXIT by choosing 6."
	    echo ""
	    sh ./$0
	elif [ "${CHI}" -eq "3" ]; then
	    echo ""
	    echo "Changing ID for chinese 68101003 in progress ..."
	    echo -e '\x30''\x31''\x30''\x30''\x33' | dd of=/dev/block/mmcblk0 bs=1 seek=797443075 count=5 2>/dev/null
	    echo "We are finished. Please check your ID by choosing 1."
	    echo "If everything is OK then REBOOT by choosing 5 or EXIT by choosing 6."
	    echo ""
	    sh ./$0
	elif [ "${CHI}" -eq "2" ];then
	    echo ""
	    echo "Changing ID for chinese 68101002 in progress ..."
	    echo -e '\x30''\x31''\x30''\x30''\x32' | dd of=/dev/block/mmcblk0 bs=1 seek=797443075 count=5 2>/dev/null
	    echo "We are finished. Please check your ID by choosing 1."
	    echo "If everything is OK then REBOOT by choosing 5 or EXIT by choosing 6."
	    echo ""
	    sh ./$0
	elif [ "${CHI}" -eq "1" ];then
	    echo ""
	    echo "Changing ID for chinese 68101001 in progress ..."
	    echo -e '\x30''\x31''\x30''\x30''\x31' | dd of=/dev/block/mmcblk0 bs=1 seek=797443075 count=5 2>/dev/null
	    echo "We are finished. Please check your ID by choosing 1."
	    echo "If everything is OK then REBOOT by choosing 5 or EXIT by choosing 6."
	    echo ""
	    sh ./$0
	elif [ "${CHI}" -eq "51" ];then
	    echo ""
	    echo "Changing ID for chinese 68151001 in progress ..."
	    echo -e '\x35''\x31''\x30''\x30''\x31' | dd of=/dev/block/mmcblk0 bs=1 seek=797443075 count=5 2>/dev/null
	    echo "We are finished. Please check your ID by choosing 1."
	    echo "If everything is OK then REBOOT by choosing 5 or EXIT by choosing 6."
	    echo ""
	    sh ./$0
	elif [ "${CHI}" -eq "52" ];then
	    echo ""
	    echo "Changing ID for chinese 6815102 in progress ..."
	    echo -e '\x35''\x31''\x30''\x30''\x32' | dd of=/dev/block/mmcblk0 bs=1 seek=797443075 count=5 2>/dev/null
	    echo "We are finished. Please check your ID by choosing 1."
	    echo "If everything is OK then REBOOT by choosing 5 or EXIT by choosing 6."
	    echo ""
	    sh ./$0
	elif [ "${CHI}" -eq "53" ];then
	    echo ""
	    echo "Changing ID for chinese 68151003 in progress ..."
	    echo -e '\x35''\x31''\x30''\x30''\x33' | dd of=/dev/block/mmcblk0 bs=1 seek=797443075 count=5 2>/dev/null
	    echo "We are finished. Please check your ID by choosing 1."
	    echo "If everything is OK then REBOOT by choosing 5 or EXIT by choosing 6."
	    echo ""
	    sh ./$0
	elif [ "${CHI}" -eq "56" ];then
	    echo ""
	    echo "Changing ID for chinese 68151006 in progress ..."
	    echo -e '\x35''\x31''\x30''\x30''\x36' | dd of=/dev/block/mmcblk0 bs=1 seek=797443075 count=5 2>/dev/null
	    echo "We are finished. Please check your ID by choosing 1."
	    echo "If everything is OK then REBOOT by choosing 5 or EXIT by choosing 6."
	    echo ""
	    sh ./$0
	elif [ "${CHI}" -eq "61" ];then
	    echo ""
	    echo "Changing ID for chinese 68161001 in progress ..."
	    echo -e '\x36''\x31''\x30''\x30''\x31' | dd of=/dev/block/mmcblk0 bs=1 seek=797443075 count=5 2>/dev/null
	    echo "We are finished. Please check your ID by choosing 1."
	    echo "If everything is OK then REBOOT by choosing 5 or EXIT by choosing 6."
	    echo ""
	    sh ./$0
	elif [ "${CHI}" -eq "63" ];then
	    echo ""
	    echo "Changing ID for chinese 68161003 in progress ..."
	    echo -e '\x36''\x31''\x30''\x30''\x33' | dd of=/dev/block/mmcblk0 bs=1 seek=797443075 count=5 2>/dev/null
	    echo "We are finished. Please check your ID by choosing 1."
	    echo "If everything is OK then REBOOT by choosing 5 or EXIT by choosing 6."
	    echo ""
	    sh ./$0
	else
	    echo ""
	    echo "You input wrong number. Try again."
	    echo ""
	    sh ./$0
	fi
    elif [ "${CH_D}" -eq "4" ]; then
	echo ""
	echo "Rebooting device to recovery"
	reboot recovery
    elif [ "${CH_D}" -eq "5" ]; then
	echo ""
	echo "Rebooting device"
	reboot
    elif [ "${CH_D}" -eq "6" ]; then
	exit 0
    else
	echo ""
	echo "You input wrong number. Try again."
	echo ""
	sh ./$0
    fi
 else
  echo "Something wrong..."
 fi
else
    echo "."
    echo ". Root permisions not granted ..."
    echo ". Check if you execute su command, if Yes then,"
    echo ". Check do you install SuperSU & grant permisions for terminal."
    echo "."
fi

exit 0
