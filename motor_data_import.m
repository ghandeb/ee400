%% DATA IMPORT

%% Initial

close all
clear all
clc

file_name=char('20170803_ETA_EM_XH243_VA_PSM_K15_AVL.xlsx');
page_number=char('250V_80C_motgen_56');

Ld1=zeros(42,33);
Ld2=zeros(42,33);
Id1=zeros(42,33);
Id2=zeros(42,33);
T1=zeros(42,33);
T2=zeros(42,33);
Lq1=zeros(42,33);
Lq2=zeros(42,33);
Iq1=zeros(42,33);
Iq2=zeros(42,33);
PM1=zeros(42,33);
PM2=zeros(42,33);
R1=zeros(42,33);
R2=zeros(42,33);
Torque=zeros(84,33);
Id=zeros(84,33);
Iq=zeros(84,33);
Ld=zeros(84,33);
Lq=zeros(84,33);
PsiPM=zeros(84,33);
Rstator=zeros(84,33);

%% Speed

Speed=[0.001 200:200:3200 3600:400:5600 6400:800:12000 12400 13200];
Speed=transpose(Speed);

%% Torque

for k=1:33
    basla=(k-1)*42+3+1386;
    bitis=k*42+2+1386;
    range=strcat('B',num2str(basla),':','B',num2str(bitis));
    T1(:,k)= xlsread(file_name,page_number,range);
    basla=(k-1)*42+3;
    bitis=k*42+2;
    range=strcat('B',num2str(basla),':','B',num2str(bitis));
    T2(:,k)= xlsread(file_name,page_number,range);
    T2(:,k)=flipud(T2(:,k));
    Torque(:,k)=cat(1,T1(:,k),T2(:,k));
end

Torque= transpose(Torque);
clear T1;
clear T2;

%% Id

for k=1:33
    basla=(k-1)*42+3+1386;
    bitis=k*42+2+1386;
    range=strcat('U',num2str(basla),':','U',num2str(bitis));
    Id1(:,k)= xlsread(file_name,page_number,range);
    basla=(k-1)*42+3;
    bitis=k*42+2;
    range=strcat('U',num2str(basla),':','U',num2str(bitis));
    Id2(:,k)= xlsread(file_name,page_number,range);
    Id2(:,k)=flipud(Id2(:,k));
    Id(:,k)=cat(1,Id1(:,k),Id2(:,k));
end

Id= transpose(Id);
clear Id1;
clear Id2;

%% Iq

for k=1:33
    basla=(k-1)*42+3+1386;
    bitis=k*42+2+1386;
    range=strcat('T',num2str(basla),':','T',num2str(bitis));
    Iq1(:,k)= xlsread(file_name,page_number,range);
    basla=(k-1)*42+3;
    bitis=k*42+2;
    range=strcat('T',num2str(basla),':','T',num2str(bitis));
    Iq2(:,k)= xlsread(file_name,page_number,range);
    Iq2(:,k)=flipud(Iq2(:,k));
    Iq(:,k)=cat(1,Iq1(:,k),Iq2(:,k));
end

Iq= transpose(Iq);
clear Iq1;
clear Iq2;

%% Ld

for k=1:33
    basla=(k-1)*42+3+1386;
    bitis=k*42+2+1386;
    range=strcat('AA',num2str(basla),':','AA',num2str(bitis));
    Ld1(:,k)= xlsread(file_name,page_number,range);
    basla=(k-1)*42+3;
    bitis=k*42+2;
    range=strcat('AA',num2str(basla),':','AA',num2str(bitis));
    Ld2(:,k)= xlsread(file_name,page_number,range);
    Ld2(:,k)=flipud(Ld2(:,k));
    Ld(:,k)=cat(1,Ld1(:,k),Ld2(:,k));
end

Ld= transpose(Ld);
clear Ld1;
clear Ld2;

%% Lq

for k=1:33
    basla=(k-1)*42+3+1386;
    bitis=k*42+2+1386;
    range=strcat('AB',num2str(basla),':','AB',num2str(bitis));
    Lq1(:,k)= xlsread(file_name,page_number,range);
    basla=(k-1)*42+3;
    bitis=k*42+2;
    range=strcat('AB',num2str(basla),':','AB',num2str(bitis));
    Lq2(:,k)= xlsread(file_name,page_number,range);
    Lq2(:,k)=flipud(Lq2(:,k));
    Lq(:,k)=cat(1,Lq1(:,k),Lq2(:,k));
end

Lq= transpose(Lq);
clear Lq1;
clear Lq2;

%% PsiPM

for k=1:33
    basla=(k-1)*42+3+1386;
    bitis=k*42+2+1386;
    range=strcat('Y',num2str(basla),':','Y',num2str(bitis));
    PM1(:,k)= xlsread(file_name,page_number,range);
    basla=(k-1)*42+3;
    bitis=k*42+2;
    range=strcat('Y',num2str(basla),':','Y',num2str(bitis));
    PM2(:,k)= xlsread(file_name,page_number,range);
    PM2(:,k)=flipud(PM2(:,k));
    PsiPM(:,k)=cat(1,PM1(:,k),PM2(:,k));
end

PsiPM= transpose(PsiPM);
clear PM1;
clear PM2;

%% Rstator

for k=1:33
    basla=(k-1)*42+3+1386;
    bitis=k*42+2+1386;
    range=strcat('Z',num2str(basla),':','Z',num2str(bitis));
    R1(:,k)= xlsread(file_name,page_number,range);
    basla=(k-1)*42+3;
    bitis=k*42+2;
    range=strcat('Z',num2str(basla),':','Z',num2str(bitis));
    R2(:,k)= xlsread(file_name,page_number,range);
    R2(:,k)=flipud(R2(:,k));
    Rstator(:,k)=cat(1,R1(:,k),R2(:,k));
end

Rstator= transpose(Rstator);
clear R1;
clear R2;

%% Save

clear basla;
clear bitis;
clear range;
clear k;
clear file_name;

name=strcat(page_number,'.mat');
clear page_number;
save(name);





