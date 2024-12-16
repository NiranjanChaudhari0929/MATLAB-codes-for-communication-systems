clear all

K=4; %%% 2, 4, 20 (number of symbols ie constellation size )
const=sqrt(K)* (1/sqrt(2))*[1+1j,1-1j, -1+1j, -1-1j]; 
correct_count=0; %counts correct symbol decisions 
num_sim=1000; %number of simulations
Ebno=K/2; %%%SHOW HOW %energy per bit to noise power spectral density 
for k1=1:num_sim
    
    x= const(randi(4)); %randomly seelct a point from the constellation 
    N0=1; %%% FIXED noise power 
    sigma=sqrt(N0/2); %standard value 
    
    n_1= sigma*randn(1); %generating random gaussian noise 
    n_2= sigma*randn(1);
    n=n_1+1j*n_2;
    y=x+n;  %adding the noise to the original value 
    if x==sqrt(K)* (1/sqrt(2))*[1+1j]
        if (real(y)>0 && imag(y)>0)
        correct_count=correct_count+1;
        end 
    end
    
    if x==sqrt(K)* (1/sqrt(2))*[-1+1j]
        if (real(y)<0 && imag(y)>0)
        correct_count=correct_count+1;
        end 
    end
    
       if x==sqrt(K)* (1/sqrt(2))*[-1-1j]
        if (real(y)<0 && imag(y)<0)
        correct_count=correct_count+1;
        end 
    end
    
     if x==sqrt(K)*  (1/sqrt(2))*[+1-1j]
        if (real(y)>0 && imag(y)<0)
        correct_count=correct_count+1;
        end 
    end
    
    
end 
theoryy_err=2*qfunc(sqrt(2*Ebno))-(qfunc(sqrt(2*Ebno)))^2%theory_err calculates the theoretical probability of error using the Q-function.

pc_sim= correct_count/num_sim;%
pe_sim=1-pc_sim%pe_sim calculates the simulated probability of error.


    