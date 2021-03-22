SKIPMOUNT=false
PROPFILE=true
POSTFSDATA=true
LATESTARSERVICE=true

print_modname() {
ui_print "- Kraken Optimizator 1.0.3"
sleep 1
ui_print "- Updated 21/03/21"
sleep 1
ui_print "- Dev Maintainer : Haxis"
sleep 1
ui_print "_________________________"
sleep 1
ui_print "- Date:$(date +"%d-%m_%y %r")"
sleep 1
ui_print "- Cleaning..."
sleep 1
fstrim -v /data
fstrim -v /cache
fstrim -v /system
sleep 1
ui_print "- Installing..."
}

on_install() {
unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
}

set_permissions() {
set_perm_recusrsive $MODPATH 0 0 0755 0644
set_perm_recusrsive $MODPATH/system/etc/init.d 0 0 0777 0777
}
