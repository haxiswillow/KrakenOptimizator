# Kraken Optimizator
# GitHub @haxiswillow
#!/system/bin/sh
MODDIR=${0%/*}

# Entropy
echo "4096" > /proc/sys/kernel/random/read_wakeup_threshold
echo "4096" > /proc/sys/kernel/random/write_wakeup_threshold

# Suspend Power
write /sys/kernel/power_suspend/ "3"

# Charge
echo "1" /sys/kernel/fast_charge/force_fast_charge

# Touch
echo "7035" > /sys/class/touch/switch/set_touchscreen
echo "8002" > /sys/class/touch/switch/set_touchscreen
echo "11000" > /sys/class/touch/switch/set_touchscreen
echo "13060" > /sys/class/touch/switch/set_touchscreen
echo "14005" > /sys/class/touch/switch/set_touchscreen

# Zram
for zram0 in sys/block/zram0/
do
write "${zram0}reset" "1"
write "${zram0}disksize" "1677721600"
done

# Cpu Input Boost
echo "90" /sys/module/cpu_input_boost/parameters/input_boost_duration
echo "1" /sys/module/cpu_input_boost/parameters/dynamic_stune_boost
