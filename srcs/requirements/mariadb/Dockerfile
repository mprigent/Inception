# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mprigent <mprigent@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/09 23:36:32 by mprigent          #+#    #+#              #
#    Updated: 2022/09/13 15:01:20 by mprigent         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

# MAJ of apt-get, to get the last version of packages
RUN apt-get update && apt-get upgrade -y

# Install MariaDB server (MySQL)
RUN apt-get install mariadb-server -y

# Copy into the container the config file of MariaDB from folder conf
COPY conf/my.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the bash script to create the database and the user into the container
COPY conf/auto_config.sh /auto_config.sh

# Execute the bash script to create the database and the user
ENTRYPOINT ["bash", "auto_config.sh"]

# Expose the only port allowed by the subject (MySQL)
EXPOSE 3306