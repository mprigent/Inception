echo " \n\n ___________________________________________ \n"
echo "|                                           |\n"
echo "|					  INCEPTION		     	  |\n"
echo "|                                           |"
echo "\n|___________________________________________|\n\n"

printf "\nEnter the path in wich your MariaDB database and WordPress files will be create"
printf "\nExemple : /home/mprigent/data\n"
read path

#if this repertory doesn't exist, create it and set the permissions
if [ ! -d "$path" ]; then
    echo "This repertory doesn't exist, please create it"
    exit 1
fi

echo "$path" > srcs/requirements/tools/data_path.txt

cp srcs/requirements/tools/template_compose.yml srcs/docker-compose.yml

# replace 'path/to/data' by the path entered by the user in srcs/docker-compose.yml
cat srcs/docker-compose.yml | sed "s+pathtodata+$path+g" > srcs/docker-compose.yml.tmp
mv srcs/docker-compose.yml.tmp srcs/docker-compose.yml