function ak = a_rectpulsetrain(k,omega0,T1)
if k == 0
    ak = omega0*T1/pi;
else
    ak = omega0*T1/pi*sin(k*omega0*T1)/k*omega0*T1;
end