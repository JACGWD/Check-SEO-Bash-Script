#!/bin/bash
set -m

echo $PWD  > seo.txt && echo -e "\n \n"  >> seo.txt


echo " ------------------ Find all .html files and list their name ------------------ " > seo.txt &&
ls -l -A -R | grep \.html >> seo.txt && echo -e "\n \n" >> seo.txt &&


echo " ------------------ List all title tags in .html files ------------------ "  >> seo.txt &&
find . -type f -name "*.html" -exec grep -H -A 1 -B 1 \<title {} \; >> seo.txt && echo -e "\n \n" >> seo.txt &&


echo " ------------------ List all meta description tags in .html files ------------------ "  >> seo.txt &&
find . -type f -name "*.html" -exec grep -H  \<meta\ name=\"description\" {} \; >> seo.txt && echo -e "\n \n" >> seo.txt && 


echo " ------------------ List all anchor tags ------------------ "  >> seo.txt && echo -e "\n" >> seo.txt &&
find . -type f -name "*.html" -exec grep -H  \<a[[:space:]] {} \; >> seo.txt && echo -e "\n \n" >> seo.txt &&

echo " ------------------ List all image tags ------------------ "  >> seo.txt && echo -e "\n" >> seo.txt &&
find . -type f -name "*.html" -exec grep -H  \<img {} \; >> seo.txt && echo -e "\n \n" >> seo.txt &&


echo " ------------------ List all alt tags ------------------ "  >> seo.txt && echo -e "\n" >> seo.txt &&
find . -type f -name "*.html" -exec grep -H  alt\= {} \; >> seo.txt && echo -e "\n \n" >> seo.txt &&


echo " ------------------ Count the number of image tags (first) and then count the number of images with Alt tags ------------------ "  >> seo.txt && echo -e "\n" >> seo.txt &&
echo "Number of images " >> seo.txt &&
find * -type f -name "*.html" -exec grep -H  \<img {} \; | grep -c img  >> seo.txt &&


echo "Number of alt tags " >> seo.txt  &&
find * -type f -name "*.html" -exec grep -H  \<img {} \; | grep -c alt >> seo.txt


echo "Number of non-empty alt tags " >> seo.txt  &&
find * -type f -name "*.html" -exec grep -H  \<img {} \; | grep -c alt\="*" >> seo.txt && echo -e "\n \n" >> seo.txt &&


echo " ------------------ Non web files to delete ------------------ "  >> seo.txt && echo -e "\n" >> seo.txt &&
find . -iregex '.*\.\(ai\|eps\|psd|\indd|\tif|\tiff|\bmp\)' -printf '%f\n' >> seo.txt 
