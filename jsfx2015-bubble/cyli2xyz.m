function Xyz = cyli2xyz(Cyli)
% transforms cylindrical coordinates to cartesian
% Cyli: [radius, angle, z]
Xyz = Cyli;
Xyz(:,1) = Cyli(:,1).*cos(Cyli(:,2));
Xyz(:,2) = Cyli(:,1).*sin(Cyli(:,2));

