#!/bin/bash

##################################
aciksari="\033[1;33m"            #
yesil="\033[1;32m"               #
beyaz="\033[1;37m"               #
kirmizi="\033[1;31m"             #            
mavi="\033[1;36m"                #       
f="\033[0m"                      #
lacivert="\033[34m"              #
sari="\033[33m"                  #
mor="\033[35m"          		 #
MAGENTA=$ESC_SEQ"\\033[35;01m"   #
##################################


rhlds_url="http://nexus.rehlds.org/nexus/content/repositories/rehlds-dev/rehlds/rehlds/3.4.0.668-dev/rehlds-3.4.0.668-dev.zip"
rhlds_unzip="rehlds-3.4.0.668-dev.zip"
regamedll_url="http://nexus.rehlds.org/nexus/content/repositories/regamedll-dev/regamedll/regamedll/5.7.0.322-dev/regamedll-5.7.0.322-dev.zip"
regamedll_unzip="regamedll-5.7.0.322-dev.zip"
metamod_url="https://github.com/intothewild26/steam-server/raw/master/metamod_1.3.0.128.zip"
metamod_unzip="metamod_1.3.0.128.zip"
renuion_url="https://github.com/intothewild26/steam-server/raw/master/Renuion-v1.zip"
renuion_unzip="Renuion-v1.zip"
sxei_url="https://github.com/intothewild26/steam-server/raw/master/sxei_17.2.zip"
sxei_unzip="sxei_17.2.zip"
amxxcfg_url="https://raw.githubusercontent.com/intothewild26/steam-server/master/amxx.cfg"
servercfg_url="https://raw.githubusercontent.com/intothewild26/steam-server/master/server.cfg"
amxmodx_url="https://github.com/intothewild26/steam-server/raw/master/amxmodx-1.8.3.zip"
amxmodx_unzip="amxmodx-1.8.3.zip"
dosyalar_url="https://dll.injectshell.com/cs16-dosyalar/dosyalar.zip"
dosyalar_unzip="dosyalar.zip"


ipadress=`curl -s icanhazip.com`

case $1 in

install)

	if [ ! -d "/root/counter-strike-16" ] && [ ! -d "/root/Steam" ] 
then


	clear
	clear
	su root -c "echo -e '${sari}##############################################################'"
	su root -c "echo -e '${sari}#'"
	su root -c "echo -e '#     Sunucu dosyaları ${yesil}ve\033[0m ${sari}gerekenler yükleniyor.'"
	su root -c "echo -e '${sari}#'"
	su root -c "echo -e '##############################################################\033[0m'"
	sleep 2
	
	if [ ! -d "/usr/local/bin/cs-temel-bil" ]
	then
	cd /usr/local/bin
	mkdir cs-temel-bil
	clear
	apt-get -qq install wget -y
	apt-get -qq update && apt-get -qq upgrade -y && apt-get -qq install curl -y
	apt-get -qq install curl -y
	apt-get -qq install unzip -y
	apt-get -qq install lib32gcc1 -y
	clear
	fi
	
	clear
	mkdir /root/counter-strike-16
	mkdir /root/counter-strike-16/steamcmd
	cd /root/counter-strike-16/steamcmd
	curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
	rm -rf /root/counter-strike-16/steamcmd/steamcmd_linux.tar.gz
	cd /root/counter-strike-16/steamcmd
	su -c "./steamcmd.sh +login anonymous +force_install_dir /root/counter-strike-16/server-dosyalari +app_update 90 validate +quit"
	clear
	su -c "./steamcmd.sh +login anonymous +force_install_dir /root/counter-strike-16/server-dosyalari +app_update 90 validate +quit"
	clear
	su -c "./steamcmd.sh +login anonymous +force_install_dir /root/counter-strike-16/server-dosyalari +app_update 90 validate +quit"
	clear
	cd /root/counter-strike-16/server-dosyalari/
	wget -q --no-check-certificate ${rhlds_url}
	unzip ${rhlds_unzip}
	rm -rf ${rhlds_unzip}
	cd /root/counter-strike-16/server-dosyalari/bin/linux32/
	mv * /root/counter-strike-16/server-dosyalari
	cd /root/counter-strike-16/server-dosyalari
	rm -rf hlsdk && rm -rf flighrec && rm -rf bin
	chmod 777 *
	cd /root/counter-strike-16/server-dosyalari/cstrike/
	wget -q --no-check-certificate ${regamedll_url}
	unzip ${regamedll_unzip}
	rm -rf ${regamedll_unzip}
	cd /root/counter-strike-16/server-dosyalari/cstrike/dlls/
	rm -rf cs.so
	cd /root/counter-strike-16/server-dosyalari/cstrike/bin/linux32/cstrike/dlls/
	mv cs.so /root/counter-strike-16/server-dosyalari/cstrike/dlls/
	cd /root/counter-strike-16/server-dosyalari/cstrike/
	rm -rf bin && rm -rf cssdk
	chmod 777 *
	cd /root/counter-strike-16/server-dosyalari/cstrike/
	wget -q --no-check-certificate ${metamod_url}
    unzip ${metamod_unzip}
	rm -rf ${metamod_unzip}
	rm -rf example_plugin
	rm -rf sdk
	sed -i 's@gamedll_linux "dlls/cs.so"@gamedll_linux "addons/metamod/metamod_i386.so"@' liblist.gam
	cd /root/counter-strike-16/server-dosyalari/cstrike/addons/
	wget -q --no-check-certificate ${renuion_url}
    unzip ${renuion_unzip}
	rm -rf ${renuion_unzip}
	mv reunion.cfg /root/counter-strike-16/server-dosyalari/cstrike/
	cd /root/counter-strike-16/server-dosyalari/cstrike/addons/metamod/
	sudo echo "
	linux addons/reunion/reunion_mm_i386.so" >> /root/counter-strike-16/server-dosyalari/cstrike/addons/metamod/plugins.ini;
	cd /root/counter-strike-16/server-dosyalari/cstrike/addons/
	wget -q --no-check-certificate ${sxei_url}
	unzip ${sxei_unzip}
	rm -rf ${sxei_unzip}
	cd /root/counter-strike-16/server-dosyalari/cstrike/addons/metamod/
	sudo echo "
	linux addons/sxei/sxei_mm_i386.so" >> /root/counter-strike-16/server-dosyalari/cstrike/addons/metamod/plugins.ini;
	cd /root/counter-strike-16/server-dosyalari/cstrike/
	rm -rf server.cfg
	wget -q --no-check-certificate ${servercfg_url}
	cd /root/counter-strike-16/server-dosyalari/cstrike/addons/
	wget -q --no-check-certificate ${amxmodx_url}
	unzip ${amxmodx_unzip}
	rm -rf ${amxmodx_unzip}
	cd /root/counter-strike-16/server-dosyalari/cstrike/addons/metamod/
	sudo echo "
	linux addons/amxmodx/dlls/amxmodx_mm_i386.so" >> /root/counter-strike-16/server-dosyalari/cstrike/addons/metamod/plugins.ini;
	cd /root/counter-strike-16/server-dosyalari/cstrike/
	wget -q --no-check-certificate ${dosyalar_url}
	unzip ${dosyalar_unzip}
	rm -rf ${dosyalar_unzip}
	clear
	clear && mkdir /root/.steam/sdk32 && cp /root/counter-strike-16/steamcmd/linux32/steamclient.so /root/.steam/sdk32/
	clear
	cd /root/counter-strike-16/server-dosyalari && chmod 777 * && clear && screen -AmdS cs ./hlds_run -console -game cstrike -ip $ipadress -port 27015 +maxplayers 32 +map de_dust2 && screen -S cs -X quit
	screen -AmdS cs16 ./hlds_run -console -game cstrike -ip $ipadress -port 27015 +maxplayers 32 +map de_dust2 
	clear
	
	
	else	
	clear
	clear
	su root -c "echo -e '${sari}#################################################################'"
	su root -c "echo -e '${sari}#'"
	su root -c "echo -e '#     Sunucu dosyalarınız ${yesil}mevcut\033[0m ${sari}tekrar kurulum yapamazsınız.'"
	su root -c "echo -e '${sari}#'"
	su root -c "echo -e '#################################################################\033[0m'"
	exit 0
	fi
	clear
	clear
	su root -c "echo -e '${sari}###########################################################################'"
	su root -c "echo -e '${sari}#'"
	su root -c "echo -e '#     Sunucu kuruldu ${mor}( ${MAGENTA}başlatılmadı\033[0m ${mor})\033[0m ${sari}başlatılmaya hazır.'"
	su root -c "echo -e '#     Sunucu için gerekli komutlar:\n#'"
	su root -c "echo -e '#     ${yesil}./steam\033[0m ${mavi}install\033[0m || ${beyaz}Sunucuyu kurduysaniz gerek yoktur.\033[0m'"
	su root -c "echo -e '${sari}#     ${yesil}./steam\033[0m ${mavi}start\033[0m || ${beyaz}Sunucuyu baslatir (aktif) eder.\033[0m'"
	su root -c "echo -e '${sari}#     ${yesil}./steam\033[0m ${mavi}stop\033[0m || ${beyaz}Sunucuyu durdurur (devredisi) eder.\033[0m'"
	su root -c "echo -e '${sari}#     ${yesil}./steam\033[0m ${mavi}console\033[0m || ${beyaz}Sunucunun konsolu (kontrol-paneli) acar.\033[0m'"	
	su root -c "echo -e '${sari}#'"
	su root -c "echo -e '${sari}###########################################################################\033[0m'"


;;
start)
clear
cd /root/counter-strike-16/server-dosyalari && clear && screen -AmdS cs ./hlds_run -console -game cstrike -ip $ipadress -port 27015 +maxplayers 32 +map de_dust2 && screen -S cs -X quit
screen -AmdS cs16 ./hlds_run -console -game cstrike -ip $ipadress -port 27015 +maxplayers 32 +map de_dust2 
clear
;;
stop)
screen -S cs16 -X quit
;;
console)
screen -r cs16
;;
amxmodx)
screen -S cs16 -X quit
cd /root/counter-strike-16/server-dosyalari/cstrike/addons/
rm -rf amxmodx
wget -q --no-check-certificate ${amxmodx_url}
unzip ${amxmodx_unzip}
rm -rf ${amxmodx_unzip}

;;
delete)
 
	if [ ! -d "/root/counter-strike-16" ] && [ ! -d "/root/Steam" ]
then
	clear
	clear
	su root -c "echo -e '${sari}#################################################################'"
	su root -c "echo -e '${sari}#'"
	su root -c "echo -e '#     Sunucu dosyalarınız ${kirmizi}zaten silinmiş\033[0m ${sari}silme işlemi yapamazsın.'"
	su root -c "echo -e '${sari}#'"
	su root -c "echo -e '#################################################################\033[0m'"
	exit 0
	
	else	
	cd /root
	rm -rf /root/counter-strike-16 /root/Steam
	rm -rf /root/.steam
	clear
	screen -S cs16 -X quit
	clear
	clear
	su root -c "echo -e '${sari}#################################################################'"
	su root -c "echo -e '${sari}#'"
	su root -c "echo -e '#     Sunucu dosyalarınız ${yesil}silindi\033[0m ${sari}tekrar kurulum yapınız.'"
	su root -c "echo -e '${sari}#'"
	su root -c "echo -e '#################################################################\033[0m'"
	
	
	fi

 
;;
*)
echo -e "${MAGENTA}./steam install / delete / amxmodx / start / stop / console\033[0m"
;;
esac
