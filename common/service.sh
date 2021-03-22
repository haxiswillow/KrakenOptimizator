# Kraken Optimizator
# GitHub @haxiswillow
#!/system/bin/sh
MODDIR=${0%/*}

# Entropy
echo "4096" > /proc/sys/kernel/random/read_wakeup_threshold
echo "4096" > /proc/sys/kernel/random/write_wakeup_threshold

# Suspend Power
echo "3" /sys/kernel/power_suspend

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

# Cpu Boost
echo "90" /sys/module/cpu_input_boost/parameters/input_boost_duration
echo "1" /sys/module/cpu_input_boost/parameters/dynamic_stune_boost

chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "performance" /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 0644 /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo "performance" /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
chmod 0644 /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo "performance" /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
chmod 0644 /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
echo "performance" /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor

# For Battery
echo "0" /sys/touchpanel/double_tap
echo "Y" /sys/module/worqueue/parameters/power_efficient

# Low Memory Killer Parameters
echo "0,3,5,7,14,15" > /sys/module/lowmemorykiller/parameters/adj
echo "18432,23040,27648,32256,36864,46080" > /sys/module/lowmemorykiller/parameters/minfree
echo "0" > /proc/sys/kernel/panic
echo "0" > /proc/sys/vm/oom_kill_allocating_task
echo "0" > /proc/sys/vm/panic_on_oom
echo "1" > /proc/sys/kernel/panic_on_oops
echo "0" > /proc/sys/kernel/panic

exit 0;
