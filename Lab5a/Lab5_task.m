clear all
close all
B=2;
f_c=5;
fs=20*(f_c+B);
ts=1/fs;
mod_type='FMMO';
sig_type='SINC';

t=-5:ts:5;

if sig_type=='SINE'
    m_t=sin(2*pi*B*t);
end
if sig_type=='SINC'
    m_t=2*B*sinc(2*B*t);
end

if mod_type =='USSB'
    mh_t= imag(hilbert(m_t));
    x_t=(m_t).*(cos(2*f_c*pi*t))-mh_t.*sin(2*f_c*pi*t);
end

if mod_type=='LSSB'
    mh_t= imag(hilbert(m_t));
    x_t=(m_t).*(cos(2*f_c*pi*t))+mh_t.*sin(2*f_c*pi*t);
end

if mod_type=='PMMO'
    k_p=10*pi;
    x_t=cos(2*f_c*pi*t+k_p*m_t);
   end

if mod_type=='FMMO'
      k_f= 20;
    if sig_type=='SINE'
        m_t_int=-cos(2*pi*B*t)./(2*pi*B);
    end
     if sig_type=='SINC'
       m_t_int=cumsum(m_t);
     end
  
    x_t=cos(2*f_c*pi*t+k_f*m_t_int);
end

X_f=fft(x_t);
freq_axis=linspace(-fs/2, fs/2, length(X_f));
figure(1)
hold all
subplot(2,1,1), plot(t,m_t)

subplot(2,1,2), plot(t,x_t)

figure(3)
hold all
plot(freq_axis,fftshift(abs(X_f)))

