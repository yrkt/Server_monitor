if ps -ef | grep vsftpd| grep -v grep > /dev/null
then
        echo "vsftpd.service Running.." | tee $LOGFILE
        flag=0
else
        echo "vsftpd.service NOT Running.. Please check.." | tee $LOGFILE  | mailx -s "vsftpd.service NOT Running" yrkt1804@gmail.com
        flag=2
fi
