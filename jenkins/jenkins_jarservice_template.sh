#!/bin/sh

companyname="yodoo"
jarfullname="/wbz/jar/wbzChannel-1.0-SNAPSHOT.jar"
pidname="wbzChannel-16400"
logdir="/wbz/log"
servicedir="/wbz/service"


(
cat <<EOF
#!/bin/sh

sudo mkdir -p /var/run/$companyname
sudo chown -R admin:admin /var/run/yodoo
nohup java -jar $jarfullname > $logdir/$pidname.log 2>&1 &
echo \$! > /var/run/$companyname/$pidname.pid

EOF
) > $servicedir/$pidname-start.sh


(
cat <<EOF
#!/bin/sh

PID=\$(cat /var/run/$companyname/$pidname.pid)
kill -9 \$PID
EOF
) > $servicedir/$pidname-stop.sh


(
cat <<EOF
[Unit]
Description=$pidname service
After=cloud-init.service

[Service]
Type=forking
User=admin
PIDFile=/var/run/$companyname/$pidname.pid
ExecStart=$servicedir/$pidname-start.sh
ExecReload=
ExecStop=$servicedir/$pidname-jar-stop.sh
PrivateTmp=true

[Install]
WantedBy=multi-user.target
EOF
) > $servicedir/$pidname.service

chmod 754 $servicedir/*


sudo systemctl enable $servicedir/$pidname.service
sudo systemctl start $pidname