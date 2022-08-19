# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mprigent <mprigent@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/09 23:36:32 by mprigent          #+#    #+#              #
#    Updated: 2022/08/19 17:54:12 by mprigent         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	inception

all		: 	$(NAME)

$(NAME)		:
				sudo docker-compose -f srcs/docker-compose.yml up

install		:
				sudo docker-compose -f srcs/docker-compose.yml up --force-recreate --build

clean		:	
				sudo docker-compose -f srcs/docker-compose.yml down
re		:	fclean
				sudo docker rm -f $(docker ps -aq);sudo docker rmi -f $(docker images -q);sudo docker builder prune;sudo docker-compose -f srcs/docker-compose.yml up --force-recreate --build

fclean		:	clean
				sudo rm -rf /home/motoure/data/pages/* /home/motoure/data/db/* /home/motoure/data/socket/*

.PHONY		:	all clean_host clean fclean
