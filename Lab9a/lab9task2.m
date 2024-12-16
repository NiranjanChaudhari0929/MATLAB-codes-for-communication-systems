clear all

set=[1, -1];
sigma=1;
count_err=0;
K=1000;
for i1=1: K
sel=randi(2);

x= set(sel);
n=sigma*randn(1);
y=x+n;
if x==1 
    if y<0
        count_err=count_err+1;
    end
end
if x==-1 
    if y>0
        count_err=count_err+1;
    end
end


end
prob_erro=count_err/K
th_erro_qfun=qfunc(1/sigma)
