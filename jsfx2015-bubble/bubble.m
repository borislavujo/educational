nv = 10; % number of 'circles'
nk = 35; % number of node per 'circle'
h = 1; % distance between the cylinders
nSteps = 100000; % number of MC steps
betaMin = 25; % minimum beta for annealing

% initial geometry
[Cyli,Troi,vmi] = iniGeom(nv,nk,h)

% simulate annealing
[Cyli,acc] = mcMemb(Cyli,Troi,vmi,nSteps,betaMin);
accRatio = acc

% draw the stuff
CS = sortrows([Cyli(:,2),Cyli(:,3),Cyli(:,1)]);
Cyli2 = [CS(:,3),CS(:,1:2)]; Cyli3 = Cyli2;
for i=2:2:nk+1
  Cyli2((i-1)*(nv+2)+1:i*(nv+2),:) = flipud(Cyli3((i-1)*(nv+2)+1:i*(nv+2),:));
endfor
Xyz = cyli2xyz(Cyli);
save Xyz Xyz
Xyz2 = cyli2xyz(Cyli2);
save Xyz2 Xyz2
