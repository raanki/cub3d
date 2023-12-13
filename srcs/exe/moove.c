/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   moove.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ranki <ranki@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/13 22:11:58 by ranki             #+#    #+#             */
/*   Updated: 2023/12/13 22:46:00 by ranki            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../cub3d.h"

int	ft_reles(int key, t_game *game)
{
	if (key == XK_d || key == 100)
	{
		game->player->l_r = 0;
	}
	else if (key == XK_a || key == 113)
	{
		game->player->l_r = 0;
	}
	else if (key == XK_s || key == 115)
	{
		game->player->u_d = 0;
	}
	else if (key == XK_w || key == 122)
	{
		game->player->u_d = 0;
	}
	else if (key == XK_Left || key == 65361)
	{
		game->player->rot = 0;
	}
	else if (key == XK_Right || key == 65363)
	{
		game->player->rot = 0;
	}
	return (0);
}

int	mlx_key(int key, void *gam)
{
	t_game	*game;

	game = gam;
	if (key == XK_Escape)
	{
		free_game(game);
		exit(0);
	}
	else if (key == XK_a || key == 113)
		game->player->l_r = -1;
	else if (key == XK_d || key == 100)
		game->player->l_r = 1;
	else if (key == XK_s || key == 115)
		game->player->u_d = -1;
	else if (key == XK_w || key == 122)
		game->player->u_d = 1;
	else if (key == XK_Left || key == 65361)
		game->player->rot = -1;
	else if (key == XK_Right || key == 65363)
		game->player->rot = 1;
}

void	rotate_player(t_game *game, int i)
{
	if (i == 1)
	{
		game->player->angle += ROTATION_SPEED;
		if (game->player->angle > 2 * M_PI)
			game->player->angle -= 2 * M_PI;
	}
	else
	{
		game->player->angle -= ROTATION_SPEED;
		if (game->player->angle < 0)
			game->player->angle += 2 * M_PI;
	}
}

void	move_player(t_game *game, double move_x, double move_y)
{
	int	map_grid_y;
	int	map_grid_x;
	int	new_x;
	int	new_y;

	new_x = roundf(game->player->plyr_x + move_x);
	new_y = roundf(game->player->plyr_y + move_y);
	map_grid_x = (new_x / TILE_SIZE);
	map_grid_y = (new_y / TILE_SIZE);
	if (game->map->map2d[map_grid_y][map_grid_x] != '1' &&
		(game->map->map2d[map_grid_y][game->player->plyr_x /
			TILE_SIZE] != '1' &&
			game->map->map2d[game->player->plyr_y /
				TILE_SIZE][map_grid_x] != '1'))
	{
		game->player->plyr_x = new_x;
		game->player->plyr_y = new_y;
	}
}

void	hook(t_game *game, double move_x, double move_y)
{
	if (game->player->rot == 1)
		rotate_player(game, 1);
	if (game->player->rot == -1)
		rotate_player(game, 0);
	if (game->player->l_r == 1)
	{
		move_x = -sin(game->player->angle) * PLAYER_SPEED;
		move_y = cos(game->player->angle) * PLAYER_SPEED;
	}
	if (game->player->l_r == -1)
	{
		move_x = sin(game->player->angle) * PLAYER_SPEED;
		move_y = -cos(game->player->angle) * PLAYER_SPEED;
	}
	if (game->player->u_d == 1)
	{
		move_x = cos(game->player->angle) * PLAYER_SPEED;
		move_y = sin(game->player->angle) * PLAYER_SPEED;
	}
	if (game->player->u_d == -1)
	{
		move_x = -cos(game->player->angle) * PLAYER_SPEED;
		move_y = -sin(game->player->angle) * PLAYER_SPEED;
	}
	move_player(game, move_x, move_y);
}
