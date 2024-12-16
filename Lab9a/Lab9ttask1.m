clear all
close all

bin_name=dec2bin('Zafar');
ran_sig=reshape(bin_name,1 ,[]);

num_char=size(bin_name,1);
num_bits=7*num_char;

w=1;
i=0;
m_est_array=[];
dec_point_array=[];
y=[];
k1=0;
y_dec=0;
isi_term=0;
for T = 0:w:num_bits*w-w  %%%% Duration 30 seconds with interval of 1 sec.
         f=100;
        fs=10*f;
        ts=1/fs;
       
        t = T:ts:T+w;
i=i+1;

if ran_sig (i)=='1'
m_t = rectpuls(t-T,2*w);

end      
 if ran_sig (i)=='0'
m_t = -1*rectpuls(t-T,2*w);


 end      

   
  sigma=2;
f_t=rectpuls(t-T,2*w); %%%MF
y_t=m_t+sigma*randn(1, length(m_t));
 y_t= conv(y_t,f_t);

 
 
        
  
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
    
  
    t_index= linspace(T, T+w, length(y_t));

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
  
  
   y= [y y_t];

   decision_point=ceil(length(y_t)/2+k1*(length(y_t)));
  
 dec_point_array=[dec_point_array decision_point];

   y_dec= y(decision_point);

   if y_dec>0
       m_est=1;
   end
   if y_dec<0
       m_est=0;
   end
   

   k1=k1+1;
  m_est_array= [m_est_array m_est];

end

bin_char=reshape(dec2bin(m_est_array),1,[]);

est_bits=reshape(bin_char,num_char,7);

det_name=reshape(char(bin2dec(est_bits)),1,[])
