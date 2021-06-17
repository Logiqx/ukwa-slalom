# Project Env
. $(dirname $0)/env.sh

$PROJ_DIR/bin/copy_in.sh

run_py_script ukwa-slalom.py

$PROJ_DIR/bin/copy_out.sh
