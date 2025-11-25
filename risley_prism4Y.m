clc
clear
clf
offset_angle = 180;
intersection_angle = 0;
full_angle = 200;

n_air = 1;
n_glass = 1.5185;
prism_ang1 = 10;
prism_ang2 = 0;
prism_ang3 = - prism_ang1;
rot_angle_ind = 0:1:full_angle;

prism_z_coord = [80, 100, 140, 160, 250];
prism_thickness = 10;
ang_Xray_axis10 = 0;
ang_Yray_axis10 = 0;
pos_Xray10 = 0;
pos_Yray10 = 0;
pos_Zray10 = prism_z_coord(1) - 100;
surf_half_length1 = 10;
detector_half_length = 21;
p1_rot_speed = 0;
p2_rot_speed = 0;
p3_rot_speed = 5;
p4_rot_speed = -25;

for i = 1:length(rot_angle_ind)
    %% 1st PRISM
    k = floor(i / 50) + 1;
    rotate_about_z1 = p1_rot_speed * rot_angle_ind(k) + intersection_angle;
    [ang_Xray_axis1, ang_Yray_axis1, pos_Xray1, pos_Yray1, pos_Zray1] = prism_funY ...
        (rotate_about_z1, prism_z_coord(1), ang_Xray_axis10, ang_Yray_axis10, ...
        prism_ang1, prism_ang2, surf_half_length1, n_air, n_glass, ...
        pos_Xray10, pos_Yray10, pos_Zray10, prism_thickness, 1);

    %% 2nd PRISM
    rotate_about_z2 = p2_rot_speed * rot_angle_ind(k) + intersection_angle + offset_angle;
    [ang_Xray_axis2, ang_Yray_axis2, pos_Xray2, pos_Yray2, pos_Zray2] = prism_funY ...
        (rotate_about_z2, prism_z_coord(2), ang_Xray_axis1, ang_Yray_axis1, ...
        prism_ang2, prism_ang3, surf_half_length1, n_air, n_glass, ...
        pos_Xray1, pos_Yray1, pos_Zray1, prism_thickness, 2);

    %% 3rd PRISM
    rotate_about_z3 = p3_rot_speed * rot_angle_ind(i) + intersection_angle;
    rotate_about_z30 = p3_rot_speed * rot_angle_ind(1) + intersection_angle;
    [ang_Xray_axis3, ang_Yray_axis3, pos_Xray3, pos_Yray3, pos_Zray3] = prism_funY ...
        (rotate_about_z3, prism_z_coord(3), ang_Xray_axis2, ang_Yray_axis2, ...
        prism_ang1, prism_ang2, surf_half_length1, n_air, n_glass, ...
        pos_Xray2, pos_Yray2, pos_Zray2, prism_thickness, 3);

    %% 4th PRISM
    rotate_about_z4 = p4_rot_speed * rot_angle_ind(i) + intersection_angle + offset_angle;
    [ang_Xray_axis4, ang_Yray_axis4, pos_Xray4, pos_Yray4, pos_Zray4] = prism_funY ...
        (rotate_about_z4, prism_z_coord(4), ang_Xray_axis3, ang_Yray_axis3, ...
        prism_ang2, prism_ang3, surf_half_length1, n_air, n_glass, ...
        pos_Xray3, pos_Yray3, pos_Zray3, prism_thickness, 4);

    %% DETECTOR
    rotate_about_z_det = 0;
    [pos_Xray_D, pos_Yray_D, pos_Zray_D, collect_circles] = field_funY(rotate_about_z_det, ...
        prism_z_coord(end), ang_Xray_axis4, ang_Yray_axis4, prism_ang2, detector_half_length, ...
        pos_Xray4, pos_Yray4, pos_Zray4, 0, i, 5, rotate_about_z1, rotate_about_z2, ...
        rotate_about_z3, rotate_about_z30, rotate_about_z4);

    det_xy_pos(i, 1) = pos_Xray_D;
    det_xy_pos(i, 2) = pos_Yray_D;
end




