    close all;
    clear all;
    clc;
    
    load NewSim.mat;
    load eksiarti_33-84.mat;
    load plot_data_axes.mat;
    
    ContourNum=15;
    PlotPosition=[624   0.13*474   1.75*672   1.75*504];
    
   %% Torque
    
    C = mat2cell(TqClcd_tbl, 33, [42, 42]);
    first=C(1,1);
    sec=C(1,2);
    first=cell2mat(first);
    sec=cell2mat(sec);
    sec=fliplr(sec);
    new=cat(2,first,sec);
    TqClcd_tbl=new;

    figure;
    
    [C,h]=contourf(NRef_tbl,TqRef_tbl,TqClcd_tbl,ContourNum-5);
    clabel(C,h);
    title(strcat('Torque [Nm]','  f_s=',num2str(Fsw),' Hz')); ylabel('Torque [Nm]'); xlabel('Speed [rpm]'); colorbar; set(gcf,'Position',PlotPosition); grid on;
    saveas(gcf, [path,'Torque','.jpg'],'jpg');
    
    %% Diode Conduction Loss
    
    C = mat2cell(PDiodeCnd_tbl, 33, [42, 42]);
    first=C(1,1);
    sec=C(1,2);
    first=cell2mat(first);
    sec=cell2mat(sec);
    sec=fliplr(sec);
    new=cat(2,first,sec);
    PDiodeCnd_tbl=new;
    
    figure;
    
    [C,h]=contourf(NRef_tbl,TqRef_tbl,PDiodeCnd_tbl,ContourNum);
    clabel(C,h);
    title(strcat('Diode Conduction Loss [W]','  f_s=',num2str(Fsw),' Hz')); ylabel('Torque [Nm]'); xlabel('Speed [rpm]'); colorbar; set(gcf,'Position',PlotPosition); grid on;
    saveas(gcf, [path,'P Diode Conduction Loss','.jpg'],'jpg');
    
    %% Diode Switching Loss
    
    C = mat2cell(PDiodeSw_tbl, 33, [42, 42]);
    first=C(1,1);
    sec=C(1,2);
    first=cell2mat(first);
    sec=cell2mat(sec);
    sec=fliplr(sec);
    new=cat(2,first,sec);
    PDiodeSw_tbl=new;
    
    figure;
    
    [C,h]=contourf(NRef_tbl,TqRef_tbl,PDiodeSw_tbl,ContourNum);    
    clabel(C,h);
    title(strcat('Diode Switching Loss [W]','  f_s=',num2str(Fsw),' Hz')); ylabel('Torque [Nm]'); xlabel('Speed [rpm]'); colorbar; set(gcf,'Position',PlotPosition); grid on;
    saveas(gcf, [path,'P Diode Switching Loss','.jpg'],'jpg');
    
    %% IGBT Conduction Loss
    
    C = mat2cell(PIgbtCnd_tbl, 33, [42, 42]);
    first=C(1,1);
    sec=C(1,2);
    first=cell2mat(first);
    sec=cell2mat(sec);
    sec=fliplr(sec);
    new=cat(2,first,sec);
    PIgbtCnd_tbl=new;
    
    figure;
    
    [C,h]=contourf(NRef_tbl,TqRef_tbl,PIgbtCnd_tbl,ContourNum);
    clabel(C,h);
    title(strcat('IGBT Conduction Loss [W]','  f_s=',num2str(Fsw),' Hz')); ylabel('Torque [Nm]'); xlabel('Speed [rpm]'); colorbar; set(gcf,'Position',PlotPosition); grid on;
    saveas(gcf, [path,'P IGBT Conduction Loss','.jpg'],'jpg');
    
    
    %% IGBT Switching Loss
    
    C = mat2cell(PIgbtSw_tbl, 33, [42, 42]);
    first=C(1,1);
    sec=C(1,2);
    first=cell2mat(first);
    sec=cell2mat(sec);
    sec=fliplr(sec);
    new=cat(2,first,sec);
    PIgbtSw_tbl=new;
    
    figure;
    
    [C,h]=contourf(NRef_tbl,TqRef_tbl,PIgbtSw_tbl,ContourNum);
    clabel(C,h);
    title(strcat('IGBT Switching Loss [W]','  f_s=',num2str(Fsw),' Hz')); ylabel('Torque [Nm]'); xlabel('Speed [rpm]'); colorbar; set(gcf,'Position',PlotPosition); grid on;
    saveas(gcf, [path,'P IGBT Switching Loss','.jpg'],'jpg');
    
    %% Efficiency
    
    C = mat2cell(EffInv_tbl, 33, [42, 42]);
    first=C(1,1);
    sec=C(1,2);
    first=cell2mat(first);
    sec=cell2mat(sec);
    sec=fliplr(sec);
    new=cat(2,first,sec);
    EffInv_tbl=new;
    
    figure;
    
    [C,h]=contourf(NRef_tbl,TqRef_tbl,100*EffInv_tbl,ContourNum+30);
    clabel(C,h);
    title(strcat('Inverter Efficiency [%]','  f_s=',num2str(Fsw),' Hz')); ylabel('Torque [Nm]'); xlabel('Speed [rpm]'); colorbar; set(gcf,'Position',PlotPosition); grid on;
    saveas(gcf, [path,'Efficiency Inverter','.jpg'],'jpg');
    
    %% Total Loss
    
    C = mat2cell(PLoss_tbl, 33, [42, 42]);
    first=C(1,1);
    sec=C(1,2);
    first=cell2mat(first);
    sec=cell2mat(sec);
    sec=fliplr(sec);
    new=cat(2,first,sec);
    PLoss_tbl=new;
    
    figure;
    
    [C,h]=contourf(NRef_tbl,TqRef_tbl,PLoss_tbl,ContourNum-5);
    clabel(C,h);
    title(strcat('Total Inverter Loss [W]','  f_s=',num2str(Fsw),' Hz')); 
    ylabel('Torque [Nm]'); xlabel('Speed [rpm]'); 
    colorbar; 
    set(gcf,'Position',PlotPosition); 
    grid on;
    saveas(gcf, [path,'P Total Loss','.jpg'],'jpg');

    %% Save Data
    
    clear C;
    clear new;
    clear first;
    clear sec;
    save map_data.mat;