clc
close all
clear all

% level 1 severity

t1=0:0.000000001:0.0002500
t1=transpose(t1)
tf1=0.000000001:0.000000001:0.000000500
tf1=transpose(tf1);
tf2=0.000000001:0.000000001:0.000001000
tf2=transpose(tf2)
tr1=0.000000001:0.000000001:0.000005000
tr1=transpose(tr1)
tr2=0.000000001:0.000000001:0.000004000
tr2=transpose(tr2)

sample=numel(t1)

cr12=zeros(sample,2)
cr24=zeros(sample,2)

x=ones(40001,1) %for both
x1=12*x
x2=24*x

y1=12-(12-8)/0.0000005.*tf1 %for 12v
y2=24-(24-10)/0.000001.*tf2 %for 24

z1=8*ones(1500,1) %for 12v
z2=10*ones(5000,1) %for 24v

u=1/0.000005.*tr1 %for both
u1=8+(10.5-8)*u %12
u2=10+(21-10)*u %24

w=2*pi*20000
tsin=0.000000001:0.000000001:0.0001
tsin=transpose(tsin)
v1=10.5-sin(w*tsin) %12
v2=21-sin(w*tsin) %24

m=1/0.000004.*tr2 %for both
m1=10.5+(-10.5+12)*m %12
m2=21+(-21+24)*m %24

n1=12*ones(99000,1)
n2=24*ones(95000,1)
500
cr12(:,1)=t1
cr12(:,2)=cat(1,x1,y1,z1,u1,v1,m1,n1)

cr24(:,1)=t1
cr24(:,2)=cat(1,x2,y2,z2,u2,v2,m2,n2)
