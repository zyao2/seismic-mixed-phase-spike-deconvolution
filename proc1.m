function [A,W,alpha]=proc1(ip,R,D,lzero)
[A,W,alpha]=levins(ip,R,D(lzero:end));
