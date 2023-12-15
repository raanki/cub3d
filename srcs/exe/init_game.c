/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   init_game.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ranki <ranki@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/13 22:12:00 by ranki             #+#    #+#             */
/*   Updated: 2023/12/15 18:09:53 by ranki            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../cub3d.h"

void	init_map_and_pos_player(t_game *game)
{
	t_map	*map;

	map = calloc(1, sizeof(t_map));
	if (!map)
		exit(0);
	game->map = map;
	map->map2d = calloc(10, sizeof(char *));
	if (!map->map2d)
		exit(0);
	map->map2d[0] = strdup("1111111111111111111111111");
	map->map2d[1] = strdup("1000000000000000000100001");
	map->map2d[2] = strdup("1001000000000P00000000001");
	map->map2d[3] = strdup("1001000000000000001000001");
	map->map2d[4] = strdup("1001000000000000001000001");
	map->map2d[5] = strdup("1001000000100000001000001");
	map->map2d[6] = strdup("1001000000000000001000001");
	map->map2d[7] = strdup("1001000000001000001000001");
	map->map2d[8] = strdup("1111111111111111111111111");
	map->map2d[9] = NULL;
	map->p_y = 3;
	map->p_x = 14;
	map->w_map = 25;
	map->h_map = 9;
}

void	start_the_game(t_game *game)
{
	t_mlx	*mlx;

	mlx = calloc(1, sizeof(t_mlx));
	if (!mlx)
		exit(0);
	game->mlx = mlx;
	game->mlx->mlx_p = mlx_init();
	if (!game->mlx->mlx_p) {
		printf("Init est null\n");
		exit (0);
	}
	game->sprite = calloc(4, sizeof(t_sprite *));
	if (!game->sprite)
		exit(0);
	mlx->win_p = mlx_new_window(mlx->mlx_p, S_W, S_H, "Cub3D");
	mlx->img = mlx_new_image(mlx->mlx_p, S_W, S_H);
	load_sprite(game);
	init_the_player(game);
	mlx_loop_hook(mlx->mlx_p, &game_loop, game);
	mlx_hook(game->mlx->win_p, KeyRelease, KeyReleaseMask, &ft_reles, game);
	mlx_hook(mlx->win_p, KeyPress, KeyPressMask, mlx_key, game);
	mlx_loop(mlx->mlx_p);
}

void	init_the_player(t_game *game)
{
	t_player	*player;

	player = calloc(1, sizeof(t_player));
	if (!player)
		exit(0);
	game->player = player;
	player->plyr_x = game->map->p_x * TILE_SIZE + TILE_SIZE / 2;
	player->plyr_y = game->map->p_y * TILE_SIZE + TILE_SIZE / 2;
	player->fov_rd = (FOV * M_PI) / 180;
	player->angle = M_PI;
}

int	game_loop(void)
{
	t_game	*game;

	game = game_instance();
	mlx_destroy_image(game->mlx->mlx_p, game->mlx->img);
	game->mlx->img = mlx_new_image(game->mlx->mlx_p, S_W, S_H);
	game->mlx->addr = mlx_get_data_addr(game->mlx->img,
			&game->mlx->bits_per_pixel, &game->mlx->line_length,
			&game->mlx->endian);
	hook(game, 0, 0);
	cast_rays(game);
	mlx_put_image_to_window(game->mlx->mlx_p, game->mlx->win_p,
		game->mlx->img, 0, 0);
	return (0);
}
