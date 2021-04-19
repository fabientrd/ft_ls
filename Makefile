# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    Makefile                                         .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: ftreand <marvin@le-101.fr>                 +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/10/09 14:43:44 by ftreand      #+#   ##    ##    #+#        #
#    Updated: 2018/10/09 14:54:21 by ftreand     ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

.PHONY: all re clean fclean

NAME = ft_ls

HEADER = ft_ls.h
SRC_PATH = ./src/
OBJ_PATH = ./obj/
LIBFT_PATH = ./libft/
LIBFT = $(LIBFT_PATH)libft.a
LIBFT_INC = -L $(LIBFT_PATH) -lft
INCLUDE = -I ./includes/ -I $(LIBFT_PATH)includes

CC = gcc

COLOR = echo

CC_FLAGS = -Wall -Werror -Wextra

SRC = main.c \
	  ft_recup_info.c \
	  ft_recup_stats.c \
	  ft_padding.c \
	  ft_sort_list.c \
	  ft_display.c \
	  ft_recursive.c \
	  ft_fill_struct.c \
	  ft_free_list.c \
	  ft_error.c \
	  ft_opti.c \
	  ft_opti2.c \
	  ft_opti_recu.c \
	  ft_opti_recu2.c \
	  ft_display_color.c \
	  ft_display_color2.c \
	  ft_major_minor.c \
	  ft_acl.c \

OBJ = $(addprefix $(OBJ_PATH), $(SRC:.c=.o))

all: $(NAME)

$(NAME): $(OBJ)
	@make -C $(LIBFT_PATH)
	@$(CC) $(CC_FLAGS) $(OBJ) -L $(LIBFT_PATH) -lft -o $(NAME)
	@ printf "\033[1mCompilation du projet \033[34m%-16s$@\033[0m \033[1men \033[31m%-17s$@\033[0m ✅\n"

$(OBJ_PATH)%.o: $(SRC_PATH)%.c
	@mkdir -p $(OBJ_PATH)
	@ $(CC) $(CC_FLAGS) $(INCLUDE) -o $@ -c $<
	@ printf "\033[1mCompilation de \033[36m%-25s\033[37m\ten \033[32m%-26s\033[0m ✅\n" $< $@

clean:
	@/bin/rm -rf $(OBJ_PATH)
	@make -C $(LIBFT_PATH) clean

fclean: clean
	@/bin/rm -f $(NAME)
	@make -C $(LIBFT_PATH) fclean

re: fclean all
