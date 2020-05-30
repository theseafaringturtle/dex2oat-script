#!/bin/sh

# get command line arguments intended for dex2oat
args="$@"

logFile=dex2oat_backup.log

# /data/local/tmp is not accessible since dex2oat runs with reduced privileges
# so extract the package's internal directory from the command line arguments and use that to store output

for i in $args; do 
    if [[ "$i" == --dex-file=* ]]; then
	dexPath=$(echo "$i" | cut -d'=' -f2)
	pkgDir=/data/data/$(echo $dexPath | cut -d'/' -f5)/dex2oat_backup
	mkdir $pkgDir
	echo "Copying $dexPath" >> $pkgDir/$logFile
	echo "Parameters: $args" >> $pkgDir/$logFile
	cp $dexPath $pkgDir/
    fi
done

# finally, invoke the original executable
/system/bin/dex2oat_orig $args

