function [wave] = sinepwm(frequency,duration,output_voltage)
t=0:0.000000001:duration;
t=transpose(t);

sine=sin(2*pi*frequency*t);

tri=sawtooth(16*pi*frequency*t,0.5);

wave=zeros(numel(t),2);
wave(:,1)=t;

for k=1:numel(t)
    wave(k,2)=sine(k,1)>tri(k,1);
end 

wave=double(wave);
wave(:,2)=output_voltage*wave(:,2);

end

