clear  %  木板信息               gif属性          桌到金比例 
%       [ m L H R d      fps times     p  zmyc]
init = [0.5, 120, 50, 25, 2.5, 60, 3, 0.5, 0]; 
% init(1) = get_m(init);
name = 'test.gif';% git名称

[S,l] = get_S_l(init);
[vertex,head,abc,kaicao] = get_point(init,name);

% view([90 0])
kaicao(1,:) = kaicao(1,:) - kaicao(2,:);

given_angle = atan(vertex(3,1)/(vertex(2,1)-head(2,1)))*180/pi;
clear name


figure
plot(vertex(1,:),vertex(2,:))
hold on

x1 = vertex(1,end):(vertex(1,1)-vertex(1,end))/100:vertex(1,1);
[p1,S1] = polyfit(vertex(1,:),vertex(2,:),6);
f1 = polyval(p1,x1);
plot(x1,f1)
hold off

figure
plot(vertex(1,:),vertex(3,:))
hold on

x1 = vertex(1,end):(vertex(1,1)-vertex(1,end))/100:vertex(1,1);
[p2,S2] = polyfit(vertex(1,:),vertex(3,:),2);
f1 = polyval(p2,x1);
plot(x1,f1)
hold off

clear x1 f1
