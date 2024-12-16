clear all
close all

fm = 10;
f_c = 500;
deltaf = 7.5;
fs = 10 * (deltaf + f_c + fm);
ts = 1 / fs;

t = 0:ts:5;
m_t = cos(2 * pi * fm * t);

k_f = deltaf * fm;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m_t_int = sin(2 * pi * fm * t) / (2 * pi * fm);
x_t = 10 * cos(2 * f_c * pi * t + 2 * pi * k_f * m_t_int);

% Derivation of m(t) using the Hilbert transform (A) TAKING THE DERIVATIVE 
x_diff_t = -10 * sin(2 * f_c * pi * t + 2 * pi * k_f * m_t_int) .* (2 * f_c * pi + 2 * pi * k_f * m_t);
%m_t_est = (abs(hilbert(x_diff_t)) - 2 * f_c * pi) / (2 * pi * k_f);
m_t_est = abs(hilbert(x_diff_t))  ;  %%%%% (B)THE ABOVE LINE IS CORRECT , BUT THIS IS FOR ENVELOPE DETECTION USING HOBBERT

% Frequency domain representations
M_f_est = fft(m_t_est);
X_f = fft(x_t);
freq_axis = linspace(-fs / 2, fs / 2, length(X_f));

% Plotting
figure;
subplot(2, 1, 1);
plot(t, m_t);
title('Modulating Signal m(t)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(t, x_t);
title('Frequency Modulated Signal x(t)');
xlabel('Time (s)');
ylabel('Amplitude');

figure;
plot(freq_axis, fftshift(abs(X_f)));
title('Frequency Spectrum of FM Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
%%%%%%%%%%%%%%%%%%%%NOW COMES THE SECOND PART POTTING 
figure;
subplot(2, 1, 1);
plot(t, m_t_est);
title('Estimated Modulating Signal m(t)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(freq_axis, fftshift(abs(M_f_est)));
title('Frequency Spectrum of Estimated m(t)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
