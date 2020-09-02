function [vertex] = get_vertex_and_drawing(init,given_angle,l,head,kaicao)
L = init(2);
H = init(3);
R = init(4);
p = init(8);
zmyc = init(9);
x = head(1,:);
yj = head(2,:);
zj = head(3,:);

zi = l(1)*sin(given_angle);
yi = yj(1) + l(1)*cos(given_angle);
bi = (yi-yj(1))*p+yj(1);
ci = (zi-zj(1))*p+zj(1);

abc = [x;bi.*ones(1,10);ci.*ones(1,10)];
vertex = (abc-head)./sqrt(sum((abc - head).^2)).*l+head;
kaicaodian1 = (abc-head)./sqrt(sum((abc - head).^2)).*kaicao(1,:)+head;
kaicaodian2 = (abc-head)./sqrt(sum((abc - head).^2)).*kaicao(2,:)+head;

head(2,:) = head(2,:)+zmyc;
vertex(2,:) = vertex(2,:)+zmyc;
kaicaodian1(2,:) = kaicaodian1(2,:)+zmyc;
kaicaodian2(2,:) = kaicaodian2(2,:)+zmyc;
abc(2,:) = abc(2,:)+zmyc;

head = [head fliplr(head).*[-1;1;1]];
head = [head head.*[1;-1;1]];
vertex = [vertex fliplr(vertex).*[-1;1;1]];
vertex = [vertex vertex.*[1;-1;1]];
kaicaodian1 = [kaicaodian1 fliplr(kaicaodian1).*[-1;1;1]];
kaicaodian1 = [kaicaodian1 kaicaodian1.*[1;-1;1]];
kaicaodian2 = [kaicaodian2 fliplr(kaicaodian2).*[-1;1;1]];
kaicaodian2 = [kaicaodian2 kaicaodian2.*[1;-1;1]];

ii = 1;
plot3([vertex(1,ii) head(1,ii)],[vertex(2,ii) head(2,ii)],[vertex(3,ii) head(3,ii)],'k')
hold on
for ii = 2:length(vertex)
    plot3([vertex(1,ii) head(1,ii)],[vertex(2,ii) head(2,ii)],[vertex(3,ii) head(3,ii)],'k')
end
for ii = 1:length(kaicaodian1)
    plot3([kaicaodian1(1,ii) kaicaodian2(1,ii)], ...
        [kaicaodian1(2,ii) kaicaodian2(2,ii)], ...
        [kaicaodian1(3,ii) kaicaodian2(3,ii)],'r')
end

plot3([abc(1,1) -abc(1,1)],[abc(2,1) abc(2,1)],[abc(3,1) abc(3,1)],'b')
plot3([abc(1,1) -abc(1,1)],[-abc(2,1) -abc(2,1)],[abc(3,1) abc(3,1)],'b')

rectangle('Position',[0-R,0-R-zmyc,2*R,2*R+zmyc+zmyc],'Curvature',1,'linewidth',1)

axis equal
axis([-R-1 R+1 -L/2-1-zmyc L/2+1+zmyc 0 H+1])
set(gcf,'Color','white','position',[0,0,450,400]);
xlabel('x')
ylabel('y')
zlabel('z')
% view([90 0])
hold off

vertex = vertex(:,1:20);