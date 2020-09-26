function y=convl(la,A,x)
lx=length(x);
ly=la+lx-1;
y=zeros(ly,1);

for i=1:la
    for j=1:lx
        n=i+j-1;
        y(n)=y(n)+A(i)*x(j);
    end
end
            