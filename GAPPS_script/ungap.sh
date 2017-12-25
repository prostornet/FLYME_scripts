#!/system/TST/bin/sh
#--------------------------------------------
#----- Deleting gapps files from system -----
#-----  script by prostornet from 4pda  -----
#-----   installed by ingap.sh script   -----
#-----  remember only for pico package  -----
#--------------------------------------------


#------------------------------------------
#----- Array with gapps to be deleted -----
#------------------------------------------
gapps_del=( /system/app/GoogleTTS /system/app/GoogleExtShared /system/app/GoogleCalendarSyncAdapter /system/app/GoogleContactsSyncAdapter /system/etc/sysconfig/whitelist_com.android.omadm.service.xml /system/etc/sysconfig/google.xml /system/etc/sysconfig/google_build.xml /system/etc/sysconfig/framework-sysconfig.xml /system/etc/preferred-apps/google.xml /system/etc/permissions/com.google.widevine.software.drm.xml /system/etc/permissions/com.google.android.media.effects.xml /system/etc/permissions/com.google.android.maps.xml /system/etc/permissions/privapp-permissions-google.xml /system/etc/default-permissions/default-permissions.xml /system/etc/default-permissions/opengapps-permissions.xml /system/framework/com.google.android.maps.jar /system/framework/com.google.android.media.effects.jar /system/framework/com.google.widevine.software.drm.jar /system/lib64/libgoogle-ocrclient-v3.so /system/lib64/libjni_latinimegoogle.so /system/priv-app/GmsCoreSetupPrebuilt /system/priv-app/GoogleLoginService /system/priv-app/Phonesky /system/priv-app/GoogleServicesFramework /system/priv-app/GoogleOneTimeInitializer /system/priv-app/GoogleBackupTransport /system/priv-app/GoogleFeedback /system/priv-app/GoogleExtServices /system/priv-app/PrebuiltGmsCore /system/priv-app/SetupWizard /system/priv-app/GooglePartnerSetup /system/priv-app/ConfigUpdater )

#---------------------------------------------
#----- Remount system/TST for reed|write -----
#---------------------------------------------
echo "[..]"
echo "[1.] Checking permission read|write system ..."
mount -o rw,remount /system
if [ $? -ne 0 ]; then
    echo "!!! Attention !!! Unable to mount system to read|write"
    exit 0
fi

#------------------------------------
#----- Deleting chinese package -----
#------------------------------------
echo "[..]"
echo "[2.] Deleting gapps files from system ..."
for I in "${gapps_del[@]}"
do
    if [ -d $I ]|[ -f $I ]; then
        rm -rf $I
        echo "[del] Deleting gapps files $I"
    fi
done

rm -f $0
echo "[..]"
echo "[3.] Finish deleting gapps files from system, reboot device..."
echo "[..]"
sleep 5
reboot

exit 0
