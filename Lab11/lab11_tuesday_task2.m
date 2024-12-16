clear all;
clc;
P_e=0.000001:0.001:0.9999999;

Cs=1-(P_e.*log2(1./P_e)+(1-P_e).*log2(1./(1-P_e)))
figure(1)
plot(P_e, Cs)