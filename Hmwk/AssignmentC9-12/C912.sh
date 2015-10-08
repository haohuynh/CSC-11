echo "Hello $USER. we are going to run programs in chapter 10 and 12"
echo "Today is $(date)"
echo "Current working directory : $(pwd)"
echo "GDB is required to see the results in Register R3 and R4"
rm -vf *.o
./10a
./12a
./12b
