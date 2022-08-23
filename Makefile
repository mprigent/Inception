# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mprigent <mprigent@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/09 23:36:32 by mprigent          #+#    #+#              #
#    Updated: 2022/08/22 02:08:47 by mprigent         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

PATH_YML = ./srcs/docker-compose.yml
HOME_PATH = /home/user42/

all:
	@mkdir -p $(HOME_PATH)/data
	@mkdir -p $(HOME_PATH)/data/wordpress
	@mkdir -p $(HOME_PATH)/data/mariadb
	@sudo docker-compose -f $(PATH_YML) up -d --build

re: clean all

stop:
	@sudo docker-compose -f $(PATH_YML) stop

clean: stop
	@sudo docker-compose -f $(PATH_YML) down -v

fclean: clean
	@sudo rm -rf $(HOME_PATH)/data/wordpress
	@sudo rm -rf $(HOME_PATH)/data/mariadb
	@sudo docker system prune -af