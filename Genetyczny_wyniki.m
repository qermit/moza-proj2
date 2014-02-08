clear all; close all;
load('genetyczny.mat');

%Obliczenie fL, fU, r
max_f_index=17951;
min_f_index=3600;
freq=1e9*[0.05:0.001:18]';
v=calc_D(x,freq);
%[fL,fU,minv,iL,iU]=calc_fLfU(freq(3600:17951),v(3600:17951)); %70:360
[fL,fU,minv,iL,iU]=calc_fLfU(freq(min_f_index:max_f_index),v(min_f_index:max_f_index));
odchylenie_st = std(v(iL+min_f_index-1:iU+min_f_index-1));


%Narysowanie wykresu
figure(1);
plot(freq,v,'-b');
%    fL,minv,'o',fU,minv,'o');
%plot(freq,v,'-b',fL,minv,'o',fU,minv,'o',...
%    freq(iL+3599),v(iL+3599),'bx',freq(iU+3599),v(iU+3599),'bx');
xlabel('freq'); ylabel('D');

fprintf('r\t\t\t%.4f\nOdchyleniefL:\t\t%dMHz\nOdchylenie fU:\t\t%dMHz\nOdchylenie w pasmie:\t%f\nCzas\t\t\t%.1fs\n', ...
    r, ...
    round(abs(3.6e+9 - fL)/1e+6), ...
    round(abs(18e+9 - fU)/1e+6), ...
    odchylenie_st, ...
    czas);