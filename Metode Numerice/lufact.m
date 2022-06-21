clear all;
close all;
clc;
n=10;
A=zeros(n,n);
display(A);
d=-5+(5+5)*rand(n,1);
display(d);
c=-5+(5+5)*rand(n-1,1);
display(c);
a=-5+(5+5)*rand(n-1,1);
display(a);
b=-5+(5+5)*rand(n,1);
display(b);

i=1;
while i<=n-1
  A(i,i) = d(i);
  A(i,i+1) = c(i);
  A(i+1,i) = a(i);
  i=i+1
endwhile

A(n,n) = d(n);

fprintf("The matrix A is:");
display(A);
fprintf("The column vector b is:");
display(b);

%LU FACT
L=zeros(n,1)
U=L
i=1;
while i<=n
  L(i,i) = 1;
  i++;
endwhile

U = zeros(n,n);
U(1,1) = A(1,1);
U(1,2) = A(1,2);

i=2;

while i<=n-1
  L(i,i-1) = A(i,i-1)/U(i-1,i-1);
  U(i,i) = A(i,i)-L(i,i-1)*U(i-1,i);
  U(i,i+1) = A(i,i+1)-L(i,i-1)*U(i-1,i+1);
  i++;
endwhile

L(n,n-1)=A(n,n-1)/U(n-1,n-1);
U(n,n) = A(n,n)-L(n,n-1)*U(n-1,n);
display(L);
display(U);
X=A-L*U;
display(X);
y=zeros(n,1);
%display(y);

y(1) = b(1);

while i<=n
  y(i) = b(i)-L(i,i-1)*y(i-1);
  i++;
endwhile

x=zeros(n,1);
x(n)=y(n)*U(n,n);
i=n-1;

while i>=1
  x(i)=(y(i)-U(i,i+1)*x(i+1))/U(i,i);
  i--;
endwhile

display(x)

rez = A*x-b;

display(rez);

