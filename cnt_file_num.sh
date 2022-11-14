# cnt file numbers
# $1 PATH
# $2 KEYWORD
# Reference
## https://qiita.com/ko1nksm/items/f7e9becee2e651004e14
# set -e していれば 下記の || exit $? は不要
dirname="$(cd -- "$(dirname -- "$1")" && pwd)" || exit $?
abspath="${dirname%/}/$(basename -- "$1")"
#echo $dirname $abspath
if test -z $2 ; then
    file_num=`find $abspath -type f | wc -l`
else
    #echo "keyword :" $2
    file_num=`find $abspath -type f | xargs -I {} basename {} | grep $2 | wc -l`
fi
#echo "file num :"$file_num
echo $file_num