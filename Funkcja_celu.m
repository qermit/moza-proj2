function [minv]=Funkcja_celu(x)

freq=1e9*[3.0:0.05:18]';
v=calc_D(x,freq);

[~,~,minv,~,~]=calc_fLfU(freq,v);
minv=1-minv;

end