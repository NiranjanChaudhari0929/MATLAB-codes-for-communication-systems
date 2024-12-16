% Clear all variables
clear all

% Signal and detection type selection
sig_type = 1;  % 1 for sin, 2 for sinc, 3 for sum of sinusoids
det_type = 1;  % 1 for convolution-based detection, 2 for Hilbert transform

% Signal parameters
f_c = 100;  % Carrier frequency
fs = 10 * f_c;  % Sampling frequency
ts = 1/fs;  % Sampling interval

% Time vector
t = 0:ts:5;

% Signal generation based on selected sig_type
if sig_type == 1
    m_t = sin(2 * 10 * pi * t);
    B = 300;
elseif sig_type == 2
    m_t = 20 * sinc(20 * t);
    B = 20;
elseif sig_type == 3
    m_t = sin(2 * pi * t) + (1/3) * sin(2 * 3 * pi * t) + (1/5) * sin(2 * 5 * pi * t) + (1/7) * sin(2 * 7 * pi * t);
    B = 10;
end

% Carrier signal
c_t = cos(2 * f_c * pi * t);

% Modulated signal
A = 2;  % Amplitude of the modulating signal
x_t = c_t .* (A + m_t);

% Frequency axis for plotting
freq_axis = linspace(-fs/2, fs/2, length(x_t));

% Plotting: modulating signal, carrier signal, modulated signal, and its envelope
figure(1)
hold all
subplot(2,2,1), plot(t, m_t)
title('Modulating Signal')
subplot(2,2,2), plot(t, c_t)
title('Carrier Signal')
subplot(2,2,3), plot(t, x_t)
title('Modulated Signal')
subplot(2,2,4), plot(t, envelope(x_t))%%%%%%%%%%%%%%%%
title('Envelope of Modulated Signal')

% Frequency spectrum of the modulated signal
figure(2)
plot(freq_axis, fftshift(abs(fft(x_t))))

% Envelope detection using convolution (this is the method of
% synchronisation)
if det_type == 1
    y_t = x_t .* cos(2 * pi * f_c * t);
    t1 = -10:ts:10;
    g_t = B * sinc(B * t1);
    z_t = conv(y_t, g_t, 'same') - A/2; %-A/2 is the correction factor 
    Z_f = fft(z_t);
    freq_axis_2 = linspace(-fs/2, fs/2, length(Z_f));

    % Plotting: convolution-based envelope detection in time and frequency domains
    figure(3)
    %t_conv = [t t1];
    %t_conv(end) = [];
    plot(t, z_t)
    title('Envelope Detection (Convolution)')

    figure(4)
    plot(freq_axis_2, fftshift(abs(Z_f)))
    title('Frequency Spectrum of Envelope (Convolution)')
end

% Envelope detection using Hilbert transform
if det_type == 2
    y_t = abs(hilbert(x_t)); %%%%%%%%%%%%%%%%%%%%%JUST DO THIS 
    Y_f = fft(y_t);
    freq_axis_3 = linspace(-fs/2, fs/2, length(Y_f));

    % Plotting: Hilbert transform-based envelope detection in time and frequency domains
    figure(11)
    subplot(2,1,1), plot(t, y_t - A)%%%%%%%%%%%%%%%%%%%
    title('Envelope Detection (Hilbert Transform)')
    subplot(2,1,2), plot(freq_axis_3, fftshift(abs(Y_f)))
    title('Frequency Spectrum of Envelope (Hilbert Transform)')

    % Pause for examination
    keyboard
end

% Pause for examination
keyboard
