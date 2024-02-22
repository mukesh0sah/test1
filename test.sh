# zip -r test1.zip
# zip target.zip demo_backup.git 
# zip target.zip repo_backup.git
line= "test-repo-backup/demo_backup"
reponame=$(basename "$line")

# function jsonValue() {
# KEY=$1
# KEY2=$2
# num=$3
# awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'$KEY'\042/){print ""; printf $(i+1)}; if( -z "$KEY2"){if($i~/'$KEY2'\042/){print $(i+1)}}}}' | tr -d '"' | sed -n ${num}p; }


# userName="mukesh0sah"
# password="ATBBN6zGFR44RMwJSdQSNpq2c5Be913ED2FB"
# accountName="test-repo-backup"

# echo "Getting Repositories size"
# size="$(curl -s -u "$userName:$password" "https://api.bitbucket.org/2.0/repositories/$accountName?pagelen=100&page=100000" | jsonValue slug size 1)"
# echo "Number of repositories: $size"
# echo ""
# echo "Getting Repositories slug"


# count=1
# while true
# do
# curl -s -u "$userName:$password" "https://api.bitbucket.org/2.0/repositories/$accountName?pagelen=100&page=1" | jsonValue full_name null  | sed -n -e "/$accountName/p" >> ListOfRepoSlug.txt
# 	count=$(($count+1))
# 	size=$(($size-100))
# 	if (("$size" <= "0")); then
#     	break
#     fi
# done

# # sed -i '/^$/d' "ListOfRepoSlug.txt"
# grep -v '^$' filename > newfilename
# echo "" >> ListOfRepoSlug.txt