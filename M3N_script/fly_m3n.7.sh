#!/bin/bash
# Set colors for  script.
BLU1=$'\033[36m'
NC1=$'\033[0m'
RED='\033[31m'
WHITE='\033[37m'
NC='\033[0m'

TMP_FILE1=$(mktemp)

##################################
###  Check for SU and BusyBox  ###
##################################
CHK_SU() {
echo ""
echo -e "${WHITE}. Проверка рут прав:${NC}"
echo  ""
echo -e "Если в списке ниже вы видите ${RED}su${NC}, значит все впорядке, рут права предоставлены."
echo ""
adb shell su c ls -1 /system/xbin
echo -e "${WHITE}...${NC}\n"
sh $0
}
###############################
###  Deleting chinese apps  ###
###############################
RMAPP_CHN() {
echo ""
echo -e "${WHITE}. Удаление китайского софта:${NC}"
echo ""
adb kill-server >/dev/null 2>&1
adb start-server >/dev/null 2>&1
echo "Удаление приложений из /custom/3rd-party ..."
echo "Удаление приложений китайских приложений Painter, Weather, Map, Reader, EBook, Sogou и т.д."

while read line; do
    adb uninstall ${line}
    echo -e "${RED}!!! Удаление приложения${NC} ${WHITE}${line}${NC} ${RED}завершино !!!${NC}"
done < files/sys_app/del.txt

adb shell su c mount -o rw,remount /system >/dev/null 2>&1
#adb shell su c rm -r /system/app/Weather >/dev/null 2>&1
adb shell su c rm -r /system/app/Reader >/dev/null 2>&1
adb shell su c rm -r /system/priv-app/EBook >/dev/null 2>&1
adb shell su c rm -r /system/MzApp/Mall >/dev/null 2>&1

echo -e "${RED}!!! Удаление завершино !!!${NC} Перезагрузка устройства ..."
adb reboot
echo -e "${WHITE}...${NC}\n"
sh $0
}
###############################
###  Disabled chinese apps  ###
###############################
PMAPP_CHN() {
echo ""
echo -e "${WHIRE}. Заморозка стокового софта:${NC}"
echo ""
adb kill-server >/dev/null 2>&1
adb start-server >/dev/null 2>&1
echo "Заморозка системных приложений ..."

while read line; do
    adb shell su c pm disable ${line}
    echo -e "${RED}!!! Заморозка приложения${NC} ${WHITE}${line}${NC} ${RED}завершино !!!${NC}"
done < files/sys_app/freeze.txt

echo -e "${RED}!!! Заморозка завершина !!!${NC} Перезагрузка устройства (нет) ..."
#adb reboot
echo -e "${WHITE}...${NC}\n"
sh $0
}
####################################
###  Translate chinese firmware  ###
####################################
INST_RUS() {
echo ""
echo -e "${WHITE}. Перевод китайской прошивки:${NC}"
echo ""
echo "Подсоединение к устройству ..."
echo ""
adb kill-server >/dev/null 2>&1
adb start-server >/dev/null 2>&1
echo "Копирование файлов в /tmp ..."
echo ""
adb push files/priv-app /data/local/tmp/priv-app #>/dev/null 2>&1
adb push files/app /data/local/tmp/app #>/dev/null 2>&1
adb push files/framework /data/local/tmp/framework #>/dev/null 2>&1
adb push vendor/framework /data/local/tmp/vendor/framework #>/dev/null 2>&1
adb push vendor/app /data/local/tmp/vendor/app #>/dev/null 2>&1
adb push files/build.prop /data/local/tmp/ #>/dev/null 2>&1
echo "Установка разрешений ..."
echo ""
adb shell "su c chmod 644 /data/local/tmp/priv-app/*/*.apk" #>/dev/null 2>&1
adb shell "su c chmod 644 /data/local/tmp/app/*/*.apk" #>/dev/null 2>&1
adb shell "su c chmod 644 /data/local/tmp/framework/*/*.apk" #>/dev/null 2>&1
adb shell "su c chmod 644 /data/local/tmp/framework/*.apk" #>/dev/null 2>&1
adb shell "su c chmod 644 /data/local/tmp/vendor/framework/*/*.apk" #>/dev/null 2>&1
adb shell "su c chmod 644 /data/local/tmp/vendor/app/*/*.apk" #>/dev/null 2>&1
adb shell "su c chmod 644 /data/local/tmp/build.prop" #>/dev/null 2>&1
echo "Перенос приложений в /system ..."
echo ""
adb shell "su c mount -o rw,remount /system" #>/dev/null 2>&1
adb shell "su c cp -r /data/local/tmp/priv-app/* /system/priv-app" #>/dev/null 2>&1
adb shell "su c cp -r /data/local/tmp/app/* /system/app" #>/dev/null 2>&1
adb shell "su c cp -r /data/local/tmp/framework/* /system/framework" #>/dev/null 2>&1
adb shell "su c cp -r /data/local/tmp/vendor/framework/* /vendor/framework" #>/dev/null 2>&1
adb shell "su c cp -r /data/local/tmp/vendor/app/* /vendor/app" #>/dev/null 2>&1
adb shell "su c cp -r /data/local/tmp/build.prop /system" #>/dev/null 2>&1
echo "Очистка папки /tmp ..."
echo ""
adb shell "rm -r /data/local/tmp/priv-app" #>/dev/null 2>&1
adb shell "rm -r /data/local/tmp/app" #>/dev/null 2>&1
adb shell "rm -r /data/local/tmp/framework" #>/dev/null 2>&1
adb shell "rm -r /data/local/tmp/vendor" #>/dev/null 2>&1
adb shell "rm -r /data/local/tmp/build.prop" #>/dev/null 2>&1
echo "!!! Перевод прошивки выполнен !!! Перезагрузка устройства ..."
adb reboot >/dev/null 2>&1
echo -e "${WHITE}...${NC}\n"
sh $0
}
#############################
###  Checcking device ID  ###
#############################
CHK_ID() {
echo ""
echo -e "${WHITE}. Проверка ID устройства:${NC}"
echo ""
adb kill-server >/dev/null 2>&1
adb start-server >/dev/null 2>&1
adb push files/dev_id/TST_ID /data/local/tmp/ >/dev/null 2>&1
#adb shell su c mount -o remount,rw /system >/dev/null 2>&1
adb shell su c sh /data/local/tmp/TST_ID
adb shell rm -r /data/local/tmp/TST_ID >/dev/null 2>&1
echo -e "${WHITE}...${NC}\n"
sh $0
}
################################
###  Install local user app  ###
################################
INST_APP() {
echo ""
echo -e "${WHITE}. Установка пользовательских приложений (папка files/user_app)${NC}"
echo ""
adb kill-server >/dev/null 2>&1
adb start-server >/dev/null 2>&1
USRAPPS=(`ls -1 files/user_app/`)
select i in "${USRAPPS[@]}"; do
    break
done
echo -e "${BLU1}Установка приложения:${NC} ${WHITE}${i}${NC}"
adb install -r files/user_app/${i} >/dev/null 2>&1
echo -e "${RED}!!! Установка приложения${NC} ${WHITE}${i}${NC} ${RED}завершено !!!${NC}"
echo -e "${WHITE}...${NC}\n"
sh $0
}
##################################
### Uninstall apps from devices ##
##################################
UNINST_APP() {
echo ""
echo -e "${WHITE}. Удаление пользовательских приложений${NC}"
echo ""
adb kill-server >/dev/null 2>&1
adb start-server >/dev/null 2>&1
adb shell "su -c ls /data/data/" | grep -vE 'mediatek|meizu|android|flyme' > ${TMP_FILE1}
dos2unix ${TMP_FILE1} >/dev/null 2>&1
USR_APP=(`cat ${TMP_FILE1}`)
select i in "${USR_APP[@]}"; do
    break
done
echo -e "${BLU1}Удаление приложения:${NC} ${WHITE}${i}${NC}"
adb uninstall ${i} >/dev/null 2>&1
echo -e "${RED}!!! Удаление приложения${NC} ${WHITE}${i}${NC} ${RED}завершено !!!${NC}"
echo -e "${WHITE}...${NC}\n"
sh $0
}

############################ 
### Main Menu for script ### 
############################ 

echo -e "${BLU1}Скрипт для MEIZU M3 Note & Flyme OS (автор ProstorNET)${NC}"

ACT_1="Проверка прав суперпользователя"
ACT_2="Удаление китайского софта"
ACT_3="Заморозка софта"
ACT_4="Перевод прошивки"
ACT_5="Проверка ID устройства"
ACT_6="Установка пользовательских приложений (папка files/user_app)"
ACT_7="Удаление пользовательских приложений с телефона"
ACT_8="Выход"

PS3="${BLU1}Ваш выбор пользователь: ${NC1}"

select CHOICES in "${ACT_1}" "${ACT_2}" "${ACT_3}" "${ACT_4}" "${ACT_5}" "${ACT_6}" "${ACT_7}" "${ACT_8}"; do
    case ${CHOICES} in
        "${ACT_1}")
            CHK_SU
            ;;
        "${ACT_2}")
            RMAPP_CHN
            ;;
        "${ACT_3}")
            PMAPP_CHN
            ;;
        "${ACT_4}")
            INST_RUS
            ;;
        "${ACT_5}")
            CHK_ID
            ;;
        "${ACT_6}")
            INST_APP
            ;;
        "${ACT_7}")
            UNINST_APP
            ;;
        "${ACT_8}")
            rm -rf ${TMP_FILE1}
            exit 0
            ;;
    esac
    break
done

rm -rf ${TMP_FILE1}
exit 0
