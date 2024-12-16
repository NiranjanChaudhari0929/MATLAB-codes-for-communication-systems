a=0;
b=2;
x_u=a+(b-a)*rand(10000,1); %this generates random number in the size 1000 x 1 
mean(x_u)
var(x_u)
hist(x_u)

mu=0;
sigma=1;

x_g=mu+sigma*randn(10000000,1);
mean(x_g)
var(x_g)
hist(x_g)
