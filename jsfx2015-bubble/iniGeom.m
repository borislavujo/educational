function [Cyli,Troi,vmi] = iniGeom(nv,nk,x)
% places (nv+2) x (nk+1) nodes on a cylinder with height x
% aligned in 
% Cyli contains cylindrical coordinates of all nodes
% Troi contains indices of trinagles
% vmi contains indices of free nodes
dx = x/(nv+1);
dphi = pi*2/(nk+1);
np = (nv+2)*(nk+1) % total number of points
nt = (nv+1)*(nk+1)*2 % total number of triangles
Cyli = zeros(np,3);
Troi = zeros(nt,3);
vmi = zeros(nk*nv,1);
it = 0;
ii = 0;
for iv = 1:nv+2
  for ik = 1:nk+1
    kery = (iv-1)*(nk+1)+ik
    Cyli(kery,:) = [1, dphi*(ik-1), dx*(iv-1)];
    if (iv<nv+2)
      posun = mod(ik+1,nk+1);
      if (posun==0) posun = nk+1; endif
      dalsi = (iv-1)*(nk+1)+posun
      it++;
      Troi(it,:) = [kery, kery+nk+1, dalsi+nk+1];
      it++;
      Troi(it,:) = [kery, dalsi, dalsi+nk+1];
    endif
    if (iv~=1 && iv~=nv+2 && ik~=nk+1)
      ii++;
      vmi(ii) = kery;
    endif
  endfor
endfor

