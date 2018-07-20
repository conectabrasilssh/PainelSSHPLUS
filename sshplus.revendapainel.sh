#!/bin/bash
clear
echo "America/Sao_Paulo" > /etc/timezone
ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata
wget ssh-plus.tk/revenda/confpainel/criarusuario.sh > /dev/null 2>&1
wget ssh-plus.tk/revenda/confpainel/remover.sh > /dev/null 2>&1
wget ssh-plus.tk/revenda/confpainel/AlterarSenha.sh > /dev/null 2>&1
wget ssh-plus.tk/revenda/confpainel/AlterarData.sh > /dev/null 2>&1
wget ssh-plus.tk/revenda/confpainel/KillUser.sh > /dev/null 2>&1
wget ssh-plus.tk/revenda/confpainel/sshmonitor.sh > /dev/null 2>&1
wget ssh-plus.tk/revenda/confpainel/alterarlimite.sh > /dev/null 2>&1
chmod 777 *sh
apt-get install cron -y > /dev/null 2>&1
echo '* * * * * root /usr/bin/php /var/www/html/pages/system/cron.php' >> /etc/crontab
echo '* * * * * root /usr/bin/php /var/www/html/pages/system/cron.ssh.php ' >> /etc/crontab
echo '* * * * * root /usr/bin/php /var/www/html/pages/system/cron.sms.php' >> /etc/crontab
echo '* * * * * root /usr/bin/php /var/www/html/pages/system/cron.online.ssh.php' >> /etc/crontab
echo '10 * * * * root /usr/bin/php /var/www/html/pages/system/cron.servidor.php' >> /etc/crontab
/etc/init.d/cron reload > /dev/null 2>&1
/etc/init.d/cron restart > /dev/null 2>&1
service ssh restart
echo -e "\033[1;32mCONCLUIDO!\033[0m"
sleep 3
cat /dev/null > ~/.bash_history && history -c && clear
rm inst
