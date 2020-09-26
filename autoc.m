function R=autoc(x,n,l)
R=zeros(l,1);
for k=1:l
    R(k)=0.;
    nk=n-k+1;
    for nd=1:nk
        ndk=nd+k-1;
        R(k)=R(k)+x(nd)*x(ndk);
    end
end

