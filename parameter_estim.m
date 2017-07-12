%% DCDC Converter Parameter Estimation
% clc
% close all
% clear all

%% Specs

Vin_min=9
Vin_max=36
Vout=24
Iout=5

f=3E5 %Hz, switching frequency

%% Inductor Selection

Rt=6.4E9/f-3.02E3 %Ohms

Irip=[3.2 3.4 3.6 3.8 4 4.2 4.4 4.6 4.8 5] %A_p2p

Lbuck=Vout*(Vin_max-Vout)/(Vin_max*f)./Irip

Lboost=Vin_min*Vout/((Vout+Vin_min)*f)./Irip

L=6.8E-6 %H

Irip_buck=Vout*(Vin_max-Vout)/(Vin_max*f)/L

Irip_boost=Vin_min*Vout/((Vout+Vin_min)*f)/L

Ltol=0.2

eff=0.85

Ip_buck=Iout/eff+Irip_buck/(2*(1-Ltol))

Ip_boost=Iout*(Vout+Vin_min)/(eff*Vin_min)+Irip_boost/(2*(1-Ltol))



%% Rsense & Cramp

Kbuck=1+10/(Vin_max-Vout)
Kboost=1+10/Vin_min

Rbuck=1.25*0.9/(10*(Iout/eff+Irip_buck/2*Kbuck))
Rboost=2.5*0.9/(10*(Vin_min+Vout)/Vin_min*Iout/eff+Irip_boost/2*Kboost)

Rsense= 9E-3

Cramp=L*10^-6/(2*Rsense)

