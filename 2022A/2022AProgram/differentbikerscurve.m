clc,clear,close all;
data = [
85.667	90	87	29.439	30.928	29.897
4	4.3	4	4	4.3	4
1.5	2	1	1.5	2	1
4.7893802	5.0316246	4.86390378	1.645844407	1.729090509	1.671454158
-0.1746259	-0.1218321	-0.2619389	-0.17462595	-0.12183206	-0.261938925
18.75	15.12	28.13	18.75	15.12	28.13
]
figure
hold on
t = 0:0.01:60.2;
P = 4.78938020./(1+(-0.87373205.*exp(0.98821016*-0.1746259.*t))); %Men
P(6000:6020) = 18.75;
plot(t,P,'Color','b', 'LineWidth',1);
set(gca,'Xtick',[0.1 1 2 5 10 30 60]);
set(gca,'Xscale','log');
xlabel('t/min');
ylabel('P/(Watts per kg)');
%title('Power Curve of Different Riders');

hold on
t = 0:0.01:60.2;
P = 5.031625./(1+(-0.87373205.*exp(0.98821016*-0.1218321.*t))); %Men
P(6000:6020) = 15.12;
plot(t,P,'Color','k','LineWidth',1);

hold on
t = 0:0.01:60.2;
P = 4.86390378./(1+(-0.87373205.*exp(0.98821016*-0.2619389.*t))); %Men
P(6000:6020) = 28.13;
plot(t,P,'Color','c','LineWidth',1);

hold on
t = 0:0.01:60.2;
P = 1.645844407./(1+(-0.87373205.*exp(0.98821016*-0.174626.*t))); %Men
P(6000:6020) = 18.75;
plot(t,P,'Color','r','LineWidth',1);

hold on
t = 0:0.01:60.2;
P = 1.671454158./(1+(-0.87373205.*exp(0.98821016*-0.12183206.*t))); %Men
P(6000:6020) = 15.12;
plot(t,P,'Color','m','LineWidth',1);

hold on
t = 0:0.01:60.2;
P = 1.561919./(1+(-0.87373205.*exp(0.98821016*-0.261938925.*t))); %Men
P(6000:6020) = 28.13;
plot(t,P,'Color',[0.8500 0.3250 0.0980],'LineWidth',1);

legend('1','2','3','4','5','6');