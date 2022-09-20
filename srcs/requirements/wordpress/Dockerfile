# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mprigent <mprigent@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/25 17:40:17 by mprigent           #+#    #+#              #
#    Updated: 2022/09/12 04:24:22 by mprigent          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get upgrade -y

# installe wget pour installer WP
RUN apt-get -y install wget

# installe PHP 
RUN apt-get install -y php7.3\
	php-fpm\
	php-mysql\
	mariadb-client

# indique dans quel dossier on veut telecharger le fichier en utilisant -P
RUN wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www

# décompresse le fichier pour obtenir le dossier WP puis supprime le .tar (compressé) qui ne sert plus à rien
RUN cd /var/www && tar -xzf wordpress-6.0.tar.gz && rm wordpress-6.0.tar.gz

# donne les droits à root d'écrire dans ce dossier
RUN	chown -R root:root /var/www/wordpress

# installe la CLI de WP(interface textuelle qui traite les commandes vers un programme informatique -> pratique pour la config automatique -mdp, nom, host)
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# donne les droits à la CLI et place les binaires
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# copie le fichier de config dans le container 
COPY	./conf/php.conf	/etc/php/7.3/fpm/pool.d/www.conf
COPY	conf/auto_config.sh auto_config.sh

ENTRYPOINT ["bash", "auto_config.sh"]