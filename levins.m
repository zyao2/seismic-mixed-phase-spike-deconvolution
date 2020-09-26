function [A,W,alpha]=levins(ip,x,D)
%RA=-D
%yzero : main diagnoal element of R
%x--first row of R 
%W work arries

W=zeros(ip-1,1);
A=zeros(ip,1);
alpha=x(1);
beta=D(1);
betap=x(2);
rk=-beta/alpha;
A(1)=rk;
rkap=-betap/alpha;
W(1)=rkap;
if(ip==1)
    return;
end
for j=2:ip
    alpha=alpha+betap*rkap;
    beta=D(j);
    for k=2:j
        k1=k-1;
        kj=j-k1;
        beta=beta+W(kj)*D(k1);
    end
    rk=-beta/alpha;
    j1=j-1;
    for k=1:j1
        A(k)=A(k)+rk*W(j-k);
    end
    A(j)=rk;
    if(j==ip)
        return;
    end
    betap=x(j+1);
    for k=2:j
        kj=j-k+1;
        betap=betap+W(kj)*x(k);
    end
    rkap=-betap/alpha;
    jm=floor(j1/2);
    jl=2*jm;
    if(jl~=0)
        for k=1:jm
            jk=j-k;
            help=W(k);
            W(k)=W(k)+rkap*W(jk);
            W(jk)=W(jk)+rkap*help;
        end
    end
    jm=jm+1;
    if(jl~=j1)
        W(jm)=W(jm)+rkap*W(jm);
    end
    W(j)=rkap;
end
        
    


