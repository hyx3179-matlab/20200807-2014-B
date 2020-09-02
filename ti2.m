clear  %  木板信息               gif属性          桌到金比例 
%       [ given_angle L H R d      fps times     p ]
init = [0.5 , 0, 70, 40, 4, 1, 3, 0.71, 0]; 
% m = get_m(init);
l1 = init(3)/sin(61/180*pi);
init(2) = 2*(l1+sqrt(init(4)^2-(init(4)-init(1)*init(5))^2));

name = 'test.gif';% git名称

[S,l] = get_S_l(init);
[vertex,head,abc,kaicao] = get_point(init,name);

% view([90 0])
kaicao(1,:) = kaicao(1,:) - kaicao(2,:);

given_angle = atan(vertex(3,1)/(vertex(2,1)-head(2,1)))*180/pi;
clear name