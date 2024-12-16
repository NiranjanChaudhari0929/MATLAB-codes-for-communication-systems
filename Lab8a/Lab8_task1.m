% Clear all existing variables and figures
clear all;

% Define parameters
B = 1;
Ts = 1;  % For (a) Ts = 1; for (b) Ts = 1/4; for (c) Ts = 1/2 (optimal) %%%%CHANGE Ts to obtain 3 different curves
fs = 10;
ts = 1/fs;

% Define time vector
t = -10:ts:10;

% (a) Impulse response with xt = 2*sinc(2*t) and ht = 2*sinc(2*t)
xt_a = 2 * sinc(2 * t);%%%%%%%%%%%%%5
ht_a = 2 * sinc(2 * t);
yt_a = conv(xt_a, ht_a, 'same');

% Plot results for (a)
figure(1)
hold on
plot(t, yt_a)
title('(a) Convolution of xt and ht')
xlabel('Time')
ylabel('Amplitude')
grid on

% (b) Impulse response with xt = -2*sinc(2*t-Ts) and ht = 2*sinc(2*B*t)
xt_b = -2 * sinc(2 * t - Ts); %%%%%%%%%%%
ht_b = 2 * sinc(2 * B * t);
yt_b = conv(xt_b, ht_b, 'same');

% Plot results for (b)
figure(2)
hold on
plot(t, yt_b)
title('(b) Convolution of xt and ht')
xlabel('Time')
ylabel('Amplitude')
grid on

% (c) Impulse response with xt = 2*sinc(2*t-2*Ts) and ht = 2*sinc(2*t)
xt_c = 2 * sinc(2 * t - 2 * Ts); %%%%%%%%%%%%%%%%
ht_c = 2 * sinc(2 * t);
yt_c = conv(xt_c, ht_c, 'same');

% Plot results for (c)
figure(3)
hold on
plot(t, yt_c)
title('(c) Convolution of xt and ht')
xlabel('Time')
ylabel('Amplitude')
grid on
