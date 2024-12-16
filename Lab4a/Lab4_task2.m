clear all
close all

% Parameters
f_m = 2;  % Modulating signal frequency
f_c = 10; % Carrier signal frequency
fs = 5 * (f_c + f_m);  % Sampling frequency
ts = 1/fs;  % Sampling interval

% Loop over time intervals
for T = 0:1:10
    t = 0:ts:1;

    % Modulating signal
    m_t = sin(2 * f_m * pi * t);

    % Carrier signal
    c_t = cos(2 * f_c * pi * t);

    % Modulated signal
    A = 2;
    x_t = c_t .* (A + m_t);

    % Frequency domain representation
    X_f = fft(x_t);
    freq_axis = linspace(-fs/2, fs/2, length(X_f));

    % Plotting in real-time
    figure(1)
    hold all
    plot(t + T, m_t)
    axis([-inf inf -inf inf])  %adjusting the axes 
    figure(2)
    hold all
    plot(t + T, c_t)
    figure(3)
    hold all
    plot(t + T, x_t)
    axis([-inf inf -inf inf])
    figure(4)
    hold all
    plot(freq_axis, fftshift(abs(X_f)))
    axis([-inf inf -inf inf])

    % Pause for 1 second to observe each iteration
    pause(1)%%%%%%%%%%%%%%%%%%%%%%%%%%
end

% Keyboard command to keep figures open after the loop
keyboard
