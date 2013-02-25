#
# Used with the login shell to start the dropbox daemon.
# Will only do so if the daemon is not currently running.
#

# dropbox
DROPBOXD_PATH=`/usr/bin/dropboxd`
DROPBOX_PATH=`/opt/dropbox/dropbox`
[ ! -z "$PID_DROPBOX" ]
if [ $? -gt 0 ]; then
    su -c "/etc/rc.d/dropboxd start" -
fi

