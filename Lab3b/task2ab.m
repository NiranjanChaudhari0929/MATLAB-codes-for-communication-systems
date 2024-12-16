clear all

sig_type = 1; %% 1 for sin, 2 for sinc

f = 1200;
fs = 5 * f;
ts = 1/fs;

if sig_type == 1
    t = 0:ts:10;
end

if sig_type == 2
    t = -10:ts:10;
end

c_t = cos(2000*pi*t);

if sig_type == 1
    m_t = sin(400*pi*t);
end

x_t = m_t .* c_t;
X_f = fft(x_t);
freq_axis = linspace(-fs/2, fs/2, length(X_f));

% Plot the modulated signal in time and frequency domains
figure(1)
plot(t, x_t)
title('Modulated Signal in Time Domain')
xlabel('Time')
ylabel('Amplitude')

figure(2)
plot(freq_axis, fftshift(abs(X_f)))
title('Frequency Spectrum of Modulated Signal')
xlabel('Frequency (Hz)')
ylabel('Magnitude')

% Demodulation
y_t = x_t .* cos(2000*pi*t);
t1 = -10:ts:10;
g_t = 600 * sinc(600 * t1);  % B must be at least the max frequency of the signal 
z_t = conv(y_t, g_t, 'same');
Z_f = fft(z_t);
freq_axis_2 = linspace(-fs/2, fs/2, length(Z_f));

% Plot the demodulated and filtered signal in time and frequency domains
figure(3)
plot(t, z_t)
title('Demodulated and Filtered Signal in Time Domain')
xlabel('Time')
ylabel('Amplitude')

figure(4)
plot(freq_axis_2, fftshift(abs(Z_f)))
title('Frequency Spectrum of Demodulated and Filtered Signal')
xlabel('Frequency (Hz)')
ylabel('Magnitude')
