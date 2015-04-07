function [Cyli,acc] = mcMemb(Cyli,Troi,vmi,nSteps,betaMin)
% a simple simulated annealing implementation
% propagate nSteps MC moves using increasing beta
% beta starting at betaMin, increasing to sqrt(nSteps)*betaMin
nAcc = 0;
Xyz = cyli2xyz(Cyli);
s = areaCalc(Xyz,Troi)
% Monte Carlo
% beta for MC will increase each step from betamin to betamin*sqrt(1000)
for i=1:nSteps
  iStep = i
  CyliNew = randMoveCyli(Cyli,vmi);
  Xyz = cyli2xyz(CyliNew);
  sNew = areaCalc(Xyz,Troi)
  beta = betaMin*sqrt(iStep);
  if (exp(beta*(s-sNew))>rand(1))
    Cyli = CyliNew;
    s = sNew;
    nAcc++;
  endif
endfor
  
acc = nAcc/nSteps;
