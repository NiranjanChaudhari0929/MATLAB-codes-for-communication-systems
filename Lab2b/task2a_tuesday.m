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

M_f=fft(m_t);
freq_axis= linspace(-fs/2, fs/2, length(M_f));

 figure(1)

 plot (t, m_t)
  title ('2a:mt')
 grid on
 figure(2)
 plot(freq_axis, fftshift(abs(M_f)))
   title ('2b:Mf')
 grid on
