# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    auto_config.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mprigent <mprigent@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/09 23:36:32 by mprigent          #+#    #+#              #
#    Updated: 2022/09/13 14:57:55 by mprigent         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# permet de démarrer mysql avec la commande associée.
service mysql start;

# crée une table si elle n’existe pas déjà, du nom de la variable d’environnement SQL_DATABASE, indiqué dans le fichier .env qui sera envoyé par le docker-compose.yml.
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# crée l’utilisateur SQL_USER s’il n’existe pas, avec le mot de passe SQL_PASSWORD , toujours à indiquer dans le .env
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# donne les droits à l’utilisateur SQL_USER avec le mot de passe SQL_PASSWORD pour la table SQL_DATABASE
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# change les droits root avec le mot de passe root SQL_ROOT_PASSWORD
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# rafraichit la database
mysql -e "FLUSH PRIVILEGES;"

# redemarrer MySQL pour que tout soit effectif
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# lance la commande que MySQL recommande à son démarrage
exec mysqld_safe

