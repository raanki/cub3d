/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   render.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ranki <ranki@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/13 22:12:01 by ranki             #+#    #+#             */
/*   Updated: 2023/12/13 22:38:16 by ranki            ###   ########.fr       */
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
		my_mlx_pixel_put(game, ray, i++, 0xB99470FF); // floor
	i = 0;
	while (i < t_pix)
		my_mlx_pixel_put(game, ray, i++, 0x89CFF3FF); // ceiling
}

int	get_color(t_game *game, int flag)
{
	game->ray->ray_ngl = nor_angle(game->ray->ray_ngl);
	if (flag == 0)
	{
		if (game->ray->ray_ngl > M_PI / 2
			&& game->ray->ray_ngl < 3 * (M_PI / 2))
			return (0xB5B5B5FF); // west wall
		else
			return (0xB5B5B5FF); // east wall
	}
	else
	{
		if (game->ray->ray_ngl > 0 && game->ray->ray_ngl < M_PI)
			return (0xF5F5F5FF); // south wall
		else
			return (0xF5F5F5FF); // north wall
	}
}

void	draw_wall(t_game *game, int ray, int t_pix, int b_pix)
{
	int	color;

	color = get_color(game, game->ray->flag);
	while (t_pix < b_pix)
		my_mlx_pixel_put(game, ray, t_pix++, color);
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
