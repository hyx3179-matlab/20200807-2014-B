init = [0.5, 120, 50, 25, 2.5, 10, 1, 0.5];
% init(1) = get_m(init);
name = 'test.gif';% gitÃû³Æ

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

zerhaetjhehsrtj = 1;


angle = angle_max * zerhaetjhehsrtj;


[vertex]=get_vertex_and_drawing(init,angle,l,head,kaicao);

set(gcf,'Color','white','position',[0,0,450,400]);
axis auto
% view([90 90])


F = getframe(gcf);
I=frame2im(F);
[I,map]=rgb2ind(I,256);
imwrite(I,map,'aerheh.jpg')

