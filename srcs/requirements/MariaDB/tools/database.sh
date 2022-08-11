service mysql start; # permet de démarrer mysql avec la commande associée.
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;" # crée une table si elle n’existe pas déjà, du nom de la variable d’environnement SQL_DATABASE, indiqué dans le fichier .env qui sera envoyé par le docker-compose.yml.
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';" # crée l’utilisateur SQL_USER s’il n’existe pas, avec le mot de passe SQL_PASSWORD , toujours à indiquer dans le .env
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';" # donne les droits à l’utilisateur SQL_USER avec le mot de passe SQL_PASSWORD pour la table SQL_DATABASE
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" # change les droits root avec le mot de passe root SQL_ROOT_PASSWORD
mysql -e "FLUSH PRIVILEGES;" # rafraichit
# redemarrer MySQL pour que tout soit effectif
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown # eteint MySQL
exec mysqld_safe # lance la commande que MySQL recommande à son démarrage
