/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   cub3d.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ranki <ranki@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/13 22:12:05 by ranki             #+#    #+#             */
/*   Updated: 2023/12/14 23:13:27 by ranki            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef CUB3D_H
#define CUB3D_H

//****************************************************************
//****************************************************************
//******************************* INCLUDES ***********************
//****************************************************************
//****************************************************************

# include <stdio.h>
# include <stdlib.h>
# include <unistd.h>
# include <fcntl.h>
# include <math.h>
# include <string.h>
# include "./minilibx-linux/mlx.h"
# include "./minilibx-linux/mlx_int.h"

//****************************************************************
//****************************************************************
//******************************** DEFINES ***********************
//****************************************************************
//****************************************************************

# define S_W 1900
# define S_H 1000
# define TILE_SIZE 30
# define FOV 60
# define ROTATION_SPEED 0.045
# define PLAYER_SPEED 4
# define M_PI 3.14159265358979323846 
# define COLOR_CEILING 0xFF96AD00
# define COLOR_FLOOR 0xFFFF00C3
# define SPRITE_WEST "srcs/exe/sprites/one.xpm"
# define SPRITE_EAST "srcs/exe/sprites/two.xpm"
# define SPRITE_NORTH "srcs/exe/sprites/four.xpm"
# define SPRITE_SOUTH "srcs/exe/sprites/three.xpm"

//*****************************************************************
//*****************************************************************
//******************************* STUCTURES ***********************
//*****************************************************************
//*****************************************************************

typedef struct s_player //the player structure
{
	int		plyr_x;
	int		plyr_y;
	double	angle;
	float	fov_rd;
	int		rot;
	int		l_r;
	int		u_d;
}	t_player;

typedef struct s_ray
{
	double	ray_ngl;
	double	distance;
	int		flag;
}	t_ray;

typedef struct s_map
{
	char	**map2d;
	int		p_x;
	int		p_y;
	int		w_map;
	int		h_map;
}	t_map;

typedef struct s_mlx
{
	void	*img;
	char	*addr;
	int		bits_per_pixel;
	int		line_length;
	void	*mlx_p;
	void	*win_p;
	int		endian;
}	t_mlx;

typedef struct s_sprite
{
	void	*img;
	char	*addr;
	int		bits_per_pixel;
	int		line_length;
	int		endian;
	int		width;
	int		height;
}	t_sprite;

typedef struct t_game
{
	t_player	*player;
	t_ray		*ray;
	t_map		*map;
	t_mlx		*mlx;
	t_sprite	**sprite;
}				t_game;

//************************************************************
//************************************************************
//**************************** FUNCTIONS *********************
//************************************************************
//************************************************************

//************************************************************
//************************* EXE ******************************
//************************************************************

void	init_map_and_pos_player(t_game *game);
void	start_the_game(t_game *game);
int		game_loop(void);
void	init_the_player(t_game *game);
t_game	*game_instance(void);
void	cast_rays(t_game *game);
void	render_wall(t_game *game, int ray);
void	draw_wall(t_game *game, int ray, int t_pix, int b_pix);
float	nor_angle(float angle);
void	free_game(t_game *game);
void	init_ray(t_game *game);
void	hook(t_game *game, double move_x, double move_y);
int		mlx_key(int key, void *gam);
int		ft_reles(int key, t_game *game);
void	init_ray(t_game *game);
int		unit_circle(float angle, char c);
int		inter_check(float angle, float *inter, float *step,
			int is_horizon);
void	my_mlx_pixel_put(t_game *game, int x, int y, int color);
void	load_sprite(t_game *game);
void	draw_sprite_column(t_game *game, int screen_x,
			int start, int end, int sprite_x, int wich);

#endif