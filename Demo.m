clear all
X=[50.,-65,28,68,6,-9,-2]';
date_length=length(X);
wavelet_length=5;
[a,lag]=spike_mix(X,date_length,wavelet_length);

A=convmtx(X,5);
[n1,n2]=size(A);
b=zeros(n1,1);
b(lag)=1;
AA=A'*A;
a_test=inv(AA)*A'*b;
[a(:),a_test(:)]