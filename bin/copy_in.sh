# Project Env
. $(dirname $0)/env.sh

for year in 2021
do
	cp -rp "$LOCAL_DIR/$year" .
	chmod 755 $year
	chmod 644 $year/*.* $year/*/*.*
done
