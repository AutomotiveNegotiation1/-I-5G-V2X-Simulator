function [Hsut AoDm AoAm Fm]=FastFading(Pn,M,t,T1,S,U,AoDn,AoAn,thetav,v,kappa,dBS,dMS,BSAP,MSAP,BSAS,MSAS)

Fm=2*pi*rand(1,M);%randon phase for each of the M subpaths 
AoDm=AoDn+BSAS*randn(1,M);%Angles of Departure for each of the M subpaths
AoAm=AoAn+MSAS*randn(1,M);%Angles of Arrival for each of the M subpaths

if BSAP==1
    for m=0:M-1
        Gh(m+1)=G3(AoDm(m+1));
        m=m+1;
    end
elseif BSAP==2
    for m=0:M-1
        Gh(m+1)=G6(AoDm(m+1));
        m=m+1;
    end
elseif BSAP==3
    for m=0:M-1
        Gh(m+1)=1;
        m=m+1;
    end   
end

i=0;
for i=0:T1-1
    s=0;
    for s=0:S-1
        u=0;
        for u=0:U-1
            sumh=0;
            m=0;
            for m=0:M-1               
                h(m+1)=sqrt((Pn)/M)*sqrt(Gh(m+1))*exp(j*kappa*dBS(s+1)*sind(AoDm(m+1)))*exp(j*(kappa*dMS(u+1)*sind(AoAm(m+1))+Fm(m+1)))*exp(j*kappa*v*cosd(AoAm(m+1)-thetav)*t(i+1));                
                sumh=sumh+h(m+1);
                m=m+1;               
            end    
            Hsu(s+1,u+1)=sumh;
            u=u+1;
        end
        s=s+1;
    end
    Hsut{i+1,1}=Hsu;%the Impulse Response matrix for every instant t
    i=i+1;
end