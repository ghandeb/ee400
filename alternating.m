clc
close all
clear all

%level 1 severity

time=0:0.0000001:0.012
time1=0:0.0000001:0.006
time2=0.0060001:0.0000001:0.012
trev=0.0060001:-0.0000001:0.0000001

trev=transpose(trev)
time=transpose(time)
time1=transpose(time1)
time2=transpose(time2)

num=numel(time)
freq=zeros(num,1)

freq1=50+(25000-50)/0.006.*time1
freq2=50000-(25000-50)/0.006.*trev

freq=cat(1,freq1,freq2)

%vpp=1 V

wf=0.5*sin(2*pi*time.*freq)



plot(wf)
plot(time,freq)


