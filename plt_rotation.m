function [x1] = plt_rotation(rotate_about_z1, rotate_about_z2, rotate_about_z3, ...
    rotate_about_z4)

R = -1:1:1;
x1 = R * sind(rotate_about_z1);
y1 = R * cosd(rotate_about_z1);
x2 = R * sind(rotate_about_z2);
y2 = R * cosd(rotate_about_z2);
x3 = R * sind(rotate_about_z3);
y3 = R * cosd(rotate_about_z3);
x4 = R * sind(rotate_about_z4);
y4 = R * cosd(rotate_about_z4);

subplot(2, 4, 7)
plot(x1, y1, 'Marker', '.', 'MarkerEdgeColor', 'b', 'LineWidth', 2)
hold on
plot(x2, y2, 'Marker', '.', 'MarkerEdgeColor', 'r', 'LineWidth', 2)
axis([-2 2 -2 2])
grid on
title({'1st prism (Blue) rotation angle: ' + string(rotate_about_z1); ...
    '2nd prism (Red) rotation angle: ' + string(rotate_about_z2)})
daspect([1 1 1])
hold off
subplot(2, 4, 8)
plot(x3, y3, 'Marker', '.', 'MarkerEdgeColor', 'b', 'LineWidth', 2)
hold on
plot(x4, y4, 'Marker', '.', 'MarkerEdgeColor', 'r', 'LineWidth', 2)
axis([-2 2 -2 2])
grid on
title({'1st prism (Blue) rotation angle: ' + string(rotate_about_z3); ...
    '2nd prism (Red) rotation angle: ' + string(rotate_about_z4)})
daspect([1, 1, 1])
hold off
drawnow limitrate





