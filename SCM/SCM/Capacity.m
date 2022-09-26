function [cap]=Capacity(N,SNR,Hn,t,S,U)
r=10^(SNR/10);

for k=1:N
Hsut=Hn{k};
i=1;
for i=1:t    
    A=Hsut{i,1};
    A=A';
    cap(k,i)=log2(det(eye(U)+(r/S)*A*ctranspose(A)));
    i=i+1;
end
k=k+1;
end
if N==1
    cap=cap;
else
    cap=sum(cap);
end
cap=cap';