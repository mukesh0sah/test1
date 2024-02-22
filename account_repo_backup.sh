#!/bin/bash
#set -x

function jsonValue() {
KEY=$1
KEY2=$2
num=$3
awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'$KEY'\042/){print ""; printf $(i+1)}; if( -z "$KEY2"){if($i~/'$KEY2'\042/){print $(i+1)}}}}' | tr -d '"' | sed -n ${num}p; }

userName="mukesh0sah"
password="ATBBN6zGFR44RMwJSdQSNpq2c5Be913ED2FB"
accountName="test-repo-backup"
#echo $userName
#echo $password
#echo $accountName

echo "Getting Repositories size"
size="$(curl -s -u "$userName:$password" "https://api.bitbucket.org/2.0/repositories/$accountName?pagelen=100&page=100000" | jsonValue slug size 1)"
echo "Number of repositories: $size"
echo ""
echo "Getting Repositories slug"

count=1
while true
do
curl -s -u "$userName:$password" "https://api.bitbucket.org/2.0/repositories/$accountName?pagelen=100&page=1" | jsonValue full_name null  | sed -n -e "/$accountName/p" >> ListOfRepoSlug.txt
	count=$(($count+1))
	size=$(($size-100))
	if (("$size" <= "0")); then
    	break
    fi
done

sed -i '/^$/d' ListOfRepoSlug.txt
echo "" >> ListOfRepoSlug.txt

file=ListOfRepoSlug.txt
count=1
while IFS= read line; 
do 
   line="$(echo -e "${line}" | tr -d '[:space:]')";
   repoName=$(basename "$line")
   printf "$count. Cloning $line \n"
   git clone https://$userName:$password@bitbucket.org/$line
   printf "Completed\n"
   count=$(($count+1)) 

   # zip -r repoBackup.zip "$repoName.git"
   # sed -i '1d' "$file"
done < "$file"
# zip target.zip demo_backup.git 
# echo -n > ListOfRepoSlug.txt
echo "Completed"




   # echo "$reponame"
   # cd "$reponame"
   # git init
   # git add .
   # git commit -m "helllllo"
   # git remote add main https://github.com/mukesh0sah/$repoName.git
   # git push main --mirror
# count=1
# while IFS= read line; 
# do 
#    line="$(echo -e "${line}" | tr -d '[:space:]')";
#    repoName=$(basename "$line")
#    echo "$reponame"
#    cd "$reponame"
#    git init
#    git add .
#    git commit -m "helllllo"
#    git remote add main https://github.com/mukesh0sah/$repoName.git
#    git push main --mirror
#    count=$(($count+1)) 
# done < "$file"
# cd "demo_backup"
git init
echo "executed inin command"
git add .
echo "executed add command"
git commit -m "helllllo"
echo "executed commit command"
git remote add main https://github.com/mukesh0sah/test2.git
echo "executed remote command"
git push main --mirror
echo "executed push command"


# curl -X POST -i -H "Authorization: Bearer <access_token>" -H "Content-Length: <file_size>" -s "<site_url>/_api/web/GetFolderByServerRelativeUrl('<folder_url>')/Files/add(url='<file_name>',overwrite=true)" --data-binary "@<file_path>"