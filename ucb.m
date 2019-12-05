clear all; close all;
rsum = 0;
endit = 10;
narm = 10;
for it = 1:endit
    
arms = rand(1,narm);

n = zeros(1,narm);
m = zeros(1,narm);

for i = 1:narm
    sample = double(rand() > arms(i));
    n(i) = n(i)+1;
    m(i) = m(i)+sample;
end


regret = 0;

for i = 1:1000
%     arms = rand(1,narm);
%     [v, c] = max(m./n + log(sum(n)./n));
    [v, c] = max(m./n);
    sample = double (rand() < arms(c));
    n(c) = n(c) +1;
    m(c) = m(c) +sample;
    regret = regret + max(arms) - arms(c);
end
    rsum = rsum + regret;
end

rsum/endit
