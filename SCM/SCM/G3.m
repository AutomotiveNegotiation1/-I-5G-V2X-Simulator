function [G,A]=G3(Ang)
%The function G3.m gives the 3 Sector antenna numeric gain and 
%attenuation.
%
%Input Parameters
%
%Ang is the angle between the direction of interest and the boresight
%of the antenna in degrees. 
%
%Output Parameters
%
%G is the numeric antenna gain in dBs
%
%A is the antenna attenuation in dB
if Ang>180
    Ang=360-Ang;
elseif Ang<-180
    Ang=360+Ang;
end
Am=20;%3 Sector antenna maximum attenuation in dB
Ang3db=70;%3 Sector 3 dB beamwidth in de;grees
A=-min(12*((Ang/Ang3db)^2),Am);
G=10^(0.1*A);