clc;
clear all;
close all;
rp=input('enter the passband ripple');
rs=input('enter the stopband ripple');
fp=input('enter the passband freq');
fs=input('enter the stopband freq');
f=input('enter the sampling freq');
wp=2*fp/f;
ws=2*fs/f;
num=-20*log10(sqrt(rp*rs))-13;
dem=14.6*(fs-fp)/f; n=ceil(num/dem);
n1=n+1;
if (rem(n,2)~=0)
n1=n; n=n-1;
end
y=hamming(n1);
% low-pass filter
b=fir1(n,wp,y);
[h,o]=freqz(b,1,256);
m=20*log10(abs(h));
subplot(2,2,1);
plot(o/pi,m);ylabel('Gain in dB --.');
xlabel('(a) Normalised frequency --.');
% high-pass filter
b=fir1(n,wp,'high',y);
[h,o]=freqz(b,1,256);
m=20*log10(abs(h));
subplot(2,2,2);
plot(o/pi,m);
ylabel('Gain in dB --.');
xlabel('(b) Normalised frequency --.');
% band pass filter
wn=[wp ws];
b=fir1(n,wn,y);
[h,o]=freqz(b,1,256);
m=20*log10(abs(h));
subplot(2,2,3);
plot(o/pi,m);ylabel('Gain in dB -->');
xlabel('(c) Normalised frequency -->');
% band stop filter
b=fir1(n,wn,'stop',y);
[h,o]=freqz(b,1,256);
m=20*log10(abs(h));
subplot(2,2,4);
plot(o/pi,m);
ylabel('Gain in dB -->');
xlabel('(d) Normalised frequency -->');