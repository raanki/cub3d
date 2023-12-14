/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   render.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ranki <ranki@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/13 22:12:01 by ranki             #+#    #+#             */
/*   Updated: 2023/12/14 22:48:43 by ranki            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../cub3d.h"

void	my_mlx_pixel_put(t_game *game, int x, int y, int color)
{
	char	*dst;

	if (x < 0 || x >= S_W || y < 0 || y >= S_H)
	{
		return ;
	}
	dst = game->mlx->addr + (y * game->mlx->line_length
			+ x * (game->mlx->bits_per_pixel / 8));
	*(unsigned int *)dst = color;
}

float	nor_angle(float angle)
{
	if (angle < 0)
		angle += (2 * M_PI);
	if (angle > (2 * M_PI))
		angle -= (2 * M_PI);
	return (angle);
}

void	draw_floor_ceiling(t_game *game, int ray, int t_pix, int b_pix)
{
	int	i;
	int	c;

	i = b_pix;
	while (i < S_H)
		my_mlx_pixel_put(game, ray, i++, COLOR_FLOOR);
	i = 0;
	while (i < t_pix)
		my_mlx_pixel_put(game, ray, i++, COLOR_CEILING);
}

int	which_wall(t_game *game, int flag)
{
	game->ray->ray_ngl = nor_angle(game->ray->ray_ngl);
	if (flag == 0)
	{
		if (game->ray->ray_ngl > M_PI / 2
			&& game->ray->ray_ngl < 3 * (M_PI / 2))
			return (0); // west wall
		else
			return (1); // east wall
	}
	else
	{
		if (game->ray->ray_ngl > 0 && game->ray->ray_ngl < M_PI)
			return (2); // south wall
		else
			return (3); // north wall
	}
}

void draw_wall(t_game *game, int ray, int t_pix, int b_pix)
{
	int wall;

	wall = which_wall(game, game->ray->flag);
    if (game->sprite)
        draw_sprite_column(game, ray, t_pix, b_pix, ray % game->sprite[wall]->width, wall);
}


void	render_wall(t_game *game, int ray)
{
	double	wall_h;
	double	b_pix;
	double	t_pix;

	game->ray->distance *= cos(nor_angle(game->ray->ray_ngl
				- game->player->angle));
	wall_h = (TILE_SIZE / game->ray->distance)
		* ((S_W / 2) / tan(game->player->fov_rd / 2));
	b_pix = (S_H / 2) + (wall_h / 2);
	t_pix = (S_H / 2) - (wall_h / 2);
	if (b_pix > S_H)
		b_pix = S_H;
	if (t_pix < 0)
		t_pix = 0;
	draw_wall(game, ray, t_pix, b_pix);
	draw_floor_ceiling(game, ray, t_pix, b_pix);
}
