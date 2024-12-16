% Clear all variables
clear all

% Signal parameters
B1 = 100;
B2 = 200;
B3 = 400;

% Sampling parameters
fs = 5 * max([B1, B2, B3]);
ts = 1/fs;
t = -2:ts:2;

% Generate three sinc signals with different bandwidths
m1_t = 200 * sinc(200 * t);
m2_t = 400 * sinc(400 * t);
m3_t = 800 * sinc(800 * t);

% Create the modulated signal by multiplying the sinc signals
m_t = m1_t .* m2_t .* m3_t;

% Generate a Gaussian pulse g(t)
g_t = 400 * sinc(400 * t);   % so that its limited to 200 Hz 

% Convolve the modulated signal with the Gaussian pulse
x_t = conv(m_t, g_t, 'same') * ts; % Convolution and scaling

% Compute the Fourier transforms of the signals
M_f = fft(m_t);
X_f = fft(x_t);
freq_axis_m = linspace(-fs/2, fs/2, length(M_f));
freq_axis_x = linspace(-fs/2, fs/2, length(X_f));

% Plot the modulated signal and the convolution result
figure(1)
subplot(2,1,1)
plot(t, m_t)
title('Modulated Signal m_t')
xlabel('Time (s)')
ylabel('Amplitude')
subplot(2,1,2)
plot(t, x_t)
title('Convolution Result x_t')
xlabel('Time (s)')
ylabel('Amplitude')

% Plot the frequency spectrum of the signals
figure(2)
subplot(2,1,1)
plot(freq_axis_m, fftshift(abs(M_f)))
title('Frequency Spectrum of m_t')
xlabel('Frequency (Hz)')
ylabel('Magnitude')
subplot(2,1,2)
plot(freq_axis_x, fftshift(abs(X_f)))
title('Frequency Spectrum of x_t')
xlabel('Frequency (Hz)')
ylabel('Magnitude')
