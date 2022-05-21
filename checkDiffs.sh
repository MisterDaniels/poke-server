cd src;

for file in *; do
    echo $file;
    echo "File $file ----------------------------------------" >> ../diffs2.log
    diff -u $file ../temp/$file >> ../diffs2.log
    echo "---------------------------------------------------" >> ../diffs2.log
done