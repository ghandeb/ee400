% clc
% close all
% clear all

t=0:0.000000001:0.0350;
t=transpose(t);

waveform=zeros(numel(t),2)
waveform(:,1)=t

tt=1:1:500000;
tt=transpose(tt);

tfall=0.000000001:0.000000001:0.000001
tfall=transpose(tfall)

volt=zeros(3*numel(tt),20);


V=12; %supply voltage

% init=V*ones(numel(initial),1)
% space=V*ones(numel(initial)-1,1)
    
a=ones(500000,1)
c=ones(498000,1)
d=1/(-0.0010+0.001001).*tfall
% e=ones(190000,1)

for i=1:20


v1=V*a
v2=V/20*i*d
v3=(V-V/20*i)*c
v4=(V-V/20*i)+V/20*i*d

volt(:,i)=cat(1,v1,v2,v3,v4,v1)

end

init=V*ones(1500001,1)
fin=V*ones(3500000,1)
overall=cat(1,init,volt(:,1),volt(:,2),volt(:,3),volt(:,4),volt(:,5),volt(:,6),volt(:,7),volt(:,8),volt(:,9),volt(:,10),volt(:,11),volt(:,12),volt(:,13),volt(:,14),volt(:,15),volt(:,16),volt(:,17),volt(:,18),volt(:,19),volt(:,20),fin)
waveform(:,2)=overall

plot(waveform)