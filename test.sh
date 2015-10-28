#!/bin/bash

readonly USAGE="\

Usage: $0 account_name campaign_num group_num keyword_num


"

show_usage()
{
    echo -e "$USAGE"
}

if [ "$1" = "-h" ] || [ "$1" = "--help" ]
then
    show_usage
    exit 0
fi

[ $# -eq 4 ] || \
{
    echo -e "\nSyntax Error: You tpyed wrong number of arguments"
    show_usage
    exit 1
}

if [[ $2 == *[!0-9]* ]] 
then
    echo "The second argument type error, must be numeric!"
    exit 2
fi

if [[ $3 == *[!0-9]* ]] 
then
    echo "The third argument type error, must be numeric!"
    exit 3
fi

if [[ $4 == *[!0-9]* ]]
then
    echo "The forth argument type error, must be numeric!"
    exit 4
fi

account_name=$1
campaign_num=$2
group_num=$3
keyword_num=$4
file_name="data.csv"

echo -e "Account\tCampaign\tGroup\tKeyword\tMatch Type" > $file_name

#campaign_num loop
i=1
while [ $i -le $campaign_num ]
do
    #group_num loop
    j=1
    while [ $j -le $group_num ]
    do
        #keyword loop
        k=1
        while [ $k -le $keyword_num ]
        do
            MODE=`expr $RANDOM % 3`
            case $MODE in
            0)
                mode=Broad
            ;;
            1)
                mode=Phrase
            ;;
            2)
                mode=Exact
            ;;
            esac
            echo -e "$account_name\tCampaign$i\tC"$i"Group$j\tC"$i"G"$j"KW$k\t$mode" >> $file_name 
            let k++
        done
        let j++
    done
    let i++
done

echo Finished!
