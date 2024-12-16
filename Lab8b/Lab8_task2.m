a=0;
b=2;
x_u=a+(b-a)*rand(10000,1);
mean(x_u)
var(x_u)
hist(x_u)
prob=nnz(x_u<(0.5*b))/10000
mu=0;
sigma=1;

x_g=mu+sigma*randn(10000,1);
mean(x_g)
var(x_g)
hist(x_g)
nnz_value1=nnz(x_g<sigma)/10000
nnz_value2=nnz(x_g<-sigma)/10000
nnz_value1-nnz_value2

