# script qui permet d'utiliser la CLI (effectue les commandes necessaires au lancement du container)
sleep 10 # précaution -> pour être sur que MariaDB a eu le temps de se lancer
# wp-config.php n'existe pas -> permet d'indiquer les infos dont WP a besoin sans avoir a reconfigurer à chaque lancement
wp config create	--allow-root \
    				--dbname=$SQL_DATABASE \
    				--dbuser=$SQL_USER \
    				--dbpass=$SQL_PASSWORD \
    				--dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install