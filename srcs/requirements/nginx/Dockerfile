# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mprigent <mprigent@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/09 23:36:32 by mprigent          #+#    #+#              #
#    Updated: 2022/09/13 16:25:18 by mprigent         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# OS sous lequel doit tourner la VM
FROM debian:buster

# verifie les MAJ, installe Nginx, vim et curl
RUN apt-get update && apt-get upgrade -y
RUN apt install nginx -y

# télécharge OpenSSL (outil principal de gestion/création de certificats SSL)
RUN apt-get install openssl -y

# crée un dossier pour stocker certificat et connexion sécurisée
RUN mkdir -p /etc/nginx/ssl

# req crée et traite principalement des demandes de certificats au format PKCS#10, -x509 pour préciser le type du certificat, -nodes = clé privée sans mot de passe, -subj permet de préremplir le prompt qui requiert certaines infos 
RUN openssl req -newkey rsa:4096 -days 42 -nodes -x509 \
-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=mprigent.42.fr/UID=mprigent" \
-out /etc/ssl/certs/inception.crt \
-keyout /etc/ssl/private/inception.key

# fichier à copier depuis repertoire nginx installé au début -> endroit ou le copier dans la VM
COPY conf/nginx.conf /etc/nginx/nginx.conf

# droits sur ce dont on a besoin (root principal et utilisateur principal)
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Lance nginx en premier plan et non en background pour que le container ne se stop pas
CMD [ "nginx", "-g", "daemon off;" ]
