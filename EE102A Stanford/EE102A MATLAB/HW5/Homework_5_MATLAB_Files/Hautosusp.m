function H = Hautosusp(omega,omegan,zeta)
H = (omegan*omegan+2*zeta*omegan*(sqrt(-1)*omega))/((sqrt(-1)*omega)*(sqrt(-1)*omega)+2*zeta*omegan*(sqrt(-1)*omega)+omegan*omegan);
end