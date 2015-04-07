function s = areaCalc(Xyz,Troi)
% calculates area of all triangles using cross product
XY = Xyz(Troi(:,2),:)-Xyz(Troi(:,1),:);
XZ = Xyz(Troi(:,3),:)-Xyz(Troi(:,1),:);
vS = sqrt(sum(cross(XY,XZ).^2,2))/2;
s = sum(vS);

