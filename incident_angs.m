function [incident_norm_x, incident_norm_y] = incident_angs ...
    (incident_x, incident_y, surf_norm_x, surf_norm_y)

incident_norm_x = incident_x - surf_norm_x;
incident_norm_y = incident_y - surf_norm_y;