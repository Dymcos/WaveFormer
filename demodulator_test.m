close all;clear all; clc; %#ok<CLALL>
addpath(genpath(pwd));
% addpath('..\WaveFormer')
%%
frameCount = 1;
ID=4; %ncell_ID
mu = 1;
[pss,sss]=SsGenerator.getSsSignalsByCellInfo(ID);
r=ResourceMapper();
r.createResourceGrid(mu,frameCount,false,30);

r.addSsBlockByCase('B',0:8,ID,pss,sss,ones(5*500,432)*0,ones(5*500,144)*0,0,0);

waveform=WaveFormer.createWaveform(r.resourceGrid);
% wvtool(waveform);
symb_l=size(r.resourceGrid,1);
% plot(abs(waveform))

% polarplot(waveform);
% title(gca,'Отсчеты сигнала')
% figure;
r=r.resourceGrid;
%%
s=pcolor(abs(r(1:260,1:80)));
s.EdgeColor='none';
grid off
a=gca();
a.YDir='normal';
xlabel('l (номер OFDM символа)')
ylabel('k (номер поднесущей)')
title(gca,'Ресурсная сетка ResourceMapper')
figure
tmp=OfdmDemodulation(waveform,symb_l);
s=pcolor(abs(tmp(1:260,1:80)));
s.EdgeColor='none';
grid off
a=gca();
a.YDir='normal';
xlabel('l (номер OFDM символа)')
ylabel('k (номер поднесущей)')
title(gca,'Восстановленная из сигнала рисурсная сетка')


disp("MSE:"+mean(reshape(abs(r-tmp).^2,1,[]))^0.5)