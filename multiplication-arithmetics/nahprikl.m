n = 3; % 3 columns
m = 10;

F = floor(10.^(0.5*ones(m,n) + 2*rand(m,n))) .* 10.^floor(4*rand(m,n).^2); % first number: (3..316) x 10^{0..4}
% F = floor(10.^(ones(m,n) + 2*rand(m,n))) .* 10.^floor(4*rand(m,n).^2); % more advanced ... requires some courage
S = floor(10.^(0.32+1.68*rand(m,n))) .* 10.^floor(4*rand(m,n).^2); % second number: (2..100) x 10^{0..4}
Z = zeros(m,2*n); % problem tasks
RR = zeros(m,3*n); % problem tasks with solutions
R = F.*S; % results
for i=1:n
  Z(:,i*2-1) = F(:,i);
  Z(:,i*2) = S(:,i);
  RR(:,i*3-2) = F(:,i);
  RR(:,i*3-1) = S(:,i);
  RR(:,i*3) = R(:,i);
end
save Z Z
save RR RR
