function [Z_surf1, Z_surf2] = plt_layout(ray_x1, ray_y1, ray_z1, ray_x2, ray_y2, ray_z2, ...
    Xgrid, Ygrid, Zgrid1, Zgrid2, prism_z, prism_thickness, prism_no)

Z_surf1 = Zgrid1 + prism_z;
Z_surf2 = Zgrid2 + prism_z + prism_thickness;

if prism_thickness == 0
    plot3(ray_x1, ray_y1, ray_z1, 'LineWidth', 3)
    surf(Xgrid, Ygrid, Z_surf1)
    xlabel 'x axis'
    ylabel 'y axis'
    zlabel 'z axis'
    view(90, 180)
    camup([0 1 0])
    axis equal
    hold off
else
    if prism_no == 1
        subplot(2, 4, [1, 2, 3, 4])
        plot3(ray_x1, ray_y1, ray_z1, 'LineWidth', 3)           % ray before the prism
        hold on
        surf(Xgrid, Ygrid, Z_surf1)
        plot3(ray_x2, ray_y2, ray_z2, 'LineWidth', 3)
        surf(Xgrid, Ygrid, Z_surf2)
    else
        plot3(ray_x1, ray_y1, ray_z1, 'LineWidth', 3)           % ray before the prism
        surf(Xgrid, Ygrid, Z_surf1)                             % prism 1st surface
        plot3(ray_x2, ray_y2, ray_z2, 'LineWidth', 3)           % ray inside the prism
        surf(Xgrid, Ygrid, Z_surf2)                             % prism 2nd surface
    end
end