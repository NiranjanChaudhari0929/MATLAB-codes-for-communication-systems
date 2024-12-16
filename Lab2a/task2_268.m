 clear all
f_1=1;
f_2=3;
f_3=5;
f_4=7;
 fs= 5*max([f_1,f_2, f_3, f_4,20]);
ts=1/fs;
t= 0:ts:10;
m_t= sin(2*pi*f_1*t)+(1/3)*sin(2*pi*f_2*t)+(1/5)*sin(2*pi*f_3*t)+(1/7)*sin(2*pi*f_4*t);
M_f=fft(m_t);
x_t=m_t.*cos (40*pi*t);
X_f=fft(x_t);
freq_axis_m= linspace(-fs/2, fs/2, length(M_f));
freq_axis_x= linspace(-fs/2, fs/2, length(X_f));

 figure(1)
 subplot(2,1,1), plot (t, m_t)
  subplot(2,1,2), plot (t,x_t)
 figure(2)
 subplot(2,1,1),plot(freq_axis_m, fftshift(abs(M_f)))
 subplot(2,1,2),plot(freq_axis_x, fftshift(abs(X_f)))
 
 
 