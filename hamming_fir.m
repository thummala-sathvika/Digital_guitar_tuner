clear all;
clc;
close all;
range=30;
x=isempty (input ('Press enter to start program or press zero to
quit.'));
p=input ('Which string are you adjusting? [1=E 2=B 3=G 4=D 5=A
6=Emin]: ');
fc=0.1;
Fs=500;
samples = [1,2*Fs];
[Z,Fs] = audioread('g.wav',samples)
m=length(Z);
n=0:1:m-1;
l=n-(m-1)/2;
plot(Z); %fig 1
title('Input signal')
xlabel('n')
ylabel('Z')
figure;
[h,w]=fft(Z);
plot(w/pi,abs(h));grid %fig 2
title('Frequency response of input function')
xlabel('Frequency')
ylabel('Amplitude')
rp=0.891;
rs=0.0032;
fp=75;
fs=1320;
wp=2*fp/Fs;
ws=2*fs/Fs;
num=-20*log10(sqrt(rp*rs))-13;
dem=14.6*(fs-fp)/Fs;
n=ceil(num/dem);
n1=n+1;
if (rem(n,2)~=0)
n1=n;
n=n-1;
end
y=hamming(n1);
wn=[wp ws];
b=fir1(n,wn,y);
[h,o]=freqz(b,1,256);
m=20*log10(abs(h));
figure;
plot(o/pi,m);ylabel('Gain in dB');
xlabel('Normalised frequency ');
grid
title('Hamming Window')
figure;
t=filter(b,1,Z);
plot(t); %fig 4
title('Filtered audio signal using hamming window')
xlabel('freq')
ylabel('Amplitude')
figure;
y1=downsample(t,2);
plot(y1);
title('Downsampling by factor 2')
xlabel('Freq')
ylabel('Amplitude')
y4 = padarray(y1,[500,0],0,'post')
figure;
y2=downsample(t,3);
plot(y2);
title('Downsampling by factor 3')
xlabel('Freq')
ylabel('Amplitude')
y5 = padarray(y2,[666,0],0,'post')
figure;
y3=downsample(t,4);
plot(y3);
title('Downsampling by factor 4')
xlabel('Freq')
ylabel('Amplitude')
y6 = padarray(y3,[750,0],0,'post')
y7=y4+y5+y6+t;
figure;
plot(y7);
title('Harmonic addition spectrum')
xlabel('Freq')
ylabel('Amplitude')
[m,index]=max(y7)
max=max(index)
if p==1
 fprintf('The input fundamental frequency is : %d\n', max');
if ((330+range)>(max)&& (330-range)<(max)),
display ('Perfect Intonation!!!');
elseif (330-range)>(max),
display ('Input frequency should be increased');
elseif (330+range)<(max),
display ('Input frequency should be decreased');
end
elseif p==2
fprintf('The input fundamental frequency is : %d\n', max');
if ((246.9+range)>(max)&& (246.9-range)<(max)),
display ('Perfect Intonation!!!');
elseif (246.9-range)>(max),
display ('Input frequency should be increased');
elseif (246.9+range)<(max),
display ('Input frequency should be decreased');
end
elseif p==3
fprintf('The input fundamental frequency is : %d\n', max');
if ((196+range)>(max)&& (196-range)<(max)),
display ('Perfect Intonation!!!');
elseif (196-range)>(max),
display ('Input frequency should be increased');
elseif (196+range)<(max),
display ('Input frequency should be decreased');
end
 elseif p==4
fprintf('The input fundamental frequency is : %d\n', max');
if ((146.83+range)>(max)&& (146.83-range)<(max)),
display ('Perfect Intonation!!!');
elseif (146.83-range)>(max),
display ('Input frequency should4 be increased');
elseif (146.83+range)<(max),
display ('Input frequency should be decreased');
end
 elseif p==5
fprintf('The input fundamental frequency is : %d\n', max');
if ((110+range)>(max)&& (110-range)<(max)),
display ('Perfect Intonation!!!');
elseif (110-range)>(max),
display ('Input frequency should be increased');
elseif (110+range)<(max),
display ('Input frequency should be decreased');
end
 elseif p==6
fprintf('The input fundamental frequency is : %d\n', max');
if ((82.4+range)>(max)&& (82.4-range)<(max)),
display ('Perfect Intonation!!!');
elseif (82.4-range)>(max),
display ('Input frequency should be increased');
elseif (82.4+range)<(max),
display ('Input frequency should be decreased');
end
end
display('Tune the guitar accordingly')
