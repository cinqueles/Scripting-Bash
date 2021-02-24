dialog --inputbox "Introduce URL" 0 0 2>/tmp/url.txt
url=$(cat /tmp/url.txt)
firefox http://$url&
clear
