function angle = get_m_fun(m)
global get_m_init
L = get_m_init(2);
H = get_m_init(3);
R = get_m_init(4);
d = get_m_init(5);

angle = asin(H/(L/2 - sqrt(R.^2-(R-m*d).^2)))*180/pi-get_m_init(1);