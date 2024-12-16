 clear all
B1=100;
B2=200;
B3=400;
fs= 5*max([B1,B2,B3]);
ts=1/fs;
t= -2:ts:2;
m1_t= 200*sinc(200*t);
m2_t= 400*sinc(400*t);
m3_t= 800*sinc(800*t);

m_t= m1_t.*m2_t.*m3_t;
g_t=400*sinc(400*t);
x_t=conv(m_t,g_t);

M_f=fft(m_t);
X_f=fft(x_t);
freq_axis_m= linspace(-fs/2, fs/2, length(M_f));
freq_axis_x= linspace(-fs/2, fs/2, length(X_f));


 figure(2)
 subplot(2,1,1),plot(freq_axis_m, fftshift(abs(M_f)))
 grid on
 title('2b: Mf')
 subplot(2,1,2),plot(freq_axis_x, fftshift(abs(X_f)))
  title('2b: Xf')

 grid on
 
 
 