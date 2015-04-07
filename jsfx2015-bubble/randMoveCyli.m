function Cyli = randMoveCyli(Cyli,vmi)
% randomly modifies radii of the nodes
% vmi are indices of nodes that can be modified
n = size(vmi,1);
h = 0.005;
% optimum move depends on 
vRelSinesCyl = [0.5, 0.3, 0.2, 0.1];
vRelSinesX = [0.5, 0.1];
% decide whether to add random numbers 
% scaled in cylindrical coordinates or in X
if (rand(1)<0.5) vRelSines = vRelSinesCyl; else vRelSines = vRelSinesX; endif
for i=1:size(vRelSines,2)
  Cyli(vmi,1) = Cyli(vmi,1) + h*sin(i*Cyli(vmi,2)/2).*(rand(n,1)-ones(n,1)/2);
endfor
