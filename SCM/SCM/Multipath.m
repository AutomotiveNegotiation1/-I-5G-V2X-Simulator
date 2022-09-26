function [Hn Pn tn AoDn AoAn dBS dMS AoDnm AoAnm Fnm d thetaBS thetaMS OmegaBS OmegaMS thetav sigmaAS sigmaDS sigmaSF PLdB]=Multipath(ENV,pd,R,LOS,S,U,DBS,DMS,V,N,M,FC,BSAP,MSAP,BSAS,MSAS,BSppD,DS,rDS,rAS,T,X,InD,InThBS,InOmBS,InThV,InThMS,InOmMS,pn,tn,cor)

%Constants

c=3*(10^8);%propagation velocity in m/sec
f=FC*(10^9);%carrier frequency in Hz
lamda=c/f;%wavelength of the carrier in meters
kappa=(2*pi)/lamda;%wavenumber of the carrier 
dBS1=DBS*lamda;%distance between two neighbouring antennas of the BS linear
%array in meters
dMS1=DMS*lamda;%distance between two neighbouring antennas of the MS linear
%array in meters
v=(10/36)*V;%magnitude of the velocity of the mobile station in m/sec 

d=InD; 
thetaBS=InThBS; 
thetaMS=InThMS; 
OmegaBS=InOmBS; 
OmegaMS=InOmMS; 
thetav=InThV;

%The Linear Antenna Array

dBS=DIST(dBS1);%distances between the reference antenna and the rest 
%antennas of the BS linear array

dMS=DIST(dMS1);%distances between the reference antenna and the rest 
%antennas of the MS linear array


%Matrixes

%t is the time matrix of the drop
X1=0.001*X;%seconds
T1=T/X1;
t=[1:1:T1]*X1;

%Suburban macrocell environment
if ENV==1 & LOS==2
    hBS=32;
    hMS=1.5;
    Cc=0;
    PLdB=(44.9-6.55*log10(hBS))*log10(d/1000)+45.5+(35.46-1.1*hMS)*log10(1000*FC)-13.82*log10(hBS)+0.7*hMS+ Cc;
    [sigmaDS sigmaAS sigmaSF]=CorParameters(cor(1),cor(2),cor(3),cor(4),cor(5),cor(6),cor(7),cor(8),cor(9),cor(10));
    if pd==0 
        [Pn tn]=PDPmacro(N,rDS,sigmaDS);
    elseif pd==1 
        Pn=pn;
        tn=tn;
    end
    A=rAS*sigmaAS*randn(1,N); 
    x=abs(A);
    for k=1:N-1
        l=k;
        for j=k+1:N
            if x(j)<x(l)
                l=j; 
            end 
        end 
        if l~=k 
            oldxl=x(l);
            oldAl=A(l);
            x(l)=x(k);
            A(l)=A(k);
            x(k)=oldxl;
            A(k)=oldAl;
        end 
    end
    AoDn=thetaBS*ones(1,N)+A;
    AoAn=thetaMS*ones(1,N)+104.12*(1-exp(-0.2175*abs(10*log10(Pn))))*randn(1); 
end


%Urban macrocell environment
if ENV==2 & LOS==2
    hBS=32;
    hMS=1.5;
    Cc=3;
    PLdB=(44.9-6.55*log10(hBS))*log10(d/1000)+45.5+(35.46-1.1*hMS)*log10(1000*FC)-13.82*log10(hBS)+0.7*hMS+ Cc;
    [sigmaDS sigmaAS sigmaSF]=CorParameters(cor(1),cor(2),cor(3),cor(4),cor(5),cor(6),cor(7),cor(8),cor(9),cor(10));
    if pd==0
        [Pn tn]=PDPmacro(N,rDS,sigmaDS);
     elseif pd==1 
        Pn=pn;
        tn=tn;
    end
    A=rAS*sigmaAS*randn(1,N); 
    x=abs(A);
    for k=1:N-1
        l=k;
        for j=k+1:N
            if x(j)<x(l)
                l=j; 
            end 
        end 
        if l~=k 
            oldxl=x(l);
            oldAl=A(l);
            x(l)=x(k);
            A(l)=A(k);
            x(k)=oldxl;
            A(k)=oldAl;
        end 
    end
    AoDn=thetaBS*ones(1,N)+A;
    AoAn=thetaMS*ones(1,N)+104.12*(1-exp(-0.2175*abs(10*log10(Pn))))*randn(1); 
end


%Urban microcell environment
if ENV==3 & LOS==2   
    PLdB=-55.9+38*log10(d)+(24.5+1.5*((1000*FC)/925))*log10(1000*FC);
    sigmaAS=0;
    sigmaDS=0;
    sigmaSF=10^(cor(6)*randn(1)/10);
    if pd==0
        [Pn tn]=PDPmicro(N,DS);
     elseif pd==1 
        Pn=pn;
        tn=tn;
    end
    AoDn=thetaBS*ones(1,N)+BSppD*2*(rand(1,N)-0.5);
    AoAn=thetaMS*ones(1,N)+104.12*(1-exp(-0.2175*abs(10*log10(Pn))))*randn(1); 
end


progressbar
n=1;
for n=1:N
    [Hsut AoDm AoAm Fm]=FastFading(Pn(n),M,t,T1,S,U,AoDn(n),AoAn(n),thetav,v,kappa,dBS,dMS,BSAP,MSAP,BSAS,MSAS);
    Hn{n,1}=Hsut;
    AoDnm{n,1}=AoDm;
    AoAnm{n,1}=AoAm;
    Fnm{n,1}=Fm;
    progressbar(n/N)
    n=n+1;
end