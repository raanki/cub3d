/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ray.c                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ranki <ranki@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/13 22:11:56 by ranki             #+#    #+#             */
/*   Updated: 2023/12/13 22:54:16 by ranki            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../cub3d.h"

int	wall_hit(float x, float y, t_game *game)
{
	int	x_m;
	int	y_m;

	if (x < 0 || y < 0)
		return (0);
	x_m = floor (x / TILE_SIZE);
	y_m = floor (y / TILE_SIZE);
	if ((y_m >= game->map->h_map || x_m >= game->map->w_map))
		return (0);
	if (game->map->map2d[y_m] && x_m <= (int)strlen(game->map->map2d[y_m]))
		if (game->map->map2d[y_m][x_m] == '1')
			return (0);
	return (1);
}

float	get_h_inter(t_game *game, float angl)
{
	float	h_x;
	float	h_y;
	float	x_step;
	float	y_step;
	int		pixel;

	y_step = TILE_SIZE;
	x_step = TILE_SIZE / tan(angl);
	h_y = floor(game->player->plyr_y / TILE_SIZE) * TILE_SIZE;
	pixel = inter_check(angl, &h_y, &y_step, 1);
	h_x = game->player->plyr_x + (h_y - game->player->plyr_y) / tan(angl);
	if ((unit_circle(angl, 'y') && x_step > 0)
		|| (!unit_circle(angl, 'y') && x_step < 0))
		x_step *= -1;
	while (wall_hit(h_x, h_y - pixel, game))
	{
		h_x += x_step;
		h_y += y_step;
	}
	return (sqrt(pow(h_x - game->player->plyr_x, 2)
			+ pow(h_y - game->player->plyr_y, 2)));
}

float	get_v_inter(t_game *game, float angl)
{
	float	v_x;
	float	v_y;
	float	x_step;
	float	y_step;
	int		pixel;

	x_step = TILE_SIZE;
	y_step = TILE_SIZE * tan(angl);
	v_x = floor(game->player->plyr_x / TILE_SIZE) * TILE_SIZE;
	pixel = inter_check(angl, &v_x, &x_step, 0);
	v_y = game->player->plyr_y + (v_x - game->player->plyr_x) * tan(angl);
	if ((unit_circle(angl, 'x') && y_step < 0)
		|| (!unit_circle(angl, 'x') && y_step > 0))
		y_step *= -1;
	while (wall_hit(v_x - pixel, v_y, game))
	{
		v_x += x_step;
		v_y += y_step;
	}
	return (sqrt(pow(v_x - game->player->plyr_x, 2)
			+ pow(v_y - game->player->plyr_y, 2)));
}

void	cast_rays(t_game *game)
{
	double	h_inter;
	double	v_inter;
	int		ray;

	ray = 0;
	game->ray->ray_ngl = game->player->angle - (game->player->fov_rd / 2);
	while (ray < S_W)
	{
		game->ray->flag = 0;
		h_inter = get_h_inter(game, nor_angle(game->ray->ray_ngl));
		v_inter = get_v_inter(game, nor_angle(game->ray->ray_ngl));
		if (v_inter <= h_inter)
			game->ray->distance = v_inter;
		else
		{
			game->ray->distance = h_inter;
			game->ray->flag = 1;
		}
		render_wall(game, ray);
		ray++;
		game->ray->ray_ngl += (game->player->fov_rd / S_W);
	}
}
