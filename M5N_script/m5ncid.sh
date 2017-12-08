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
#    D_ID=`dd if=/dev/block/mmcblk0p28 bs=1 skip=512 count=8 2>/dev/null`
    D_ID=`dd if=/dev/block/mmcblk0 bs=1 skip=813695488 count=8 2>/dev/null`
    if [ ${D_ID} -eq "62101001" ]; then
	echo ". This is chinese ID - "${D_ID}
	echo ". You can install only firmware with index A"
	echo "."
    elif [ ${D_ID} -eq "62151001" ]; then
	echo ". This is global ID - "${D_ID}
	echo ". You can install firmware with index A & G"
	echo "."
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