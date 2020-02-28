if (cat /proc/version | grep 'microsoft' > /dev/null); then
    export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
fi
