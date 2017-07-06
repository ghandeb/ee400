clc
close all
clear all
% % 
% % %level 1 severity

time=0:0.001:120

time=transpose(time)


num=numel(time)
freq=zeros(num,1)
% % 
% % freq1=50+(25000-50)/60.*time1
% % freq2=50000-(25000-50)/60.*time2
% % 
% % freq=cat(1,freq1,freq2)
% % 
% % plot(time,freq)
% % %vpp=1 V
% % t=-0.0006:0.00000001:0.0006
% % t=transpose(t)

for k=1:60001
    freq(k,1)=0.005+(2.5-0.005)/60*time(k,1)
end
    freq(60002,1)=2.5
    
for m=60003:num
        freq(m,1)=-1*(2.5-0.005)/60*(time(m,1)-60)+0.005
end
    

 wf=0.5*sin(2*pi*time.*freq-pi)
figure
 plot(time,wf)
 figure
plot(time,freq)



