function [S,l] = get_S_l(init)
m = init(1);
L = init(2);
R = init(4);
d = init(5);

S = zeros(1,10);
l = zeros(1,10);
for ii = 1:10
%     S(ii) = m*d+(R-m*d)/9*(ii-1);
    S(ii) = m*d+(d/18+d)*(ii-1);
    l(ii) = L/2 - sqrt(R.^2-(R-S(ii)).^2);
end