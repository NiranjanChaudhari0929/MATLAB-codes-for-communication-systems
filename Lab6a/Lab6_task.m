clear all
close all
B=5;
f_c=91.3;
fs=10*(f_c+B);
ts=1/fs;
mod_type='FMMO';
sig_type='SINE';

t=-5:ts:5;


    m_t=cos(2*pi*B*t);



      k_f= 0.2; %% see difference in time waveform with change in  k_f
   
        m_t_int=sin(2*pi*B*t)./(2*pi*B);
    
    x_t=10*cos(2*f_c*pi*t+2*pi*k_f*m_t_int);
x_t= (x_t).^10;
B1=2*(2+B);
g_t= 2*B1*sinc(2*B1*t).*cos (2*10*f_c*pi*t);
x_t=conv(x_t, g_t, 'same');
f_lo= 1.0043e+03;
x_t=x_t.*cos(2*pi*f_lo*t);
g_t= 2*B1*sinc(2*B1*t).*cos (2*(f_lo-f_c)*pi*t);
x_t=conv(x_t, g_t, 'same');

X_f=fft(x_t)/5000;
freq_axis=linspace(-fs/2, fs/2, length(X_f));  
figure(1) %%%%write xlabel and ylabel
hold all
subplot(2,1,1), plot(t,m_t)

subplot(2,1,2), plot(t,x_t)

figure(3)  %%%%write xlabel and ylabel
hold all
plot(freq_axis,(fftshift(abs(X_f)))) %%% what is theoretical BW of USSB/LSSB/FM/PM

