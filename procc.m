function error=procc(ip,W,D,L,error,alpha)
jim=ip-1;
betab=D(L);
for m=1:jim
    betab=betab+W(m)*D(L+m);
end
rkb=-betab/alpha;
beta=D(L+ip);
for m=1:jim
    beta=beta+D(L+m)*W(ip-m);
end
rk=-beta/alpha;
error=error+(rk-rkb)*(rk+rkb)*alpha;