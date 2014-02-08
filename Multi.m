clear all; close all;
n_zmiennych=7;

%Ograniczenia g�rne i dolne na wektor wej�ciowy
x_L = [0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01]';
x_U = [0.20, 0.20, 0.20, 0.20, 0.20, 0.20, 0.20]';

%Czestotliwosc
f0=18e9;
freq=1e9*[0.05:0.05:18]';

%Rozwiazanie poczatkowe
x=[1:n_zmiennych]'*3e8/(4*f0);

%Optymalizacja - multistart
problem = createOptimProblem('fmincon', 'objective', @(x)Funkcja_celu(x), ...
         'x0', x, 'lb', x_L, 'ub', x_U ,'options', optimset('Algorithm','sqp'),'nonlcon',@Freq_con);
ms=MultiStart('UseParallel', 'always','Display','iter');
tic;
[x fvalm] = run(ms,problem,1000);
czas = toc;

%Obliczenie fL, fU, r
freq=1e9*[0.05:0.001:18]';
v=calc_D(x,freq);
[fL,fU,minv,iL,iU]=calc_fLfU(freq(3600:17951),v(3600:17951)); %70:360
odchylenie_st = std(v(iL+3599:iU+3599));

save('multi.mat');
%Narysowanie wykresu
figure(1);
plot(freq,v,'-r',fL,minv,'o',fU,minv,'o',...
    freq(iL+3599),v(iL+3599),'bx',freq(iU+3599),v(iU+3599),'bx');
xlabel('freq'); ylabel('D');