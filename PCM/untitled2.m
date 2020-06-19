%PCM 

clc;
close all;
clear all;

fm=input('Enter the value of frequency: ');
n=input('Enter no of bits for PCM');
A=2;
t=0:0.01:1;
ts=0:0.01:1;

x=A*cos(2*pi*fm*t);

fs=2*fm;

xs=A*cos(2*pi*fm*ts);

x1=xs+A;
x1/(2*A);
L=(-1+2^n);
x1=L*x1;
xq=round(x1);
y=[];
for i=1:length(xq)
    d=dec2bin(xq(i),n);
    y=[y double(d)-48];
end
figure(1);
plot(t,x,'LineWidth',2);
title('Sampling','fontsize',14);
ylabel('Amplitude \rightarrow');
xlabel('Time t\rightarrow');
hold on;
stem(ts,xs,'r','LineWidth',2);
hold off;
legend('Original Signal','Sampled Signal','Location','Northeast');

figure (2);
stem(ts,x1-(L/2),'LineWidth',2);
title('Quantization','FontSize',14);
ylabel('Levels L\rightarrow');
xlabel('Samples \rightarrow');
hold on;
stem(ts,xq-(L/2),'r','LineWidth',2);
plot(ts,xq-(L/2),'--k');
hold off;
legend ('Sampled Signal','Quantized Signal');

figure (3);
stairs([y y(length(y))],'LineWidth',2);
title('Encoded Waveform','FontSize',14);
ylabel('Binary Signal\rightarrow');
xlabel('bits\rightarrow');
axis ([0 length(y) -1 2]);
grid on;

