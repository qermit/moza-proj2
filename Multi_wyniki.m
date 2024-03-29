clear all; close all;

load('multi.mat')

%Narysowanie wykresu
figure(1);
plot(freq,v,'-r',fL,minv,'o',fU,minv,'o',...
    freq(iL+3599),v(iL+3599),'bx',freq(iU+3599),v(iU+3599),'bx');
xlabel('freq'); ylabel('D');

fprintf('r\t\t\t%f\nOdchyleniefL:\t\t%dMHz\nOdchylenie fU:\t\t%dMHz\nOdchylenie w pasmie:\t%f\nCzas\t\t\t%ds\n', ...
    fvalm, ...
    round(abs(3.6e+9 - fL)/1e+6), ...
    round(abs(18e+9 - fU)/1e+6), ...
    odchylenie_st, ...
    round(czas));