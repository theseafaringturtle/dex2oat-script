# Description

This trick can be useful for defeating some Android packers without hooking APIs or syscalls.

Dex2Oat is a system utility that takes DEX files as an input and compiles them to native code (OAT).

This simple script replaces dex2oat to back up the dex files it is given as an input.
The files are stored into the calling package's internal file directory, under dex2oat_backup. It then calls the original executable.

This will not work against state-of-the art packers that use a custom dex loading flow.

# Usage:

```
adb push dex2oat.sh /data/local/tmp
adb shell
su
```
```
mv /system/bin/dex2oat /system/bin/dex2oat_orig
mv /data/local/tmp/dex2oat.sh /system/bin/dex2oat
```
```
chmod 755 /system/bin/dex2oat
```
(restore original permissions - dex2oat is not run as root)
