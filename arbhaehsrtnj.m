clear  %  木板信息               gif属性          桌到金比例
%       [ given_angle L H R d      fps times     p ]

init = [0.5 , 0, 70, 40, 4, 1, 3, 0.5];
% m = get_m(init);

L = zeros(100,90);
kaicao = zeros(100,90);

[~,l] = get_S_l(init);

yj = init(2)/2 - l;


for jj = 1:100
    init(8) = jj/100;
    for ii = 1:90
        l1 = init(3)/sin(ii/180*pi);
        init(2) = 2*(l1+sqrt(init(4)^2-(init(4)-init(1)*init(5))^2));
        L(jj,ii) = init(2);
        kaicao(jj,ii) = fix_p_fum(init);
        if jj/100/tan(ii/180*pi) >= sqrt(12)/7
            kaicao(jj,ii) = inf;
        end
        if 70*jj/100/tan(ii/180*pi) + yj(1) <= 40
            kaicao(jj,ii) = inf;
        end
    end
end

plot(1:90,L)
surf(kaicao)
axis equal
xlabel('x')
ylabel('y')
zlabel('z')