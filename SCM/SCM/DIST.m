function [ds]=DIST(Ds)

ds(1)=0;
k=1;
for k=1:length(Ds)
    sum=Ds(k);
    ds(k+1)=ds(k)+sum;
    k=k+1;
end