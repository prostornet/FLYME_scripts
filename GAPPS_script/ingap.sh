#!/system/bin/sh
#--------------------------------------------
#----- Installing gapps files to system -----
#-----  script by prostornet from 4pda  -----
#--------------------------------------------

PATH1=/storage/emulated/0/gfiles/
PATH2=/data/local/tmp/gfiles/
PATH3=/system/

FIND=/system/bin/find
CHMOD=/system/bin/chmod

echo "[..]"
echo "[1.] Checking mount ..."
mount -o rw,remount /system
if [ $? -ne 0 ]; then
    echo "!!! Attention !!! Unable to mount system to read|write"
    exit 0
fi
echo "[..]"
echo "[2.] Checking & moving gfiles ..."
if [ -d ${PATH1} ]; then
    mv ${PATH1} ${PATH2}
    if [ $? -ne 0 ]; then
        echo "!!! Attention !!! Unable to move files"
        exit 0
    fi
else
    echo "!!! Attention !!! No folder <gfiles> on sdcard"
    exit 0
fi
echo "[..]"
echo "[3.] Change permissions & copy to system ..."
${FIND} ${PATH2} -type f -exec ${CHMOD} 644 {} \;
${FIND} ${PATH2} -type d -exec ${CHMOD} 755 {} \;

for a in `ls -1 ${PATH2}`
do
        cp --preserve=m -r ${PATH2}${a} ${PATH3}
done
echo "[..]"
echo "[4.] Finish, reboot the system ..."
echo "[..]"
sleep 5
rm -r ${PATH2}
rm -f $0
reboot
exit 0