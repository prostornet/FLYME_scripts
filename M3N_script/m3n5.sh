#!/system/bin/sh
#set -e

# make system partition writeable
if ! mount -o remount,rw /system ; then
    echo "error remounting system, maybe you are not root?"
    exit 1
fi

echo "Installing Russian locale on chinese firmware"
echo "for MEIZU M3 Note (Flyme OS 5.1.X.0A)"
echo "author prostornet"
echo " "
echo " "
echo "Deleting chines app: Dianping, Reader, JD, VipShop and etc ..."
echo " "
pm uninstall com.sohu.inputmethod.sogou
pm uninstall com.sankuai.meituan
pm uninstall com.ss.android.article.news
pm uninstall com.ximalaya.ting.android
pm uninstall com.qzone
pm uninstall com.jingdong.app.mall
pm uninstall ctrip.android.view
pm uninstall com.sina.weibo
pm uninstall com.achievo.vipshop
echo " "
echo "Deleting app: Painter, Weather stock, Map, Reader & EBook ..."
echo " "
rm -rf /system/app/Painter
rm -rf /system/app/Weather
rm -rf /system/app/Reader
rm -rf /system/priv-app/EBook
echo "... finish deleting app."
echo " "
echo "Freezing system app ..."
echo " "
pm disable com.flyme.roamingpay
pm disable com.meizu.account.pay
pm disable com.iflytek.speechsuite
pm disable com.meizu.mzsimcontacts
pm disable com.aliyun.ams.tyid
pm disable com.meizu.flyme.wallet
pm disable com.android.stk
pm disable com.meizu.mpay
pm disable com.android.printspooler
pm disable com.meizu.gamecenter.service
pm disable com.meizu.net.o2oservice
pm disable com.svox.pico
pm disable com.meizu.voiceassistant
pm disable com.meizu.setup
pm disable com.mediatek.lbs.em2.ui
pm disable com.meizu.flyme.gamecenter
pm disable com.amap.android.location
pm disable com.meizu.media.life
pm disable com.meizu.net.map
pm disable com.meizu.flyme.wallet
echo "...finish freezing app."
echo " "
echo "Translation Chinese firmware into Russian ..."
echo " "
cp -r /sdcard/files/priv-app/* /system/priv-app
cp -r /sdcard/files/app/* /system/app
cp -r /sdcard/files/framework/* /system/framework
cp -r /sdcard/files/build.prop /system
echo "Setting the correct permissions to the app ..."
echo " "
chmod 644 /system/priv-app/*/*.apk
chmod 644 /system/app/*/*.apk
chmod 644 /system/framework/framework-res.apk
chmod 644 /system/framework/flyme-res/flyme-res.apk
chmod 644 /system/framework/mediatek-res/mediatek-res.apk
chmod 644 /system/build.prop
echo "... finishing translation, don`t forget to delete files from sdcard."
echo " "
echo "The system is going to REBOOT."

reboot

exit 0
