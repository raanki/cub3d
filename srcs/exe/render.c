/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   render.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ranki <ranki@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/13 22:12:01 by ranki             #+#    #+#             */
/*   Updated: 2023/12/17 16:09:57 by ranki            ###   ########.fr       */
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

double get_x_offset(t_sprite *texture, t_game *game)
{
    double x_offset;
	// printf("\n\ntexture->width = %d\n", texture->width);
	// printf("texture->height = %d\n", texture->height);
	// printf("TILE_SIZE = %d\n", TILE_SIZE);
	// printf("game->ray->flag = %d\n", game->ray->flag);
	// printf("game->ray->v_x = %f\n", game->ray->v_x);
	// printf("game->ray->h_y = %f\n", game->ray->h_y);

    if (game->ray->flag == 0) // Mur vertical
        x_offset = fmod(game->ray->v_x, TILE_SIZE) * (texture->width / TILE_SIZE);
    else // Mur horizontal
        x_offset = fmod(game->ray->h_y, TILE_SIZE) * (texture->width / TILE_SIZE);

    return x_offset;
}


int get_texture_color(t_game *game, t_sprite *texture, int texX, int texY)
{
    if (texX < 0 || texX >= texture->width || texY < 0 || texY >= texture->height)
        return 0; // Retourne une couleur par défaut ou transparente si en dehors des limites

    return *(int *)(texture->addr + (texY * texture->line_length + texX * (texture->bits_per_pixel / 8)));
}



int darken_color(int color)
{
    // Assombrir la couleur (diviser les composantes RGB par deux).
    // Adaptez cette fonction selon la façon dont la couleur est stockée.
    return (color >> 1) & 8355711;
}


t_sprite	*get_wall_texture(t_game *game, int flag)
{
	game->ray->ray_ngl = nor_angle(game->ray->ray_ngl);
	if (flag == 0)
	{
		if (game->ray->ray_ngl > M_PI / 2 && game->ray->ray_ngl < 3 * (M_PI / 2))
			return (game->sprite[1]); // texture est
		else
			return (game->sprite[0]); // texture ouest
	}
	else
	{
		if (game->ray->ray_ngl > 0 && game->ray->ray_ngl < M_PI)
			return (game->sprite[2]); // texture sud
		else
			return (game->sprite[3]); // texture nord
	}
}

void draw_wall(t_game *game, int ray, double t_pix, double b_pix, double wall_h)
{
    double x_o, y_o, factor;
    t_sprite *texture;
    int color;

    texture = get_wall_texture(game, game->ray->flag);
    factor = (double)texture->height / wall_h;
    x_o = get_x_offset(texture, game);
    y_o = (t_pix - ((double)S_H / 2) + (wall_h / 2)) * factor;
    if (y_o < 0)
        y_o = 0;

	if (x_o != 0 || y_o != 0) {
		printf("\n\n Donc x_o = %f\n", x_o);
		printf("y_o = %f\n", y_o);
	}
    while (t_pix < b_pix)
    {
        color = get_texture_color(game, texture, (int)x_o, (int)y_o);
        my_mlx_pixel_put(game, ray, t_pix++, color);
        y_o += factor;
    }
}




//flag = 0 => vertical => west or east wall => 0 or 1 => offset = y % TILE_SIZE
void	render_wall(t_game *game, int ray)
{
	double	wall_h;
	double	b_pix;
	double	t_pix;

	game->ray->distance *= cos(nor_angle(game->ray->ray_ngl - game->player->angle));
	wall_h = (TILE_SIZE / game->ray->distance) * ((S_W / 2) / tan(game->player->fov_rd / 2));
	b_pix = (S_H / 2) + (wall_h / 2);
	t_pix = (S_H / 2) - (wall_h / 2);
	if (b_pix > S_H)
		b_pix = S_H;
	if (t_pix < 0)
		t_pix = 0;
	draw_wall(game, ray, t_pix, b_pix, wall_h);
	draw_floor_ceiling(game, ray, t_pix, b_pix);
}
