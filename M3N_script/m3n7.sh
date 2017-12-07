#!/system/bin/sh
########################
# Arrays with packages #
########################
#
#----- array with packages to be delete -----
apps_del=( com.sohu.inputmethod.sogou com.sankuai.meituan com.ss.android.article.news com.ximalaya.ting.android com.qzone com.jingdong.app.mall com.meizu.datamigration ctrip.android.view com.sina.weibo com.achievo.vipshop com.flyme.meizu.store com.baidu.BaiduMap.meizu com.meizu.datamigration )
#----- array with packages to be freeze -----
apps_freeze=( com.meizu.account.pay com.iflytek.speechsuite com.meizu.net.map com.meizu.flyme.wallet com.meizu.gamecenter.service com.svox.pico com.meizu.voiceassistant com.meizu.setup com.meizu.flyme.gamecenter com.meizu.media.life )
#----- array with system packages to be delete -----
apps_del_sys=( /system/app/Reader /system/priv-app/EBook /system/MzApp/Mall /system/priv-app/YellowPage )

#################
# Set main path #
#################
PATH1=/data/local/tmp/files/
PATH2=/system/

FIND=/system/bin/find
CHMOD=/system/bin/chmod

#################################
# Remount system for reed|write #
#################################
echo "[1.] Checking ..."
mount -o rw,remount /system
if [ $? -ne 0 ]; then
    echo "!!! Attention !!! Unable to mount system to read|write"
    exit 0
fi

############################
# Deleting chinese package #
############################
echo " "
echo "[2.] Deleting chinese apps ..."
for ad in "${apps_del[@]}"
do
    cmd package list packages | grep $ad 
    if [ $? -ne 0 ]; then
        echo "!!.d.!! App $ad is already deleted ..."
    else
        pm uninstall $ad
        echo "!!.d.!! Deleting app $ad ..."
    fi
done

###########################
# Freezing system package #
###########################
echo " "
echo "[3.] Feezing chinese apps ..."
for af in "${apps_freeze[@]}"
do
    cmd package list packages -e | grep $af
    if [ $? -ne 0 ]; then
        echo "!!.f.!! App $af is already freezed..."
    else
        pm disable $af
        echo "!!.f.!! Freezing app $af ..."
    fi
done

########################
# Deleting system apps #
########################
echo " "
echo "[4.] Deleting system apps ..."
for ads in "${apps_del_sys[@]}"
do
    if [ -d $ads ]; then
        rm -rf $ads
        echo "!!.d.!! Deleting system app $ads"
    fi
done

##############################
# Translate chinese firmware #
##############################
echo " "
echo "[5.] Translation firmware"

#----- Checking if folder exist & move it to tmp destination -----
if [ -d /storage/emulated/0/files ]; then
    mv /storage/emulated/0/files/ $PATH1
    if [ $? -ne 0 ]; then
        echo "!!! Attention !!! Unable to move files"
        exit 0
    fi
else
    echo "!!! Attention !!! No folder <files> on sdcard"
    exit 0
fi

#----- Change permissions for folders & files -----
for F in `${FIND} ${PATH1} -type f`
do
    ${CHMOD} 644 ${F}
done
for D in `${FIND} ${PATH1} -type d`
do
    ${CHMOD} 755 ${D}
done

#----- Copy folders & files -----
for n in `ls -1 /data/local/tmp/files/`
do
        cp --preserve=m -r ${PATH1}${n} ${PATH2}
done

rm -r ${PATH1}
rm -f $0
echo " "
echo "!!! Finish translation, reboot device..."
sleep 5
reboot


exit 0