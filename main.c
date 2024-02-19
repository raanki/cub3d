/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ranki <ranki@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/13 22:11:52 by ranki             #+#    #+#             */
/*   Updated: 2023/12/13 22:30:29 by ranki            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "cub3d.h"

int	main(int argc, char **argv, char **env)
{
	t_game	*game;

	game = game_instance();
	game->map = NULL;
	game->player = NULL;
	game->ray = NULL;
	game->mlx = NULL;
	init_ray(game);
	init_map_and_pos_player(game);
	start_the_game(game);
	free_game(game);
	printf("Hello, World!\n");
	return (0);
}