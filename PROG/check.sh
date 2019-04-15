myfile='c:/Users/Etsuna/Documents/GitHub/Nier/DUMPCSV/TALK_D.JA.PS3.csv'
fileedit='c:/Users/Etsuna/Documents/GitHub/Nier/TEXT/TALK_TEXT/TALK_D.JA.PS3.TKD'
textacheck='c:/Users/Etsuna/Documents/GitHub/Nier/DUMPCSV/correction.txt'

if [ ! -f $textacheck ]
then
    echo "Fichier non trouvé, Création du fichier"
    touch $textacheck
else
    echo "File déja présent, suppression et création du nouveau fichier"
    rm -rf $textacheck
    touch $textacheck
fi

while IFS=";" read -r col1 col2 col3 col4
do
    echo "I got:$col1|$col2|$col3"

    blinderer=$(sed 's/[.*…"]/\\&/g' <<< "$col1")
    # echo "blinder = $blinderer"

   	check=$(cat $fileedit | sed -e ''"${col3}"'p' -e '/\"$col2\"/!d' | cut -f16 -d$'\t')

   	if [[ "$col2" == "$check" ]]
   	then
   		echo "Ligne $col3 ok"
   	else
   		echo "Ligne $col31 pas ok"
   		echo "$col3" >> $textacheck
   	fi

    # sed -e 's/'"$word"'.*/'"$str"'/g'

    # awk 'NR==$col3 {gsub( /$col1/, "$col2" )}; NR!=$col3 {print}' $fileedit

    # awk 'NR==$col3 {print gensub(/$col1/,"col2"),1}; NR!=4 {print}' $fileedit

done < $myfile