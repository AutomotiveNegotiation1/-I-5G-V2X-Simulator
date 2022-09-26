function [d thetaBS thetaMS OmegaBS OmegaMS thetav]=Orientations(R)

d=round(R*rand(1));%Distance between the BS and MS in meters

OmegaBS=0;%Angle between the absolute North and the BS antenna broadside

OmegaMS=round(360*rand(1));%Angle between the absolute North and the MS antenna broadside

thetaBS=round(360*rand(1));%Angle between the BS antenna broadside and the LOS connection

thetav=round(360*rand(1));%Angle between the direction of the MS and the LOS connection

thetaMS=round(abs(OmegaBS-OmegaMS+thetaBS+180));%Angle between the MS antenna broadside and the LOS connection