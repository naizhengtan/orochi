#!/bin/bash

echo 'UPDATE ContactInfo SET password="123"' > /tmp/update_passwd.sql &&\
mysql -uroot -pnews123 hotcrp < /tmp/update_passwd.sql &&\
#mysql -uroot -ppassword hotcrp < /tmp/update_passwd.sql &&\
rm /tmp/update_passwd.sql &&\
echo "DONE" && exit

echo "FAIL"
exit 1
