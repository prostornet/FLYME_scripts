#!/system/bin/sh

#Checking root permisions granted
set `id`
UC=$1
UR='uid=0(root)'
if [ ${UC} = ${UR} ]; then
    echo "."
    echo ". Root permision granted ..."
    echo ". Checking ID ..."
    echo "."
    D_ID=`dd if=/dev/block/mmcblk0 bs=1 skip=813695488 count=8 2>/dev/null`
    if [ ${D_ID} -eq "62101001" ]; then
	echo ". This is chinese ID - "${D_ID}
	echo ". You can install only firmware with index A"
	echo "."
	echo ". Do you whant to change ID for global (type y/n):"
	read UG_CH
	if [ ${UG_CH} = "y" ]; then
	    echo ". OK, changing ID is in process ..."
	    echo -e '\x35' | dd of=/dev/block/mmcblk0 bs=1 seek=813695491 count=1 2>/dev/null
	    echo ". We finished."
	    echo ". Checking ID one more time ..."
	    ND_ID=`dd if=/dev/block/mmcblk0 bs=1 skip=813695488 count=8 2>/dev/null`
	    if [ ${ND_ID} -eq "62151001" ]; then
		echo ". OK, now you have global ID - "${ND_ID}
		echo ". You can install firmware with index A & G"
		echo ". Bye"
	    else
		echo ". Something wrong, the ID is still - "${ND_ID}
	    fi
	    echo "."
	elif [ ${UG_CH} = "n" ]; then
	    echo ". OK, we live chinese ID."
	    echo ". You can install only firmware with index A"
	    echo ". Bye"
	    echo "."
	else
	    echo ". You set the wrong letter, we live all as is."
	    echo ". Bye"
	    echo "."
	fi
    elif [ ${D_ID} -eq "62151001" ]; then
	echo ". This is global ID - "${D_ID}
	echo ". You can install firmware with index A & G"
	echo "."
	echo ". Do you whant to change ID for chinese (type y/n):"
	read UC_CH
	if [ ${UC_CH} = "y" ]; then
	    echo ". OK, changing ID is in process ..."
	    echo -e '\x30' | dd of=/dev/block/mmcblk0 bs=1 seek=813695491 count=1 2>/dev/null
	    echo ". We finished."
	    echo ". Checking ID one more time ..."
	    ND_ID=`dd if=/dev/block/mmcblk0 bs=1 skip=813695488 count=8 2>/dev/null`
	    if [ ${ND_ID} -eq "62101001" ]; then
		echo ". OK, now you have chinese ID - "${ND_ID}
		echo ". You can install only firmware with index A"
		echo ". Bye"
	    else
		echo ". Something wrong, the ID is still - "${ND_ID}
	    fi
	    echo "."
	elif [ ${UC_CH} = "n" ]; then
	    echo ". OK, we live chinese ID."
	    echo ". You can install only firmware with index A"
	    echo ". Bye"
	    echo "."
	else
	    echo ". You set the wrong letter, we live all as is."
	    echo ". Bye"
	    echo "."
	fi
    else
	echo ". Something wrong or new ..."
	echo "."
    fi
else
    echo "."
    echo ". Root permisions not granted ..."
    echo ". Check if you execute su command, if Yes then,"
    echo ". Check do you install SuperSU & grant permisions for terminal."
    echo "."
fi

exit 0