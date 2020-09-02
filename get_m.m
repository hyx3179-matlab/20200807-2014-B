function m = get_m(init)
global get_m_init
get_m_init = init; 

m = fsolve('get_m_fun',0);

clearvars -global