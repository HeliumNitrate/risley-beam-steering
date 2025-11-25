function [refr_x_axis, refr_y_axis] = snellsLaw ...
    (norm_x, norm_y, incident_norm_x, incident_norm_y, n_in, n_out)

refr_x_norm = asind(sind(incident_norm_x) * n_in / n_out);
refr_y_norm = asind(sind(incident_norm_y) * n_in / n_out);

refr_x_axis = refr_x_norm + norm_x;
refr_y_axis = refr_y_norm + norm_y;