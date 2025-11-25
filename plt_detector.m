function [collect_circles] = plt_detector(rotate_about_z3, rotate_about_z30, ...
    loop_ind, pos_Xray_D, pos_Yray_D, det_half_length)

plt_colors = ['m', 'c', 'r', 'b', 'g', 'k'];
plt_ind = floor((abs(rotate_about_z3) - abs(rotate_about_z30)) / 360) + 1;
plt_ind = rem(plt_ind, 6);
if plt_ind == 0
    plt_ind = 6;
end
plt_ind_all(1) = 1;
plt_color = plt_colors(plt_ind);
p1 = subplot(2, 4, [5, 6]);

rotation_cycle = rem((abs(rotate_about_z3) - abs(rotate_about_z30)), 360);
collect_circles(1) = 0;


if loop_ind == 1
    plot(pos_Xray_D, pos_Yray_D, '*', 'LineWidth', 4)
end
hold on
plot(pos_Xray_D, pos_Yray_D, 'MarkerEdgeColor', plt_color, 'Marker','o', 'MarkerFaceColor', plt_color)
grid on
axis([-det_half_length - 20 det_half_length + 20 -det_half_length, det_half_length])
daspect([1, 1, 1])
title('Field of Regard')
hold off