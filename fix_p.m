clear
init = [63, 120, 50, 25, 2.5, 10, 1]; 
init(1) = get_m(init);

kaicao = zeros(1,1/0.01+1);
jj = 0;
for ii = 0:0.01:1
    jj = jj+1;
    init(8) = ii;
    kaicao(jj) = fix_p_fum(init);
end
