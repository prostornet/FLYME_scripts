#!/system/bin/sh

##########################################
#   Script changing ID for Meizu M6Note  #
#     written by prostornet from 4pda    #
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

ID=`dd if=/dev/block/mmcblk0p50 bs=1 skip=512 count=8 2>/dev/null`
if [  "${ID}" = "72151002" ]; then
    echo "."
    echo ". Device with global [ID] - "${ID}
    echo ". Do you want to change it to chinese [ID]? (y/n)"
    read ANS
    if [ "${ANS}" = "y" ]; then
        echo ". For changing [ID] to chinese 72101001 input [1]"
        echo ". For changing [ID] to chinese 72101002 input [2]"
        echo ". For changing [ID] to chinese 72121001 input [3]"
        echo ". For changing [ID] to chinese 72101003 input [4]"
        read NUM
        if [ "${NUM}" = "1" ]; then
        echo ". Now we are changing to chinese [ID] 72101001 ..."
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
        elif [ "${NUM}" = "2" ]; then
        echo ". Now we are changing to chinese [ID] 72101002 ..."
        echo -e '\x30''\x31''\x30''\x30''\x32' | dd of=/dev/block/mmcblk0p50 bs=1 seek=515 count=5 >/dev/null 2>&1
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
        elif [ "${NUM}" = "3" ]; then
        echo ". Now we are changing to chinese [ID] 72121001 ..."
        echo -e '\x32''\x31''\x30''\x30''\x31' | dd of=/dev/block/mmcblk0p50 bs=1 seek=515 count=5 >/dev/null 2>&1
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
        elif [ "${NUM}" = "4" ]; then
        echo ". Now we are changing to chinese [ID] 72121001 ..."
        echo -e '\x30''\x31''\x30''\x30''\x33' | dd of=/dev/block/mmcblk0p50 bs=1 seek=515 count=5 >/dev/null 2>&1
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
        else
            echo ". You have selected the wrong number."
            echo "."
            exit 0
        fi
    elif [ "${ANS}" = "n" ]; then
        echo ". We aren't going change [ID]."
        echo "."
        # This line delete script from the system
        rm -f $0
        exit 0
    else
        echo ". You have selected the wrong letter."
        echo "."
        exit 0
    fi
elif [ "${ID}" = "72101001" ]; then
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
        # This line delete script from the system
        rm -f $0
        exit 0
    else
        echo ". You have selected the wrong letter."
        echo "."
        exit 0
    fi
elif [ "${ID}" = "72101002" ]; then
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
        # This line delete script from the system
        rm -f $0
        exit 0
    else
        echo ". You have selected the wrong letter."
        echo "."
        exit 0
    fi
elif [ "${ID}" = "72121001" ]; then
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
        # This line delete script from the system
        rm -f $0
        exit 0
    else
        echo ". You have selected the wrong letter."
        echo "."
        exit 0
    fi
elif [ "${ID}" = "72101003" ]; then
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
        # This line delete script from the system
        rm -f $0
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
rm -f $0

# This line reboot the system to enable modification
reboot

exit 0
