# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mprigent <mprigent@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/09 23:36:32 by mprigent          #+#    #+#              #
#    Updated: 2022/09/28 15:54:22 by mprigent         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

PATH_YML = ./srcs/docker-compose.yml
# HOME_PATH = /home/mprigent/

all:
	@mkdir -p /home/mprigent/data
	@mkdir -p /home/mprigent/data/wordpress
	@mkdir -p /home/mprigent/data/mariadb
	@sudo docker-compose -f $(PATH_YML) up -d --build

re: clean all

stop:
	@sudo docker-compose -f $(PATH_YML) stop

clean: stop
	@sudo docker-compose -f $(PATH_YML) down -v

fclean: clean
	@sudo rm -rf /home/mprigent/data/wordpress
	@sudo rm -rf /home/mprigent/data/mariadb
	@sudo docker system prune -af
