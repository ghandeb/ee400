% clc
% close all
% clear all

t=0:0.000000001:0.0350;
t=transpose(t);

tt=1:1:500000;
tt=transpose(tt);

tfall=0.000000001:0.000000001:0.000001
tfall=transpose(tfall)

volt=zeros(3*numel(tt),20);


V=12; %supply voltage

% init=V*ones(numel(initial),1)
% space=V*ones(numel(initial)-1,1)

for i=1:20
    
a=ones(500000,1)
c=ones(498000,1)
d=1/(-0.0010+0.001001).*tfall
% e=ones(190000,1)

v1=V*a
v2=V/20*i*d
v3=(V-V/20*i)*c
v4=(V-V/20*i)+V/20*i*d

volt(:,i)=cat(1,v1,v2,v3,v4,v1)

end

    