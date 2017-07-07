% clc
% close all
% clear all

t=0:0.0001:350;
t=transpose(t);

waveform=zeros(numel(t),2)
waveform(:,1)=t

tt=1:1:50000;
tt=transpose(tt);

tfall=0.0001:0.0001:0.01
tfall=transpose(tfall)

volt=zeros(3*numel(tt),20);


V=24; %supply voltage

    
a=ones(50000,1)
c=ones(49800,1)
d=1/(-10+10.01).*tfall

for i=1:20


v1=V*a
v2=V-V/20*i*d
v3=(V-V/20*i)*c
v4=(V-V/20*i)+V/20*i*d

volt(:,i)=cat(1,v1,v2,v3,v4,v1)

end

init=V*ones(150001,1)
fin=V*ones(350000,1)
middle=cat(1,volt(:,1),volt(:,2),volt(:,3),volt(:,4),volt(:,5),volt(:,6),volt(:,7),volt(:,8),volt(:,9),volt(:,10),volt(:,11),volt(:,12),volt(:,13),volt(:,14),volt(:,15),volt(:,16),volt(:,17),volt(:,18),volt(:,19),volt(:,20))
clear volt
waveform(:,2)=cat(1,init,middle,fin)

% waveform(:,2)=2*waveform(:,2)
% plot(t,waveform(:,2))