myfile='c:/Users/Etsuna/Documents/GitHub/Nier/DUMPCSV/TALK_D.JA.PS3.csv'
fileedit='c:/Users/Etsuna/Documents/GitHub/Nier/TEXT/TALK_TEXT/TALK_D.JA.PS3.TKD'

while IFS=";" read -r col1 col2 col3 col4
do
    echo "I got:$col1|$col2|$col3"

    blinderer=$(sed 's/[.*…"]/\\&/g' <<< "$col1")
    # echo "blinder = $blinderer"

   	sed -i -b ''"$col3"'s|'"$col1"'|'"$col2"'|g' $fileedit

    # sed -e 's/'"$word"'.*/'"$str"'/g'

    # awk 'NR==$col3 {gsub( /$col1/, "$col2" )}; NR!=$col3 {print}' $fileedit

    # awk 'NR==$col3 {print gensub(/$col1/,"col2"),1}; NR!=4 {print}' $fileedit

done < $myfile