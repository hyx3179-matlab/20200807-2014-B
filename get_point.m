function [vertex,head,abc,kaicao] = get_point(init,name)

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

angle_max = asin(init(3)/l(1));

jj = 1;
for ii = 0:angle_max/(init(6)*init(7)-1):angle_max
    [vertex]=get_vertex_and_drawing(init,ii,l,head,kaicao);
    F(jj) = getframe(gcf);
    jj = jj+1;
end

frame_struct2gif(F,name,init(6),0)
abc = [0; bi; ci];
