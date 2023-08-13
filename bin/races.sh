grep Sailed */*/*pro*html */*/*int*html | grep -v 'Sailed: 0' | sed 's/:/,/' | sed 's/<[^<]*>//g' | sed 's/ /,/g' >int.csv
grep Sailed */*/*am*html */*/*nat*html | grep -v 'Sailed: 0' | sed 's/:/,/' | sed 's/<[^<]*>//g' | sed 's/ /,/g' >nat.csv
