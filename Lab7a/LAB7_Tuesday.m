clear all
close all

bin_name=dec2bin('Pilani');
ran_sig=reshape(bin_name,1 ,[]);

num_char=size(bin_name,1);
num_bits=7*num_char;

w=1/2;
i=0;
m_est_array=[];
dec_point_array=[];
y=[];
k1=0;
y_dec=0;
isi_term=0;
for T = 0:w:num_bits*w-w  %%%% Duration 30 seconds with interval of 1 sec.
         f=100;
        fs=5*f;
        ts=1/fs;
       
        t = T:ts:T+w;
i=i+1;

if ran_sig (i)=='1'
m_t = rectpuls(t-T,2*w);


end      
 if ran_sig (i)=='0'
m_t = -1*rectpuls(t-T,2*w);
  end      

 


 y_t=m_t;
 plot(y_t)     

  
    N=length(m_t) ;
    m_f=fft(m_t)/(N);
    y_f= fft(y_t)/N;
    freqaxis=linspace(-fs/2,fs/2, N);
    
    figure(1)
    
    hold all  %%% keeps the previous plots and everytime changes the color
    subplot(2,1,1), plot(t,m_t);
    title('signal in time m (t)')
    xlabel('time')
    ylabel('amplitude')
    grid on
    axis([-inf  inf -inf inf])   %%% first two are limits for x-axis, the other two are limits for y-axis: observe why 0 inf , and -5 5 are used here.
    hold on     %%% keeps the previous plots
    
    
    subplot(2,1,2), plot(freqaxis,fftshift(abs(m_f)))
    title('signal in frequency M(f)')
    xlabel('frequency (Hz)')
    ylabel('Magnitude')
    grid on
    axis([-inf inf -inf inf])  %%% first two are limits for x-axis, the other two are limits for y-axis: observe why -inf inf , and 0 3 are used here.
    
     figure(3)
    hold all  %%% keeps the previous plots and everytime changes the color
    
  
   t_index=t;
    
    subplot(2,1,1), plot(t_index,y_t);
    
    title('signal in time y(t)')
    xlabel('time')
    ylabel('amplitude')
    grid on
    axis([-inf  inf -inf inf])   %%% first two are limits for x-axis, the other two are limits for y-axis: observe why 0 inf , and -5 5 are used here.
    hold on     %%% keeps the previous plots
    
    
    subplot(2,1,2), plot(freqaxis,fftshift(abs(m_f)))
    title('signal in frequency Y(f)')
    xlabel('frequency (Hz)')
    ylabel('Magnitude')
    grid on
    axis([-inf inf -inf inf])  %%% first two are limits for x-axis, the other two are limits for y-axis: observe why -inf inf , and 0 3 are used here.

  
  

end

