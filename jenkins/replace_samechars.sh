#!/bin/bash
#replase all '111-111-1111','222-222-2222'... with '***-***-****' in the files under the current destination_dir and sub-directory

replace_dir(){
    for file in `ls -a $1`
    do
        if [ -d $1"/"$file ]
        then
            if [[ $file != '.' && $file != '..' ]]
            then
                replace_dir $1"/"$file
            fi
        else
            echo $1"/"$file
            sed -i 's/\([0-9]\)\1\{2\}-\([0-9]\)\1\{2\}-\([0-9]\)\1\{3\}/***-***-****/g' $file
        fi
    done
}
replace_dir destination_dir
