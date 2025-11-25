function [norm_x, norm_y] = surface_norms(prism_ang, tilt_z)

norm_x = atand(cosd(tilt_z) * tand(prism_ang));   % surface tilt about x axis
norm_y = atand(sind(tilt_z) * tand(prism_ang));   % surface tilt about y axis