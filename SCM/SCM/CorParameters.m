function [sigmaDSn sigmaASn sigmaSFn]=CorParameters(N,rDS_AS,rSF_AS,rSF_DS,rSF,sigmaSH,eDS,mDS,eAS,mAS)

X=rand(3,1);
i=0;
for i=0:N-1
    A=[1 rDS_AS rSF_DS;rDS_AS 1 rSF_AS; rSF_AS rSF_AS 1];
    B=[0 0 0; 0 0 0; 0 0 rSF];
    C=(A-B)^(1/2);
    W=rand(3,1);
    D=C*W+[0 0 0; 0 0 0; 0 0 sqrt(rSF)]*X;
    a=D(1,1);
    b=D(2,1);
    c=D(3,1);
    sigmaDSn(i+1)=10^(eDS*a+mDS);
    sigmaASn(i+1)=10^(eAS*b+mAS);
    sigmaSFn(i+1)=10^((sigmaSH*c)/10);
    i=i+1;
end