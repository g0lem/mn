clear all;
close all;
clc;

n=4;

A = [2 -1 0 0 ; -1 2 -1 0; 0 -1 2 -1; 0 0 -1 2]
b = [1; 0; 0; 1];

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


D = L\b
X = U\D

display(X)