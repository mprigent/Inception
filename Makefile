# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mprigent <mprigent@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/09 23:36:32 by mprigent          #+#    #+#              #
#    Updated: 2022/09/20 18:10:38 by mprigent         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

PATH_YML = ./srcs/docker-compose.yml

all:
	@mkdir -p /home/user42/data
	@mkdir -p /home/user42/data/wordpress
	@mkdir -p /home/user42/data/mariadb
	@sudo docker-compose -f $(PATH_YML) up -d --build

re: clean all

stop:
	@sudo docker-compose -f $(PATH_YML) stop

clean: stop
	@sudo docker-compose -f $(PATH_YML) down -v

fclean: clean
	@sudo rm -rf /home/user42/data/wordpress
	@sudo rm -rf /home/user42/data/mariadb
	@sudo docker system prune -af
