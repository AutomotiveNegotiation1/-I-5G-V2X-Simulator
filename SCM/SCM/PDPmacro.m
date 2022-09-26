function [Pn tn]=PDPmacro(N,rDS,sigmaDS)

zn=rand(1,N);

k=0;
for k=0:N-1
    tn(k+1)=-rDS*sigmaDS*log(zn(k+1));
    k=k+1;
end
tn=sort(tn);
tn=tn-tn(1);

s=10^(0.1*3);
xn=s*randn(1,N);

k=0;
for k=0:N-1
    P(k+1)=exp((((1-rDS)*tn(k+1))/(rDS*sigmaDS)))*10^(-xn(k+1)/10);
    k=k+1;
end
sumP=sum(P);
Pn=P/sumP;