% Clear all variables, close all figures
clear all
close all

% Set the frequency of the sinusoidal signal
freq = 10;

% Set the sampling frequency and time vector
fs = 4 * freq;
ts = 1 / fs;
t = 0:ts:10;

% Generate the sinusoidal signal
m_t = sin(2 * pi * freq * t);

% Calculate the Fourier transform of the signal
M_f = fft(m_t);

% Calculate the absolute values of the Fourier transform
M_f_abs = abs(M_f);

% Generate the frequency axis
freq_axis = linspace(-fs/2, fs/2, length(M_f));

% Plot the original signal in the time domain
figure(1)
plot(t, m_t)
title('Time-Domain Representation')
xlabel('Time (s)')
ylabel('Amplitude')

% Plot the frequency spectrum of the signal
figure(2)
plot(freq_axis, fftshift(M_f_abs))
title('Frequency-Domain Representation')
xlabel('Frequency (Hz)')
ylabel('Magnitude')
