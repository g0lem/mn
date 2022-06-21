function I=gausshermi(f,a,b,n)

p=hermipol(n);
x=roots(p(n+1,:));

G=feval(f,x);		


for i=1:n
   C(i)=(2.^(n-1)*(factorial(n)).*sqrt(pi))./(n.^2.*(polyval(p(n,1:n),x(i))).^2);
end


I=dot(C,G);


