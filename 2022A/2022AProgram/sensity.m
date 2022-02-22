clear,clc;
for ii = 1:21 %75-95
    for jj =1:31 %2.5-5.5
        VO2 = 74+ii;
        LT = (24+jj)/10;
        radio = 1.5;
        Pm = 0.055906944*VO2;
        r = -1.047755696/radio/LT;
        clear v;
        x = 0;
        g = 9.8;
        M = 69.3+0.7;
        dt = 1;
        t = 1;
        mug = 0.005;
        tokyolen = 44200;
        H = 1.70;
        Cd = 0.0959;%Cd = 0.7959;
        vw = 3;
        v(1) = 0;
        thetaw = pi/4*3;
        the = 0.686792453;
        flag = 0;%是否处于转弯时
        Wtot = 0;
        while (x < tokyolen)
            if(t==1)
                F = 0.3*M*g;
            else
                F = M*Pm/(1+(-0.87373205*exp(0.98821016*r*t)))/v(t);
            end
            FA = 0.0293*(H^0.725)*(M^0.425)+0.0604;
            thebefore = the;
            the = theta(x);
            if(the ~= thebefore)
                flag = 1;
            end
            if flag == 1 && v(t) <= 7
                flag = 0;
            end
            if(flag == 0)
                a = (F - (M*g*sin(alpha(x))) - mug*M*g*cos(alpha(x)) -Cd*FA*(v(t)*v(t)+vw*vw+2*v(t)*vw*cos(thetaw-theta(x))))/M;
            else
                a = -v(t)/3*2;
            end
            v(t+1) = v(t)+a*dt;
            x = x+v(t+1)*dt;
            t = t+dt;
            Wtot = Wtot+F*v(t)*dt;
        end
        ANS(ii,jj) = Wtot/t/M;
    end
end
figure;
subplot(2,2,[1,3]);
xname = 75:95;
yname = 2.5:0.1:5.5;
heatmap(ANS);
var(ANS)
colormap(gca, 'parula');
title('Sensitivity analysis');

subplot(2,2,2);
ANS = ANS(1:5:21,1:5:31);
plotmatrix(ANS);
title('Correlation plot');

subplot(2,2,4);
covmat = corrcoef(ANS);
imagesc(covmat);
grid;colorbar;
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
title('Correlation strength');


function al = alpha(x)
    dis = [1 0.3 0.9 5.2 5.4 2 2.5 2.1 2.7]*1000;
    jiao = [-0.029991004 0.039978686 -0.016664648 0.042474332 -0.032581055 0.044969661 -0.011999424 0.014759928 0.036280369];
    if(x >= 22100)
        x = 22100;
    end
    tot = 0;
    for i = 1:9
        tot = tot+dis(i);
        if(x <= tot)
            al = jiao(i);
            break;
        end
    end
end

function t = theta(x)
    dis=[
0.686792453
0.78490566
0.981132075
0.367924528
0.367924528
1.275471698
0.858490566
0.294339623
0.760377358
0.735849057
1.741509434
0.613207547
2.20754717
0.78490566
0.171698113
0.441509434
0.122641509
1.103773585
1.471698113
0.735849057
0.858490566
4.169811321
0.564150943
]*1000;
    jiao = [
1.047197533
0.741764919
0
0.741764919
-0.130899692
-0.349065844
0.715584981
1.082104118
2.617993833
0.907571196
-2.478367496
-0.698131689
0.872664611
-2.443460911
-0.523598767
0.78539815
-0.698131689
-1.047197533
-1.047197533
-1.5707963
2.617993833
0
2.443460911
        ];
    if(x >= 22100)
        x = x-22100;
    end
    tot = 0;
    for i = 1:23
        tot = tot+dis(i);
        if(x <= tot)
            t = jiao(i);
            break;
        end
    end
end
