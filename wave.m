clc
close all
clear all

t=0:0.000000001:0.0012
t=transpose(t)
tfall=0.000000001:0.000000001:0.000001
tfall=transpose(tfall)

sample=numel(t)

v12=zeros(sample,2)
v24=zeros(sample,2)

a=ones(1000001,1)
c=ones(8000,1)
d=1/(-0.0010+0.001001).*tfall
e=ones(190000,1)

v12_1=12*a
v12_2=12-(12-4.5)*d
v12_3=4.5*c
v12_4=4.5+(12-4.5)*d
v12_5=12*e

v12(:,1)=t
v12(:,2)=cat(1,v12_1,v12_2,v12_3,v12_4,v12_5)


v24_1=24*a
v24_2=24-(24-9)*d
v24_3=9*c
v24_4=9+(24-9)*d
v24_5=24*e

v24(:,1)=t
v24(:,2)=cat(1,v24_1,v24_2,v24_3,v24_4,v24_5)
val=v24(:,2)