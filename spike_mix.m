function [A,lag]=spike_mix(x,lx,ip)
ld=lx+ip-1;
md=ld+ip-1;
nd=ld+1;
lmax=ld-1;
R=autoc(x,lx,ip);
D=zeros(md,1);
for m=1:lx
    D(nd-m)=-x(m);
end
[A,W,alpha]=proc1(ip,R,D,ld);
error=1.+A(1)*D(ld);
lag=1;
estar=error;
for L=1:lmax
    error=procc(ip,W,D,ld-L,error,alpha);
    if(error>=estar)
        continue;
    end
    lag=lag+1;
    estar=error;
end
if(lag>1)
    A=levins(ip,R,D(nd-lag:end));
end
error=estar;
D=convl(ip,A,x);



