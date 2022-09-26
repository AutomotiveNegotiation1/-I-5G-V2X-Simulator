function [pl,distance]=Path_Loss(aplay,uelay)

% intialize distance matrix
dist=zeros(size(uelay,1),size(aplay,1));     
% intialize PL matrix
pl=dist; 


% number of BSs and UEs
nbs=size(aplay,1);
nue=size(uelay,1);

% calculate UE-BS distance in 3D and 2D
dist_x=repmat(uelay(:,1),1,nbs)-repmat(aplay(:,1).',nue,1);
dist_y=repmat(uelay(:,2),1,nbs)-repmat(aplay(:,2).',nue,1);
dist_z=repmat(uelay(:,3),1,nbs)-repmat(aplay(:,3).',nue,1);
dist=sqrt(dist_x.^2+dist_y.^2);

frequency = 2e9;               % Frequency in Hz

hbs=25-1;
hms=1.5-1;
% H = 7;
distance = dist/1000;          % Calculations are done in Km
frequency = frequency/1000000000; % Calculations are done in freq in MHz

% pl(1:nue,:)=40*log10(distance) + 13.47 +6*log10(frequency/5) - 14*log10(hms) - 14*log10(hbs);


pl(1:nue,:) = 128.1 + 37.6*log10(distance);
% pl(1:nue,:)=40*log10(distance) + 9.45 +2.7*log10(frequency/5) - 17.3*log10(hms) - 17.3*log10(hbs);

% pl(1:nue,:) = 69.55+26.16*log10(frequency)-13.82*log10(Hb)+(44.9-6.55*log10(Hb))*log10(distance(1:nue,:))-4.78*(log10(frequency)^2)+18.33*log10(frequency)-40.94;
% pl(121,:) = 69.55+26.16*log10(frequency)-13.82*log10(H)+(44.9-6.55*log10(H))*log10(distance(121,:))-4.78*(log10(frequency)^2)+18.33*log10(frequency)-40.94;
% 
% figure 
% plot ( distance, pl); 
% hold on;
% grid On;
end