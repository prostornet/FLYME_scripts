#!/system/bin/sh

##########################################
#   Script changing ID for Meizu M6Note  #
#      write by prostornet from 4pda     #
##########################################
set `id`
UC=$1
UR='uid=0(root)'
if [ ${UC} = ${UR} ]; then
    echo "."
    echo ". Root permision granted, BUT REMEMBER !!!"
    echo ". You should execute [su] twice for [uid=0]."
else
    echo "."
    echo "!!!! Error, you aren't root."
    echo "."
    exit 0
fi

ID=`dd if=/dev/block/mmcblk0p50 bs=1 skip=512 count=8 >/dev/null 2>&1`
if [  ${ID} -eq '72151002' ]; then
    echo "."
    echo ". Device with global [ID] - "${ID}
    echo ". Do you want to change it to chinese [ID]? (y/n)"
    read ANS
    if [ "${ANS}" = "y" ]; then
        echo ". Now we are changing to chinese [ID] ..."
        echo -e '\x30''\x31''\x30''\x30''\x31' | dd of=/dev/block/mmcblk0p50 bs=1 seek=515 count=5 >/dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo "."
            echo "!!!! Error during changing ID"
            echo "."
            exit 0
        else
        echo ". We are finished, now [ID] is set to chinese."
        echo ". Checking ..."
        echo "."
        cat /dev/block/mmcblk0p50
        fi
    elif [ "${ANS}" = "n" ]; then
        echo ". We aren't going change [ID]."
        echo "."
        exit 0
    else
        echo ". You have selected the wrong letter."
        echo "."
        exit 0
    fi
elif [ ${ID} -eq '72101001' ]; then
    echo "."
    echo ". Device with chinese [ID] - "${ID}
    echo ". Do you want to change it to global [ID]? (y/n)"
    read ANS
    if [ "${ANS}" = "y" ]; then
        echo ". Now we are changing to global [ID] ..."
        echo -e '\x35''\x31''\x30''\x30''\x32' | dd of=/dev/block/mmcblk0p50 bs=1 seek=515 count=5 >/dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo "."
            echo "!!!! Error during changing ID"
            echo "."
            exit 0
        else
        echo ". We are finished, now [ID] is set to global."
        echo ". Checking ..."
        echo "."
        cat /dev/block/mmcblk0p50
        fi
    elif [ "${ANS}" = "n" ]; then
        echo ". We aren't going change [ID]."
        echo "."
        exit 0
    else
        echo ". You have selected the wrong letter."
        echo "."
        exit 0
    fi
else
    echo "."
    echo ". Error checking [ID], finishing."
    echo "."
    exit 0
fi

# This line delete script from the system
#rm -f $0

# This line reboot the system to enable modification
reboot

exit 0
