function [kaicao,yi] = fix_p_fum(init)
p = init(8);

[S,l] = get_S_l(init);

x = init(4) - S;
yj = init(2)/2 - l;
zj = zeros(1,10);

zi = init(3);
yi = yj(1) + sqrt(l(1).^2 - zi.^2);

bi = (yi-yj(1))*p+yj(1);
ci = (zi-zj(1))*p+zj(1);

head = [x;yj;zj];
abc = [x;bi.*ones(1,10);ci.*ones(1,10)];

kaicao = [sqrt(sum((abc - head).^2)); l - l(1)*(1-p)];



if sum(kaicao(1,:)<l)~=10
    kaicao = inf;
    return
end

if sum(kaicao(2,:)>0)~=10
    kaicao = inf;
    return
end

% kaicao = sum(kaicao(1,:)-kaicao(2,:))/sum(l);
kaicao = sum(kaicao(1,:)-kaicao(2,:));