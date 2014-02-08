function v=calc_D(x,freq)
n1=numel(x)+1;
coef=4j*pi/3e8;
v=zeros(numel(freq),1);
for nf=1:numel(freq)
    w=exp(coef*freq(nf)*x);
    s=(1+sum(w))/n1;
    q=(1+sum(w.^2))/n1;
    v(nf)=1+(2*real(conj(q)*s*s))-2*s*conj(s)-q*conj(q);
end
end