t = 1:1000000; t =t';


s = sin(2*pi * t / 300);

c = sin(2*pi * t / 1000);


r = randn(size(s))*50;

S  = s+c+r;

P = psd(t,S);

N = psd(t, s+c);

loglog(P(:,1), sqrt(P(:,2)), N(:,1), sqrt(N(:,2)))

%Looking at a little bit of torsion balance data

d = load('shortCut.dat');

d(:,1) = d(:,1) - d(1,1);
d(:,2) = d(:,2) - mean(d(:,2));

