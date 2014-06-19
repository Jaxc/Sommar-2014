close all
clear xlabel ylabel
%T1d= [890153.535 1520518.648 2759372.745 10062560.307];
%T1e= [154197.375 175060.424 192373.232 229685.839];

T1d= [890153.535 1520518.648 10062560.307];
T1e= [154197.375 175060.424 229685.839];

T1 = T1e+T1d;

T2d= [1379395.590 1935541.068  10757563.840];
T2e= [214060.922 246360.553 326864.784];

T2 = T2e+T2d;

m = [6 7 10];
Xval1 = [6 7 8 10];


n = 2.^m -1;
k1 = n-m.*1;
k2 = n-m.*2;

freq = 1e9;

plot(m,T1,m,T2)
title('Power consumption relative to parameters')
ylabel('Power consumption [nW]')
xlabel('m')
legend('Location','SouthEast','T=1','T=2')
figure


plot(T1, freq * k1 ./ n,T2, freq * k2 ./ n)
hold on
plot([T1(1) T2(1)], freq .* [k1(1) k2(1)] ./ n(1),'*k',[T1(2) T2(2)] , freq ./ n(2) .* [k1(2) k2(2)],'xk',[T1(3) T2(3)] , freq ./ n(3) .* [k1(3) k2(3)],'ok')
xlabel('Power consumption [nW]')
ylabel(['bits/second'])
legend('Location','SouthEast','t=1','t=2','m=6','m=7','m=10')
title('Power consumption relative to throughput speed')



m6 = [890153.535+154197.375 1292417.855+217675.522 1639993.958+325251.350 2066870.248+344593.460];
m7 = [1520518.648+175060.424 2227962.232+248147.261 2906676.119+346602.521 3601702.022+390207.513];
m10 = [10062560.307+229685.839 14925979.427+330254.938 19747697.789+481052.977];
figure
clear xlabel ylabel
plot ([1 1.5 2 2.5], m6, [1 1.5 2 2.5], m7,[1 1.5 2], m10)
xlabel ('Frequency [GHz]');
ylabel ('Power consumption [nW]');
title('Power consumption relative to frequency (T = 1)')
legend('m=6','m=7','m=10')

