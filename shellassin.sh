
#!/bin/bash
#citynames.csv is the input file
while IFS="," read f1 f2
do 
echo "$f1"
done < citynames.csv >tempcitynames.csv
tr '\n' ';' < tempcitynames.csv > citynames.csv
cat citynames.csv
# Use below command to execute from cell
#Go to folder where your input file and script is residing
#folder> $ ./shellassin.sh