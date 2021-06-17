# Project Env
. $(dirname $0)/env.sh

for folder in Docker* bin python 2021
do
	cp -rp $folder "$LOCAL_DIR/"
done
