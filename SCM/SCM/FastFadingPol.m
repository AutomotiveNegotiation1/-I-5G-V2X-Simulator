function [Hsut AoDm AoAm a]=FastFadingPol(Pn,M,t,T1,S,U,AoDn,AoAn,thetav,v,kappa,dBS,dMS,BSAP,MSAP,BSAS,MSAS,aBS,bMS,rn)

a=(2*pi)*rand(4,M);%randon phase for each of the M subpaths 
AoDm=AoDn+BSAS*randn(1,M);%Angles of Departure for each of the M subpaths
AoAm=AoAn+MSAS*randn(1,M);%Angles of Arrival for each of the M subpaths

if BSAP==1 & MSAP==1;    
    i=0;
    for i=0:T1-1
        s=0;
        for s=0:S-1
            u=0;
            for u=0:U-1
                sumh=0;
                m=0;
                for m=0:M-1
                    h(m+1)=sqrt((Pn)/M)*([cosd(aBS) sind(aBS)*cosd(AoDm(m+1))]*[exp(j*a(1,m+1)) sqrt(rn)*exp(j*a(2,m+1));sqrt(rn)*exp(j*a(3,m+1)) exp(j*a(4,m+1))]*[cosd(bMS);sind(bMS)*cosd(AoAm(m+1))])*exp(j*kappa*dBS(s+1)*sind(AoDm(m+1)))*exp(j*(kappa*dMS(u+1)*sind(AoAm(m+1))))*exp(j*kappa*v*cosd(AoAm(m+1)-thetav)*t(i+1));
                    sumh=sumh+h(m+1);
                    m=m+1;
                end    
                Hsu(s+1,u+1)=sumh;
                u=u+1;
            end
            s=s+1;
        end
        Hsut{i+1,1}=Hsu;
        i=i+1;
    end
elseif BSAP==2 & MSAP==1
S=2*S;
A=ones(1,S)*aBS;
B=zeros(1,length(A));
C=B;
DBS1=B;
DBS2=B;
for i=1:(length(A)/2)
    B(2*i-1)=A(i);
    C(2*i)=90-A(i);
    DBS1(2*i-1)=dBS(i);
    DBS2(2*i)=dBS(i);
    i=1;
end
A=B+C;
dBS=DBS1+DBS2;
    i=0;
    for i=0:T1-1
        s=0;
        for s=0:S-1
            u=0;
            for u=0:U-1
                sumh=0;
                m=0;
                for m=0:M-1
                    h(m+1)=sqrt((Pn)/M)*([cosd(A(s+1)) sind(A(s+1))*cosd(AoDm(m+1))]*[exp(j*a(1,m+1)) sqrt(rn)*exp(j*a(2,m+1));sqrt(rn)*exp(j*a(3,m+1)) exp(j*a(4,m+1))]*[cosd(bMS);sind(bMS)*cosd(AoAm(m+1))])*exp(j*kappa*dBS(s+1)*sind(AoDm(m+1)))*exp(j*(kappa*dMS(u+1)*sind(AoAm(m+1))))*exp(j*kappa*v*cosd(AoAm(m+1)-thetav)*t(i+1));
                    sumh=sumh+h(m+1);
                    m=m+1;
                end    
                Hsu(s+1,u+1)=sumh;
                u=u+1;
            end
            s=s+1;
        end
        Hsut{i+1,1}=Hsu;
        i=i+1;
    end
elseif BSAP==1 & MSAP==2
U=2*U;
A=ones(1,U)*bMS;
B=zeros(1,length(A));
C=B;
DMS1=B;
DMS2=B;
for i=1:(length(A)/2)
    B(2*i-1)=A(i);
    C(2*i)=90-A(i);
    DMS1(2*i-1)=dMS(i);
    DMS2(2*i)=dMS(i);
    i=1;
end
A=B+C;
dMS=DMS1+DMS2;
    i=0;
    for i=0:T1-1
        s=0;
        for s=0:S-1
            u=0;
            for u=0:U-1
                sumh=0;
                m=0;
                for m=0:M-1
                    h(m+1)=sqrt((Pn)/M)*([cosd(aBS) sind(aBS)*cosd(AoDm(m+1))]*[exp(j*a(1,m+1)) sqrt(rn)*exp(j*a(2,m+1));sqrt(rn)*exp(j*a(3,m+1)) exp(j*a(4,m+1))]*[cosd(A(u+1));sind(A(u+1))*cosd(AoAm(m+1))])*exp(j*kappa*dBS(s+1)*sind(AoDm(m+1)))*exp(j*(kappa*dMS(u+1)*sind(AoAm(m+1))))*exp(j*kappa*v*cosd(AoAm(m+1)-thetav)*t(i+1));
                    sumh=sumh+h(m+1);
                    m=m+1;
                end    
                Hsu(s+1,u+1)=sumh;
                u=u+1;
            end
            s=s+1;
        end
        Hsut{i+1,1}=Hsu;
        i=i+1;
    end
elseif BSAP==2 & MSAP==2
S=2*S;
A1=ones(1,S)*aBS;
B1=zeros(1,length(A1));
C1=B1;
DBS1=B1;
DBS2=B1;
for i=1:(length(A1)/2)
    B1(2*i-1)=A1(i);
    C1(2*i)=90-A1(i);
    DBS1(2*i-1)=dBS(i);
    DBS2(2*i)=dBS(i);
    i=1;
end
A1=B1+C1;
dBS=DBS1+DBS2;

U=2*U;
A2=ones(1,U)*bMS;
B2=zeros(1,length(A2));
C2=B2;
DMS1=B2;
DMS2=B2;
for i=1:(length(A2)/2)
    B2(2*i-1)=A2(i);
    C2(2*i)=90-A2(i);
    DMS1(2*i-1)=dMS(i);
    DMS2(2*i)=dMS(i);
    i=1;
end
A2=B2+C2;
dMS=DMS1+DMS2;
    i=0;
    for i=0:T1-1
        s=0;
        for s=0:S-1
            u=0;
            for u=0:U-1
                sumh=0;
                m=0;
                for m=0:M-1
                    h(m+1)=sqrt((Pn)/M)*([cosd(A1(s+1)) sind(A1(s+1))*cosd(AoDm(m+1))]*[exp(j*a(1,m+1)) sqrt(rn)*exp(j*a(2,m+1));sqrt(rn)*exp(j*a(3,m+1)) exp(j*a(4,m+1))]*[cosd(A2(u+1));sind(A2(u+1))*cosd(AoAm(m+1))])*exp(j*kappa*dBS(s+1)*sind(AoDm(m+1)))*exp(j*(kappa*dMS(u+1)*sind(AoAm(m+1))))*exp(j*kappa*v*cosd(AoAm(m+1)-thetav)*t(i+1));
                    sumh=sumh+h(m+1);
                    m=m+1;
                end    
                Hsu(s+1,u+1)=sumh;
                u=u+1;
            end
            s=s+1;
        end
        Hsut{i+1,1}=Hsu;
        i=i+1;
    end
end