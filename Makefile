# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ranki <ranki@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/17 09:49:26 by ranki             #+#    #+#              #
#    Updated: 2023/12/13 22:12:07 by ranki            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = cub3d 

SRC = main.c \
srcs/exe/init_game.c\
\
srcs/exe/ray.c\
\
srcs/exe/render.c\
\
srcs/exe/moove.c\
\
srcs/exe/utils.c\
\

OBJ = $(SRC:.c=.o)

CC = cc
CFLAGS = -Iminilibx-linux
LDFLAGS = -Lminilibx-linux
LDLIBS = -lmlx -lbsd -lXext -lX11 -lm

.SILENT:

$(NAME): $(OBJ)
	$(CC) $(OBJ) -o $(NAME) $(LDFLAGS) $(LDLIBS)
	@echo "Compilation is complete. \nYou can run with \"./cub3d \" 😎"

all: $(NAME)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)
	@echo "File are deleted correctly."

re: fclean all

.PHONY: all clean fclean re

ASCII1 = echo "                	      .--..--..--..--..--..--. \n"\
	"                	     .' \\  \`._   (_)     _   \\ \n"\
	"                	   .'    |  '._         (_)  | \n"\
	"                	   \\ _.')\\      .----..---.   / \n"\
	"                	   |_.'  |    /    .-\\-.  \\  | \n"\
	"                	   \\     0|    |   ( O| O) | o| \n"\
	"                	    |  _  |  .--.____.'._.-.  |      Welcome to our \n"\
	"                	    \\ (_) | o         -\` .-\`  |         Minishell ! \n"\
	"                	     |    \\   |-\`-._ _ _ _ _\\ /   (by ranki & mklimina) \n"\
	"                	     \\    |   |  \`. |_||_|   | \n"\
	"                	     | o  |    \\_      \\     |     -.   .-. \n"\
	"                	     |.-.  \\     \`--..-'   O |     \`.\`-' .' \n"\
	"                	   _.'  .' |     \`-.-'      /-.__   ' .-' \n"\
	"                	 .' \`-.\` '.|='=.='=.='=.='=|._/_ \`-'.' \n"\
	"                	 \`-._  \`.  |________/\\_____|    \`-.' \n"\
	"                	    .'   .| '=' '='\\/ '=' | \n"\
	"                	    \`._.\`  '---------------' \n"\
	"                	            //___\\   //___\\ \n"\
	"                	              ||       || \n"\
	"                	              ||_.-.   ||_.-. \n"\
	"                	             (_.--__) (_.--__) \n"\

ASCII2 = echo  "⠀⠀⠀⠀⠀⠀⠀⣰⣾⠟⠛⠓⠒⠚⠃⠉⠛⠒⠖⠋⠉⠉⠛⠻⠶⠶⠚⠛⠈⠉⠙⠓⠶⠲⠞⠋⣉⠋⠛⠷⠲⠒⠖⠛⠛⠲⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⢰⣿⠟⣧⠀⠀⡀⢰⢧⢳⢦⠀⡀⠀⠂⠠⠀⢶⣄⣈⣷⣀⣺⠇⠀⠀⡀⠘⣷⣠⠿⢦⣴⡟⠀⠀⢀⠠⡶⡄⠈⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⢀⣾⠏⠀⠌⠳⣄⠀⠈⢯⣚⡬⠗⠀⡀⠁⡀⣤⠞⠉⠁⠀⠈⠉⠳⢮⡀⢀⡞⠉⠀⠀⠀⠀⠉⠳⣄⠂⠀⠓⠋⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⣰⣿⠋⠄⢡⠈⠄⣹⡀⠄⠀⠉⠚⠃⢀⠀⡐⣰⠃⠀⠀⠀⢀⣤⣤⣤⡀⠹⣟⠀⠀⠀⣠⣴⣤⣀⠀⠈⢷⡀⠀⠠⠀⠈⢳⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⢠⣿⠃⢠⠈⣤⣬⣔⠈⢷⣀⠐⠀⣞⢳⡄⠀⠀⣿⠀⠀⠀⠀⣾⣻⣼⣷⣻⣆⠸⡆⠀⢸⣟⣷⣿⡽⣆⠀⣈⡷⠶⣦⡐⠀⠈⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⢀⣼⠏⡐⠀⢾⣟⣯⣟⣷⡀⠙⣶⠀⠈⠓⠋⠀⠄⢸⡄⠀⠀⠀⢻⡵⣿⣿⣷⣻⠀⡟⠀⠸⣯⢿⣿⣿⣻⠞⠁⠀⠀⣸⣗⣀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⢺⡇⠐⡠⢉⠸⣟⡾⣽⣞⠇⡐⢸⡇⠀⢀⠐⣠⠴⠒⢋⡞⢦⡀⠈⠻⣽⣻⣏⡟⢠⡿⣄⠀⠙⢯⣿⠟⠁⠀⠠⢁⣴⠟⢲⡈⣝⣞⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠹⣷⣁⠐⡀⢂⠘⠛⠗⠋⢠⠐⡈⢷⡄⠀⣴⠃⠙⠁⢶⣠⢸⣇⡀⠀⠀⠉⢁⣠⠏⠀⠈⢓⡦⠞⠁⠀⢀⣴⡶⠟⠯⢰⣮⣅⠈⣼⠸⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠻⢷⡄⠡⡈⠔⡈⠌⠄⣂⠰⢀⠹⣆⢷⣀⠄⠘⠻⣶⣤⣈⠉⠓⠛⠚⠉⠀⠀⠠⠘⠉⣠⢤⠶⠟⠋⠁⢀⣠⣴⣿⡇⠐⠚⠁⢰⣿⠀⠀⠀⠀⠀⠀⢀⠀⢀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠸⣿⡀⠐⠠⣴⣮⡐⢀⠢⢀⠂⢹⡀⠉⠋⠉⠀⠙⣿⣿⣿⣷⣶⣤⣤⣔⣈⣀⣠⣀⣀⣀⣠⣤⣴⣾⣿⣿⣿⣿⡇⠀⠠⠀⢸⣿⠿⠛⠛⢶⡾⠟⠛⣋⡋⢿⡀⠀ \n"\
"⠀⠀⢀⣄⣀⣀⣘⣿⡾⢿⠿⢷⣧⠀⡂⠡⠈⠜⣧⠀⢀⠁⠄⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⠉⠉⠉⣿⣿⣿⠀⠀⢸⣿⣿⣿⣿⠀⠐⠀⠂⠀⢷⡀⠀⠀⠀⢿⡿⠛⢻⡄⢸⡇⠀ \n"\
"⠀⢀⣿⠋⣩⣍⣍⣙⡙⢚⡇⠀⠈⠙⠶⣿⡿⣶⡉⢷⠀⠀⠠⠈⠀⠈⢿⣿⣿⣿⣿⣿⣿⣶⣶⣶⣾⣿⣿⣿⣶⣿⣿⣿⣿⡿⠀⠀⠌⠀⠂⠈⣧⣀⣠⣴⠿⢁⣠⣸⣇⢸⡆  \n"\
"⠀⣼⡇⣸⡟⠉⠹⣿⡙⠟⠁⠀⠀⣀⣠⣿⡟⣷⣓⢨⡇⠀⢂⣤⡅⢀⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠄⢂⣤⡐⢀⣿⠉⠉⠀⠀⢾⣿⡁⠃⠈⠻⣦ \n"\
"⠀⣿⠀⣿⡃⠀⠀⠉⠛⠛⢿⣟⠛⠉⢹⣷⣻⢷⡏⠘⣧⠀⠹⡦⡝⠀⠀⡀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⢀⠀⡿⣆⢿⢸⡇⠀⠀⠀⠀⣾⢻⠃⣤⠀⣤⢻ \n"\
"⣀⡿⠀⠙⠛⠙⡷⣦⠀⠀⠈⢻⣦⠁⢂⠙⠿⠞⡁⢂⠙⣦⠀⠈⠀⣴⠳⢦⠀⠈⠻⣿⡿⡿⢿⣿⣿⢻⠿⣿⣿⣿⣿⡿⠃⠀⠠⠀⠉⠈⠁⠀⢿⡄⠀⠀⠀⠻⣦⣴⣧⣴⠷⠟ \n"\
"⣟⢠⠀⢤⠀⢼⣷⡿⠀⠀⠀⠀⣽⡆⠂⠌⡐⢀⠒⡀⢂⢸⠀⢈⠀⢯⢏⣳⠆⠀⡀⠈⠙⠿⣧⣾⣜⣫⣞⣵⣮⠿⠛⢁⡀⠀⢁⠀⠂⣱⢶⠀⢾⡇⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀ \n"\
"⠻⠿⢧⣼⡷⢴⠛⠀⠀⠀⠀⠀⢸⣷⠈⡐⣴⣷⡄⢁⠂⢼⡄⠀⠠⠈⠉⠀⠠⠀⡀⠐⠈⠑⠶⢬⣍⣉⣩⣉⣤⡴⠞⠉⠀⢀⠂⠀⡀⠉⠃⠀⢹⡥⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⣷⡀⠙⠾⠇⠠⢈⣤⣷⡮⠶⠛⠛⠛⠷⠿⢶⣿⡛⠙⠉⢛⣾⣯⡷⣷⡶⣾⣾⠷⠞⣶⣾⡷⠿⢶⣤⣤⣾⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣯⠐⠠⠈⣤⠟⡡⢂⣇⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⠶⠟⠁⠘⢻⣷⣿⡋⠈⠓⠋⠉⠁⠀⠀⠀⠀⠀⢸⣿⣤⡶⢶⣄⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣆⣷⠛⡍⢢⢑⣦⣿⣞⢷⣛⣾⣳⣻⣞⣳⡟⣶⣻⣶⣿⣾⣿⣟⡿⣷⣷⣾⣷⣻⢶⣳⣾⣶⣷⡷⢚⣩⣤⣦⢀⡿⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⡁⢎⣰⣵⣿⣿⣿⣞⣻⢿⡿⢿⡿⢿⡿⣽⣻⢿⢿⣻⢿⣟⣾⣽⣿⡿⢿⣻⣯⣿⢿⣿⢟⣡⣾⡿⣿⡇⣿⠭⣟⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣧⣾⣿⣿⣿⣿⣿⣯⣗⣯⣞⣯⣞⣷⣹⣶⣝⣾⣹⣎⣟⣿⣿⣟⣷⣹⣟⣶⣿⡹⣮⢟⡿⣟⣿⣽⣿⡇⣿⠞⣿⠀⣴⣶⣷⣶⡄ \n"\
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣛⢶⣻⣵⣿⣾⣿⣿⠟⠉⢰⡿⢀⡿⣸⣿⣯⣼⣿⣿ \n"\
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⡿⣟⣿⣿⣟⣿⣿⣻⣿⣟⣿⣿⣻⣿⣟⣿⣽⣿⣿⣽⣿⣿⣿⣿⣿⣿⡿⠟⠀⠀⠀⣸⣷⣾⣿⣿⣿⡿⣏⣿⠏ \n"\
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣻⣿⠿⠿⠿⠿⠿⠿⠿⠟⠿⠻⠟⠟⠛⠿⠟⠿⠻⠃⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣽⠾⠋⠀ \n"\
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⡀⠘⢿⣿⣿⣿⣾⣿⣿⡃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⢻⣿⠍⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣯⠀⣰⡿⢉⣿⠟⠻⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠛⠛⠋⠁⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⣿⣿⣿⣿⢻⣿⣼⡟⣡⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣹⣿⡏⣿⡏⣿⡿⡿⠋⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠿⠿⠟⠁⠸⣦⣠⡾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\

ASCII3 = echo " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⠾⠿⠷⢶⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⠿⠁⠈⠀⠀⠀⠀⣭⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⢾⠏⠀⠀⠀⠀⠀⠀⠀⣠⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⢠⣾⠟⠉⠁⠀⢀⣠⣴⡶⠶⠶⢶⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠈⠙⠓⢖⣶⣾⡏⢉⣀⣤⣤⠤⣾⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⢀⣤⣾⣭⣿⢿⡿⠋⠁⠀⠀⠀⠀⠈⠳⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠻⢉⣹⠟⠁⡼⠀⠠⠀⠀⠀⠀⠀⠀⠀⠙⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⠤⠬⠤⣼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠔⠛⠦⣖⣠⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠃⠸⣄⣰⠚⠉⢙⣶⣄⠀⢸⣿⣷⡄⠀⠙⢗⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⠀⠰⡼⠠⡽⢶⠇⠀⠀⠿⢾⣿⣷⣼⣿⣿⣷⣷⠀⢘⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⠀⢀⡇⠀⠀⢼⡆⠀⢰⣶⣿⣿⣿⣿⣿⣿⣿⣿⠀⢨⣿⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⢠⣇⠀⠀⢿⡙⢿⣿⣿⠈⢿⡯⠎⡰⠋⠉⢹⡷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⠘⡞⠀⠀⠀⣀⠼⠖⠒⠲⢽⠛⣻⠇⠀⠀⠉⣹⣧⣀⠀⠙⢿⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⢶⠇⠀⠀⠀⠀⣀⠀⢀⣀⡼⢿⣥⠤⠶⠚⢻⠁⠀⠀⠀⠀⠈⠳⣤⠤⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⢀⡞⠀⠀⠀⠀⠀⠈⠉⠉⠀⠀⠈⠘⢦⣀⣠⠟⠀⠀⠀⠀⠀⠀⠀⠈⠳⣄⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⢀⡞⠁⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⣄⠀⡀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⢀⡞⠀⢰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢧⡀⠀⠀⠀ \n"\
" ⠀⠀⠀⢀⡞⠀⠀⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡁⠀⠀ \n"\
" ⠀⠀⢎⡞⠀⠀⢠⠇⠀⠀⠀⠀⠀⠀⠀⠀⢀⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡟⢦⠀ \n"\
" ⠀⠀⡾⠀⠀⠀⣼⠀⠀⠀⠀⠀⠀⠀⠀⢀⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠟⢀⣜⠀ \n"\
" ⠰⡏⠳⣄⠄⠀⢻⠀⠀⠀⠀⠀⠀⠀⠀⡼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡦⢤⣀⣀⣤⠴⠚⠉⣀⠔⠋⡇⠀ \n"\
" ⠀⠱⣤⣈⠙⠲⢼⡆⠀⠀⠀⠀⠀⠀⣰⠁⠀⠀⠀⠀⢀⣀⣠⣤⡤⠶⠒⡿⠀⠀⠙⣇⠀⠀⠒⠉⠀⠀⢰⠃⠀ \n"\
" ⠀⠀⢧⠀⠉⠀⠀⢳⡈⠀⠀⠀⠀⢠⠏⠉⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⣰⣇⣴⡾⠷⣿⣿⣵⠄⠀⠀⢀⡏⠀⠀ \n"\
" ⠀⠀⠈⢧⡀⠀⠀⠀⠙⢄⣀⣀⡴⠋⢀⣀⣀⣀⠀⠀⠀⠀⠀⠀⢠⣾⢷⣿⣡⣤⣶⠿⠛⡏⠀⠀⣠⠟⠓⢶⡂ \n"\
" ⠀⠀⠀⠀⠱⣄⠀⠀⠀⠀⠀⡤⠖⠋⠉⠀⠀⠈⠉⠙⠒⠦⣄⡀⠈⢻⠿⠟⠋⠁⠀⠀⢰⠃⣠⠞⠁⠀⠀⢰⡇ \n"\
" ⠀⠀⠀⠀⠀⠈⠙⠦⣄⣠⠎⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠲⣇⠀⠀⠀⠀⠀⣠⡾⠯⠥⠤⠤⠖⠚⠋⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠓⠦⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⠀⠘⡦⠤⠤⠖⠚⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠓⠒⠢⠤⠤⠤⠤⠤⠤⠞⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\

ASCII4 = echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡏⠀⠀⠀⠈⠀⠁⠉⠁⠀⠀⠀⠈⠉⠁⠁⠈⣥⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⡿⠛⣻⣭⢿⣭⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⣇⣴⡟⠁⠀⠈⠻⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⣠⢀⣀⣴⣶⣆⠀⠀⠀⠀⢰⣷⣤⣤⣀⣀⠀⠀⠸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⡿⠏⠀⠀⠀⠀⠀⢹⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣶⣾⣿⣿⣿⣿⣿⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⡟⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⣠⡾⠀⠀⠀⠀⠀⠀⠀⠀⢀⡟⣿⣿⢿⡿⠿⠓⠀⠀⠀⠀⠀⠁⠉⠛⠿⡿⠉⠁⠀⠀⢷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⡟⠳⠶⠤⠴⠾⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⣠⡶⠟⠛⠛⢶⣄⠀⠀⣠⠶⠛⠉⠉⠛⢶⣄⠀⠀⠀⢸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⡗⠀⢤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡾⠁⠀⠀⠀⠀⠀⠙⣿⡿⠃⠀⠀⠀⠀⠀⠀⠘⢧⠀⠀⠸⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⡇⠀⠀⠈⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⠀⠀⠀⠀⠀⠀⠀⠀⢸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠈⣇⠀⠀⢿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⣧⡀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠃⡇⠀⠀⢀⣤⣤⣄⠀⡟⠀⣠⣤⣤⡀⠀⠀⠀⠀⠀⢸⡀⠀⢸⡗⢦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⡏⠻⠶⠴⠾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⡇⠀⢸⣿⣿⣟⣻⠀⡇⠀⣿⣿⣭⣿⠀⠀⠀⠀⠀⢸⡇⠀⠈⡇⠀⠙⢆⠀⠀⠀⠀⠀⢀⠄⠀⢸⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⡇⠀⠘⣿⣿⣿⡿⠀⣿⡆⢿⣿⣿⡿⠀⠀⠀⠀⠀⢸⡷⠀⠀⢿⡀⠀⠀⠀⠀⠐⠚⠓⠃⠀⠀⠘⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⢻⡆⣿⠀⣀⠈⠉⠉⠀⠀⣽⣧⠀⠉⠁⠀⠀⠀⠀⠀⢀⡿⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⠀⢷⡘⣦⠤⠀⠀⠀⠀⣠⣿⣿⡅⠀⠀⠀⠀⠀⠀⣠⡿⠁⠀⠀⠀⠀⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠏⠆⠈⠻⣮⣭⣤⣤⣴⡾⠟⠉⠙⢿⣶⣴⣦⣤⡴⠾⠋⠀⠀⠀⠀⠀⠀⢹⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡏⠀⠀⠀⠀⠈⠈⠉⠉⠁⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⢀⣀⣠⣤⠴⠶⠖⠒⠒⠒⠶⠤⠤⢤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣇⠀⠀⠀⠀⠀⠀⢀⡠⢼⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡏⠀⠀⠀⠀⠀⠛⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠣⠀⠀⠀⠀⠀⠀⠀⠀⢻⣠⡀⠀⠒⠒⠚⠉⠀⢸⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣷⡁⠀⠀⠀⠀⠀⠘⢾⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣄⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⣠⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠷⣄⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⣠⠞⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⠀⠀⠀⠀⢀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠛⠳⣄⠀⢸⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⡇⠀⠀⣠⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⠶⠛⠋⠉⠉⠉⠛⢶⣄⠶⠋⠁⠀⠈⠉⠙⠲⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠾⢷⣼⠀⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⠀⠀⣠⠞⠋⠀⠀⠀⠀⠀⠀⠀⠀⢠⣤⡾⠋⠁⠀⠤⠀⠀⠀⢀⡀⠀⢹⡆⠀⠀⠀⠀⠐⠲⣄⠈⠻⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠽⣄⠀⠀⠀⠀⠀ \n"\
"⠀⠀⠀⠀⠀⣠⡾⠃⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⠟⡁⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣦⣼⣧⡴⠶⢶⣄⠀⠀⠈⠻⣄⠀⠙⢦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢳⡀⠀⠀⠀ \n"\
"⠀⠀⠀⢀⣼⠟⠁⠀⠀⠀⠀⠀⣀⣠⠶⠛⠉⠔⠋⠀⠀⠀⠀⠀⠀⢀⣿⡇⠀⠀⠀⠉⠁⠀⠀⠀⢙⡇⠀⠀⠀⠙⠀⠀⠀⠈⠙⠳⠷⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⡄⠀⠀ \n"\
"⠀⢸⣀⡾⠁⠀⠀⠀⠀⠀⠔⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡿⣿⡠⣄⠀⠀⠀⠀⠀⣠⡾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠓⠦⣄⣀⠀⠀⠀⠀⠀⠀⠀⠹⣄⠀ \n"\
"⠀⢸⡞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣸⣿⣮⡛⢦⡄⣠⣴⠟⣀⣀⣠⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠲⢤⠀⠀⠀⠀⠀⠘⡆ \n"\
"⢀⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣮⣿⣓⣾⣯⡷⠛⠛⠉⠉⠉⢻⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠒⠀⠀⠀⠀⠀⠀⠀⠀⢳ \n"\
"⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠂⠀⠀⠀⠀⠀⠀⠀⠙⠿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠻⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈ \n"\
"⢸⡇⠀⠀⢀⣀⣤⣤⣴⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
"⠸⠇⠠⣴⣾⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠠⠀⠀⢠⣾⡿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣧⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄ \n"\

ASCII5 = echo " ⠀⠀⠀⠀⠀⠀⢀⣀⣤⣤⣤⣤⣀⠀⠀⠀⢀⣤⣤⣤⣀⠀⠀⢀⣠⣤⣤⣄⠀⠀ \n"\
" ⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⡟⢀⣼⠟⢉⣀⡈⠙⢷⣴⠟⠉⣀⣈⠙⢿⡆ \n"\
" ⠀⠀⣠⣾⣿⣿⠛⠛⢿⣿⣿⣿⣿⡇⢸⡇⠠⣿⣿⣿⠆⢸⣟⠀⣾⣿⣿⡇⢘⣿ \n"\
" ⠀⢰⣿⣿⣿⣿⣶⣶⣾⣿⠉⠙⣿⣇⠘⢷⣄⠙⠛⠋⣀⣾⢿⣆⠈⠛⠋⢀⣼⠏ \n"\
" ⢀⣿⣿⣿⣿⣿⣿⢿⣿⣿⣷⣴⣿⣿⣦⡈⠙⠻⣿⣿⠛⠁⠀⠙⠻⣿⡿⠛⠁⠀ \n"\
" ⢸⣿⣿⣿⡟⠁⣀⣀⠀⠙⣿⣿⡏⠀⢻⣿⣷⠀⢿⣿⠀⠀⠀⠀⢀⣿⠃⠀⠀⠀ \n"\
" ⢸⣿⣿⣿⠀⢰⣿⢿⣇⠀⠘⣿⣿⣦⣾⣿⣿⣇⠘⣿⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀ \n"\
" ⠀⢿⣿⣿⣄⠈⠁⣸⣿⠀⠀⣿⣿⣿⣿⣿⣿⣿⠀⣿⡆⠀⠀⠀⣸⡇⠀⠀⠀⠀ \n"\
" ⠀⠘⣿⣿⣿⣿⣿⣿⣿⠀⠀⢸⣿⣿⣿⣿⣿⡿⠀⢸⣷⠀⠀⢀⣿⠃⠀⠀⠀⠀ \n"\
" ⠀⢠⣾⣿⣿⣿⣿⣿⡿⠀⠀⣿⣿⣿⣿⣿⣿⣷⡄⠘⣿⡆⠀⢸⣿⠀⠀⠀⠀⠀ \n"\
" ⣠⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣿⣿⣿⣿⣿⣿⣿⣷⣶⣿⣿⣶⣿⣿⣤⠀⠀⠀⠀ \n"\
" ⣿⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀ \n"\
" ⠙⠻⠟⠛⠛⠛⠛⠿⠶⠶⠿⠛⠛⠛⠛⠻⠶⠶⠾⠟⠛⠛⠛⠻⠿⠛⠀⠀⠀⠀ \n"\

ASCII6 = echo " ⠀⠀⠀⠀⠀⣠⡾⣿⣷⢤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⣠⣤⣴⠋⠀⢻⣿⣧⣈⢳⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠰⡇⢀⣿⣀⠀⠿⠋⠙⠛⠀⡟⢦⠀⠀⠀⠀⠀⠀⠀⢀⣠⠶⠛⠉⣁⣀⣀⣀⣈⠉⠛⠶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⢀⡹⠟⠃⢈⣳⣄⠀⠀⠀⣰⠷⠋⠀⠀⠀⠀⠀⠀⣴⠯⢥⡖⣶⡿⣋⡤⠒⠒⠦⣍⠢⡀⠀⠙⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⣼⠁⠀⠀⠘⢧⣈⣷⠒⠛⣧⠀⠀⠀⠀⠀⠀⠀⡾⠭⢭⣿⣾⠏⣰⣿⣿⠀⠀⠀⠘⣷⠸⠶⢛⣩⣭⣙⡲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⡴⠙⣄⠀⠀⠀⢀⡇⠘⢻⡞⠁⠀⠀⠀⠀⠀⠀⣼⠃⠀⠀⠙⣿⡀⢿⠟⠋⠀⠀⠀⠀⣿⢀⣾⣯⠀⠀⠀⠹⣮⢳⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠛⠦⠊⢹⠁⠘⡏⠙⠶⢯⣉⠓⢦⣀⡀⠀⠀⣰⡏⠀⠀⠀⠀⠘⣷⡘⢦⣀⠀⠀⣀⡼⠋⢸⣿⡿⠀⠀⠀⠀⣿⠘⡇⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠈⠳⠶⠛⠀⠀⠀⠈⠓⢤⣀⠉⠓⢺⣄⠙⣆⠀⠀⠀⢠⣌⡛⠲⠬⠍⠉⠥⠶⣦⡘⣆⠀⠀⠀⠀⣠⡟⣸⠁⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢲⡞⠘⣆⠘⢦⠀⠀⢸⡻⢍⣦⣄⡀⠀⠀⠀⠘⠳⣬⡑⠒⠒⢚⣩⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡾⠀⠀⠈⢧⣨⣷⣤⣀⠳⢄⡈⠓⠛⢶⣦⣤⡀⠀⠀⠉⠉⠉⢹⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣇⡀⠀⣠⠎⠻⠟⠁⠈⠑⠲⠭⣑⠲⠤⠴⠟⠃⠀⠀⠀⠀⢠⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⠀⢉⡻⠃⠀⠀⠀⣰⠋⠓⠦⢄⣀⠉⡉⠓⢲⣤⡤⠤⠖⢒⣽⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡏⠉⠀⠀⠀⠀⠀⢧⣀⠀⠀⠀⢀⡽⠃⠀⠸⣧⠷⠖⠊⠉⠉⠓⠦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢦⣤⡀⠀⠀⠀⠀⠈⠉⠓⠒⠋⠀⠀⠀⢠⠋⠀⠀⡼⠋⠙⠒⠤⣄⣉⠙⠒⢶⣦⠤⡖⢒⠦ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠈⠙⠓⢤⣄⡀⠀⠀⠀⠀⠀⠀⠀⢰⡏⠑⠒⣾⠁⠀⠀⠀⠀⠀⠈⠉⠳⠿⠴⣄⣰⣯⡔ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡞⠓⣲⠞⠉⠉⠉⠻⡶⠦⣤⣀⣀⡀⠈⢳⣶⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠁⠀⠀⠀⠀⠀⢷⣤⣶⣶⣾⡿⣯⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\
" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠭⠤⠖⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ \n"\

ascii:
	@NUMBER=$$(od -An -N1 -i /dev/urandom | head -n 1 | awk '{print $$1 % 6}'); \
	case $$NUMBER in \
		0) $(ASCII1) ;; \
		1) $(ASCII2) ;; \
		2) $(ASCII3) ;; \
		3) $(ASCII4) ;; \
		4) $(ASCII5) ;; \
		5) $(ASCII6) ;; \
	esac