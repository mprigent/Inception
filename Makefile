# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mprigent <mprigent@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/09 23:36:32 by mprigent          #+#    #+#              #
#    Updated: 2022/08/09 23:38:08 by mprigent         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS 			= ./srcs
DOCKER			= sudo docker
COMPOSE 		= cd srcs/ && sudo docker-compose

# correc	:
# 			@ sudo docker stop $(docker ps -qa)
# 			@ sudo docker rm $(docker ps -qa) 
# 			@ sudo docker rmi -f $(docker images -qa)
# 			@ sudo docker volume rm $(docker volume ls -q)
# 			@ sudo docker network rm $(docker ls -q)