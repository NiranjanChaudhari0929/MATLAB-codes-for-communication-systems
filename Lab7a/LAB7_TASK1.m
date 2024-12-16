clear all
close all

bin_name = dec2bin('Pilani');
ran_sig = reshape(bin_name, 1, []); %1 represents a single row vector 

num_char = size(bin_name, 1); %this is bascially extracting the first dimensin of the array 
num_bits = 7 * num_char;

w = 1 / 2;
i = 0;
m_est_array = [];
dec_point_array = [];
y = [];
k1 = 0;
y_dec = 0;
isi_term = 0;

for T = 0:w:num_bits * w - w  %%%% Duration 30 seconds with interval of 1 sec.
    f = 100;
    fs = 5 * f;
    ts = 1 / fs;
   
    t = T:ts:T + w;
    i = i + 1;

    if ran_sig(i) == '1'
        m_t = rectpuls(t - T, 2 * w);
    end

    if ran_sig(i) == '0'
        m_t = -1 * rectpuls(t - T, 2 * w);
    end
    
    y_t = m_t;
    plot(y_t)
    
    N = length(m_t);
    m_f = fft(m_t) / N;
    y_f = fft(y_t) / N;
    freqaxis = linspace(-fs / 2, fs / 2, N);
    
    figure(1)
    hold all
    subplot(2, 1, 1), plot(t, m_t);
    title('signal in time m(t)')
    xlabel('time')
    ylabel('amplitude')
    grid on
    axis([-inf inf -inf inf])
    hold on
    
    subplot(2, 1, 2), plot(freqaxis, fftshift(abs(m_f)))
    title('signal in frequency M(f)')
    xlabel('frequency (Hz)')
    ylabel('Magnitude')
    grid on
    axis([-inf inf -inf inf])
    
    figure(3)
    hold all
    
    t_index = t;
    subplot(2, 1, 1), plot(t_index, y_t);
    title('signal in time y(t)')
    xlabel('time')
    ylabel('amplitude')
    grid on
    axis([-inf inf -inf inf])
    hold on
    
    subplot(2, 1, 2), plot(freqaxis, fftshift(abs(m_f)))
    title('signal in frequency Y(f)')
    xlabel('frequency (Hz)')
    ylabel('Magnitude')
    grid on
    axis([-inf inf -inf inf])

    y = [y y_t]; %appends y to y_t
    
    % Calculate decision point and estimate the modulating signal
    decision_point = (k1) * length(y_t) + ceil(length(y_t) / 2); %%this is the decsion point , here decision is amde about the point 
    dec_point_array = [dec_point_array decision_point]; %appends cuurent decision point to the array
    y_dec = y(decision_point);
    
    if y_dec > 0
        m_est = 1; %estimated value of the modulating signal 
    end
    
    if y_dec < 0
        m_est = 0;
    end

    k1 = k1 + 1;  %keeps track of the windows 
    m_est_array = [m_est_array m_est];
end

% Convert estimated bits to characters
bin_char = reshape(dec2bin(m_est_array), 1, []); %converted the array representation in binary string represenation 
est_bits = reshape(bin_char, num_char, 7);%reshapes rhe bnary string vesctor  into matrix where row shows character and column shows bit 

% Convert binary back to characters
det_name = reshape(char(bin2dec(est_bits)), 1, []); %flattens the matrix into an aray 

disp(det_name)
