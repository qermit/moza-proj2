function [c,ceq]=Freq_con(x)

freq=1e9*[3.0:0.05:18]';

v=calc_D(x,freq);
[~,~,~,iL,iU]=calc_fLfU(freq,v);
ceq=0;
c=v(iL)-v(iU);

end