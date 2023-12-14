/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ray_part2.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ranki <ranki@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/13 22:52:15 by ranki             #+#    #+#             */
/*   Updated: 2023/12/14 23:11:43 by ranki            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../cub3d.h"

/**
 * Initialise la structure de rayons pour le jeu.
 *
 * @param game - Pointeur vers la structure de jeu.
 */
void	init_ray(t_game *game)
{
	t_ray	*ray;

	ray = calloc(1, sizeof(t_ray));
	if (!ray)
		exit(0);
	game->ray = ray;
	ray->ray_ngl = 0;
	ray->distance = 0;
	ray->flag = 0;
}

/**
 * Vérifie si un angle donné est dans le demi-cercle unitaire autour de l'axe X ou Y.
 *
 * @param angle - L'angle à vérifier.
 * @param c - Caractère 'x' ou 'y' pour spécifier l'axe à vérifier.
 * @return 1 si l'angle est dans le demi-cercle unitaire, sinon 0.
 */
int	unit_circle(float angle, char c)
{
	if (c == 'x')
	{
		if (angle > 0 && angle < M_PI)
			return (1);
	}
	else if (c == 'y')
	{
		if (angle > (M_PI / 2) && angle < (3 * M_PI) / 2)
			return (1);
	}
	return (0);
}

/**
 * Vérifie et ajuste les intersections des rayons avec les murs du jeu.
 *
 * @param angle - L'angle du rayon.
 * @param inter - Pointeur vers la position de l'intersection à vérifier.
 * @param step - Pointeur vers le pas du rayon.
 * @param is_horizon - Indique si le rayon est horizontal (1) ou vertical (0).
 * @return 1 si l'intersection est valide, -1 si elle est ajustée.
 */
int	inter_check(float angle, float *inter, float *step, int is_horizon)
{
	if (is_horizon)
	{
		if (angle > 0 && angle < M_PI)
		{
			*inter += TILE_SIZE;
			return (-1);
		}
		*step *= -1;
	}
	else
	{
		if (!(angle > M_PI / 2 && angle < 3 * M_PI / 2))
		{
			*inter += TILE_SIZE;
			return (-1);
		}
		*step *= -1;
	}
	return (1);
}
