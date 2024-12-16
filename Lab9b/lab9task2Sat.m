clear all

consset=[1, -1, -3, 3];
sigma=1;
count_err=0;
K=10;
for i1=1: K
sel=randi(4);

x= consset(sel);
n=sigma*randn(1);
y=x+n;
if x==3
    if y<2 
        count_err=count_err+1;
    end
end

if x==-3
    if y>-2
        count_err=count_err+1;
    end
end

if x==1
    if (y>2 & y<0)
        count_err=count_err+1;
    end
end

if x==-1
    if (y<-2 & y>0)
        count_err=count_err+1;
    end
end




     figure(1)
 scatter(real(x), imag(x))
 hold all
 scatter(real(y), imag(y))

    
    
end

prob_erro=count_err/K
%%%th_erro_qfun=qfunc(1/sigma)
