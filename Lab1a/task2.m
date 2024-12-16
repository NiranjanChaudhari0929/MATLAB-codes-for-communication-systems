% Read audio file and get the sampling frequency
[m_t, fs] = audioread('farm.mp3');

% Perform Fourier transform on the audio signal
M_f = fft(m_t);
M_f_abs = abs(M_f);

% Generate the frequency axis
freq_axis = linspace(-fs/2, fs/2, length(M_f));

% Plot the time-domain representation of the audio signal
figure(1)
plot(m_t)
title('Time-Domain Representation')
xlabel('Sample')
ylabel('Amplitude')

% Plot the frequency-domain representation of the audio signal (in dB)
figure(2)
plot(freq_axis/1000, 10*log10(fftshift(M_f_abs)))%%%%%%%%%%%%%%5
title('Frequency-Domain Representation (in dB)')
xlabel('Frequency (kHz)')
ylabel('Magnitude (dB)')

% Pause execution and give control to the user
keyboard
