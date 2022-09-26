function [Pn tn]=PDPmicro(N,DS)

tn=DS*(10^(-6))*rand(1,N);
tn=tn-min(tn);
zn=10^(0.1*3)*randn(1,N);

k=0;
for k=0:N-1    
    P(k+1)=10^(-(tn(k+1)+(zn(k+1)/10)));
    k=k+1;
end
sumP=sum(P);
Pn=P/sumP;