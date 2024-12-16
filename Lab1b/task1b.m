clear all
close all

B = 10;
fs = 4 * B;
ts = 1/fs;

% Corrected time vector
t = -10:ts:10;

% Use the sine function instead of sinC
m_t = 2 * B * sin(2 * B * t);

M_f = fft(m_t);
M_f_abs = abs(M_f);
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
