function [fL,fU,minv,iL,iU]=calc_fLfU(freq,v)
% calc_fLfU
% Funkcja wyznacza dla danej charektyrystyki czêstotliwoœciowej
% unormowanego wyznacznika macierzy Fishera: v(freq):
% minv : przybli¿enie wartoœci zafalowania charakterystyki
% fL, fU: czêstotliwoœci (doln¹ i górn¹) dla której charakterystyka
%       osi¹ga wartoœæ 1-r; dla f: fL<f<fU zachodzi v(f)>1-r
% iL, iU - wspó³rzêdne wektora freq takie, ¿e
% freq(iL)<=fL<freq(iL+1)
% freq(iU-1)<fU<freq(iU)
%
% 5.X.2013 (LJO)
if numel(freq)~=numel(v)
    error('calc_fLfU: numel(freq)~=numel(v)');
end
freq=freq(:); v=v(:);
tol=1e-4;
tol1=1-tol;
for ni=1:numel(v)-1
    if v(ni+1)<v(ni), break; end
end
iL=ni;
for ni=numel(v):-1:iL
    if v(ni-1)<v(ni); break; end
end
iU=ni;
minv=min(v(iL:iU));
for ni=iL:-1:1
    if v(ni)<=minv*tol1, break; end
end
iL=max(1,ni-1);
c=polyfit(v(iL:iL+2),freq(iL:iL+2),2);
fL=polyval(c,minv);
for ni=iU:numel(v)
    if v(ni)<=minv*tol1; break; end
end
iU=min(numel(v),ni+1);
c=polyfit(v(iU-2:iU),freq(iU-2:iU),2);
fU=polyval(c,minv);
return
end
