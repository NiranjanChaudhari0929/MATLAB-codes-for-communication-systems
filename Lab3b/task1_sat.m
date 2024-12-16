ringing_tone = 0;
dial_tone = 1;
busy_tone = 0;
num_times = 2;

if dial_tone == 1
    % Generate and play dial tone
    f1 = 350;
    f2 = 440;
    fs = 5 * f2;
    ts = 1/fs;
    t = 0:ts:5;
    A = 1;
    mt_dial = A*sin(2*pi*f1*t) + A*sin(2*pi*f2*t);
    
    sound(mt_dial, fs)
end

if ringing_tone == 1
    % Generate and play ringing tone
    f1 = 440;
    f2 = 480;
    fs = 5 * 480;
    ts = 1/fs;

    t1 = 0:ts:2;
    t2 = 2:ts:6;
    A_high = 1;
    A_low = 0;
    mt_ON = A_high*sin(2*pi*f1*t1) + A_high*sin(2*pi*f2*t1);
    A = 0.001;
    mt_OFF = A_low*sin(2*pi*f1*t2) + A_low*sin(2*pi*f2*t2);
    mt = [mt_ON mt_OFF]; %ombines the two modulated signals into a single signal mt
    mt_ringing = repmat(mt, 1, num_times); %Repeats the ringing tone num_times to extend its duration.

    sound(mt_ringing, fs)
end

if busy_tone == 1
    % Generate and play busy tone
    f1 = 480;
    f2 = 620;
    fs = 5 * 620;
    ts = 1/fs;

    t1 = 0:ts:1.5;
    t2 = 1.5:ts:2.5;
    A_high = 1;
    A_low = 0;
    mt_ON = A_high*sin(2*pi*f1*t1) + A_high*sin(2*pi*f2*t1);
    A = 0.001;
    mt_OFF = A_low*sin(2*pi*f1*t2) + A_low*sin(2*pi*f2*t2);
    mt = [mt_ON mt_OFF];
    mt_busy = repmat(mt, 1, num_times);

    sound(mt_busy, fs)
end
