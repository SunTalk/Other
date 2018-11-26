g++ R01.cpp -o R01.exe
for i in $(ls | grep -e "R01_[0-9]"); do ./R01 < ${i%%.*}.in > ${i%%.*}.out; done