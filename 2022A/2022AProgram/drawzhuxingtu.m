clc,clear,close all;
figure
X=[15.22	17.35	13.09
7.23	8.02	6.44
4.83	5.15	4.51
3.5	3.88	3.12]
X = X'
boxplot(X,'BoxStyle','filled','Colors',[0.5,0.5,0.5])
hold on
Y = [19.42	9.29	6.61	5.69
19.2	9.2	6.52	5.61
18.99	9.11	6.42	5.53
18.77	9.02	6.33	5.44
18.56	8.93	6.24	5.36
18.34	8.84	6.15	5.28
18.13	8.75	6.05	5.2
17.91	8.66	5.96	5.12
17.7	8.56	5.87	5.03
18.56	8.93	6.24	5.36
]
boxplot(Y,'BoxStyle','filled','Colors','k')