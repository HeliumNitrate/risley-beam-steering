function [pos_x, pos_y, pos_z] = ray_coord(xRay_init, yRay_init, zRay_init, ...
    ang_start_x, ang_start_y, z_surf_center, Xgrid, Ygrid, prism_surf_z, ~, ~)

prism_surf = prism_surf_z + z_surf_center;
z_final = max(prism_surf(:));

z_axis_ray = linspace(zRay_init, z_final, 100);
z_thickness = linspace(0, (z_final - zRay_init), 100);
x_axis_ray = z_thickness * tand(ang_start_y) + xRay_init;
y_axis_ray = z_thickness * tand(ang_start_x) + yRay_init;

ray_coord(:, 1) = x_axis_ray;      % ray segment coordinates between final two surfaces
ray_coord(:, 2) = y_axis_ray;
ray_coord(:, 3) = z_axis_ray;
z_surf_min = min(prism_surf(:));
z_surf_max = max(prism_surf(:));
z_ray_near_ind = z_axis_ray >= z_surf_min & z_axis_ray <= z_surf_max;   % ray coordinates near the surface
ray_coord_near = ray_coord(z_ray_near_ind, :);
surf_x = Xgrid(:);
surf_y = Ygrid(:);
surf_z = prism_surf(:);
surf_lin(:, 1) = surf_x;
surf_lin(:, 2) = surf_y;
surf_lin(:, 3) = surf_z;

for i = 1:size(ray_coord_near, 1)
    ray = ray_coord_near(i, :);
    ray_surf_diff = abs(ray - surf_lin);
    nearest(i) = min(sum(ray_surf_diff, 2));
end
ind = nearest == min(nearest);
ray_surf_inter1 = ray_coord_near(ind, :);
pos_x = ray_surf_inter1(1, 1);
pos_y = ray_surf_inter1(1, 2);
pos_z = ray_surf_inter1(1, 3);
