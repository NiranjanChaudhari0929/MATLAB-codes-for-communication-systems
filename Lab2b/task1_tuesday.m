clear all
f_1 = 2;
f_2 = 6;
f_3 = 10;
f_4 = 14;
fs = 5 * max([f_1, f_2, f_3, f_4, 39]);
ts = 1/fs;
t = 0:ts:10;

% Generate the signal m_t
m_t = sin(2*pi*f_1*t) + (1/3)*sin(2*pi*f_2*t) + (1/5)*sin(2*pi*f_3*t) + (1/7)*sin(2*pi*f_4*t);

% Compute the Fourier transform of m_t
M_f = fft(m_t);
freq_axis_m = linspace(-fs/2, fs/2, length(M_f));

% Modulate the signal m_t
x_t = m_t .* cos(50*pi*t);

% Compute the Fourier transform of x_t
X_f = fft(x_t);
freq_axis_x = linspace(-fs/2, fs/2, length(X_f));

% Plot the signals and their Fourier transforms
figure(1)
subplot(2,1,1)
plot(t, m_t)
grid on
title('Task 1a: m_t')
subplot(2,1,2)
plot(t, x_t)
grid on
title('Task 1b: x_t')

figure(2)
subplot(2,1,1)
plot(freq_axis_m, fftshift(abs(M_f)))
grid on
title('Task 1a: M_f')
subplot(2,1,2)
plot(freq_axis_x, fftshift(abs(X_f)))
grid on
title('Task 1b: X_f')
