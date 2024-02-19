/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   utils.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ranki <ranki@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/13 22:12:03 by ranki             #+#    #+#             */
/*   Updated: 2023/12/15 18:21:07 by ranki            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../cub3d.h"

void	free_mlx(t_game *game)
{
	if (game->mlx)
	{
		if (game->mlx->img)
			mlx_destroy_image(game->mlx->mlx_p, game->mlx->img);
		if (game->mlx->win_p)
		{
			mlx_clear_window(game->mlx->mlx_p, game->mlx->win_p);
			mlx_destroy_window(game->mlx->mlx_p, game->mlx->win_p);
		}
		if (game->mlx->mlx_p)
		{
			mlx_destroy_display(game->mlx->mlx_p);
			free(game->mlx->mlx_p);
		}
		free(game->mlx);
	}
}
int	ft_exit(void *param)
{
	t_game	*game;

	game = param;
	free_game(param);
	exit(0);
}

void	free_game(t_game *game)
{
	int	i;

	i = 0;
	while (game && game->map && game->map->map2d && game->map->map2d[i])
		free(game->map->map2d[i++]);
	if (game->map && game->map->map2d)
		free(game->map->map2d);
	if (game->map)
		free(game->map);
	if (game->player)
		free(game->player);
	if (game->ray)
		free(game->ray);
	if (game->sprite)
	{
		i = 0;
		while (i < 4)
		{
			mlx_destroy_image(game->mlx->mlx_p, game->sprite[i]->img);
			free(game->sprite[i++]);
		}
		free(game->sprite);
	}
	free_mlx(game);
	free(game);
}

t_game	*game_instance(void)
{
	static t_game	*game_instance;

	if (game_instance == NULL)
	{
		game_instance = calloc(1, sizeof(t_game));
		if (!game_instance)
			exit(0);
		game_instance->map = NULL;
		game_instance->player = NULL;
		game_instance->ray = NULL;
		game_instance->mlx = NULL;
	}
	return (game_instance);
}
