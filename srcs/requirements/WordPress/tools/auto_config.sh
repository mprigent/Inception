# script qui permet d'utiliser la CLI (effectue les commandes necessaires au lancement du container)
# wp-config.php n'existe pas -> permet d'indiquer les infos dont WP a besoin sans avoir a reconfigurer à chaque lancement

if [ ! -e /var/www/wordpress/wp-config.php ]; then
wp config create	--allow-root \
    				--dbname=$SQL_DATABASE \
    				--dbuser=$SQL_USER \
    				--dbpass=$SQL_PASSWORD \
    				--dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install     --url=$DOMAIN_NAME \
					--title=$SITE_TITLE \
					--admin_user=$ADMIN_USER \
					--admin_password=$ADMIN_PASSWORD \
					--admin_email=$ADMIN_EMAIL \
					--allow-root --path='/var/www/wordpress'
					--skip-email # Don’t send an email notification to the new admin user.

wp user create      --allow-root \
					--role=author $USER1_LOGIN $USER1_MAIL \
					--user_pass=$USER1_PASS \
					--path='/var/www/wordpress' >> /log.txt
					--skip-email # Don’t send an email notification to the new admin user.
fi

# if /run/php folder does not exist, create it
if [ ! -d /run/php ]; then
    mkdir ./run/php
fi
/usr/sbin/php-fpm7.3 -F

# wp core install		--url=mprigent.42.fr # The address of the new site.
# 					--title=Inception # The title of the new site.
# 					--admin_user=Marc # The name of the admin user.
# 					--[--admin_password=<password>] # The password for the admin user. Defaults to randomly generated string.
# 					--admin_email=mprigent@student.42.fr # The email address for the admin user.
# 					[--skip-email] # Don’t send an email notification to the new admin user.

# wp user create	<user-login> # The login of the user to create.
# 					<user-email> # The email address of the user to create.
# 					[--role=<role>] # The role of the user to create. Default: default role. Possible values include ‘administrator’, ‘editor’, ‘author’, ‘contributor’, ‘subscriber’.
# 					[--user_pass=<password>] # The user password. Default: randomly generated.
# 					[--user_registered=<yyyy-mm-dd-hh-ii-ss>] # The date the user registered. Default: current date.
# 					[--display_name=<name>] # The display name.
# 					[--user_nicename=<nice_name>] # A string that contains a URL-friendly name for the user. The default is the user’s username.
# 					[--user_url=<url>	#A string containing the user’s URL for the user’s web site.
# 					[--nickname=<nickname>] # The user’s nickname, defaults to the user’s username.
# 					[--first_name=<first_name>] # The user’s first name.
# 					[--last_name=<last_name>] # The user’s last name.
# 					[--description=<description>] # A string containing content about the user.
# 					[--rich_editing=<rich_editing>] # A string for whether to enable the rich editor or not. False if not empty.
# 					[--porcelain] # Output just the new user id.
# 					[--skip-email]