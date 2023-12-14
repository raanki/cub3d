/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   sprites.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ranki <ranki@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/14 19:33:18 by ranki             #+#    #+#             */
/*   Updated: 2023/12/14 21:33:41 by ranki            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../cub3d.h"

void	load_sprite(t_game *game)
{
	int		width;
	int		height;
	char	*sprite_paths[4];
	int		i;

	i = 0;
	sprite_paths[0] = "srcs/exe/sprites/Brick.xpm";
	sprite_paths[1] = "srcs/exe/sprites/Gold.xpm";
	sprite_paths[2] = "srcs/exe/sprites/lawn.xpm";
	sprite_paths[3] = "srcs/exe/sprites/pipe.xpm";
	while (i < 4)
	{
		game->sprite[i] = calloc(1, sizeof(t_sprite));
		if (!game->sprite)
			exit(EXIT_FAILURE);
		game->sprite[i]->img = mlx_xpm_file_to_image(game->mlx->mlx_p, sprite_paths[i], &width, &height);
		if (!game->sprite[i]->img)
		{
			printf("Erreur lors du chargement du sprite : %s\n", sprite_paths[i]);
			free_game(game);
			exit(EXIT_FAILURE);
		}
		game->sprite[i]->addr = mlx_get_data_addr(game->sprite[i]->img, &game->sprite[i]->bits_per_pixel,
				&game->sprite[i]->line_length, &game->sprite[i]->endian);
		game->sprite[i]->width = width;
		game->sprite[i]->height = height;
		i++;
	}
}

void	draw_sprite_column(t_game *game, int screen_x, int start, int end, int sprite_x, int wich)
{
	int	color;
	int	y;
	int	d;
	int	tex_y;
	
	for (int screen_y = start; screen_y < end; screen_y++)
	{
		d = screen_y * 256 - S_H * 128 + (end - start) * 128; 
		tex_y = ((d * game->sprite[wich]->height) / (end - start)) / 256;
		color = *(int *)(game->sprite[wich]->addr + (tex_y * game->sprite[wich]->line_length + sprite_x * (game->sprite[wich]->bits_per_pixel / 8)));
		my_mlx_pixel_put(game, screen_x, screen_y, color);
	}
}
