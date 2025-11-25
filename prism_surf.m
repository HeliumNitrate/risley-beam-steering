function [X, Y, final_surf] = prism_surf(norm_x, norm_y, surf_half_length)

span = -surf_half_length:1:surf_half_length;
a0 = zeros(1, length(span));
a1 = 1:length(span);
base_surf = meshgrid(a0, a1);

[X, Y] = meshgrid(span, span);
inc_Y = Y * tand(norm_x);
inc_X = X * tand(norm_y);
final_surf = base_surf + inc_X + inc_Y;
