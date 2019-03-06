%Signals take the form y=Asin(2*pi*fc*x + B)+C. Since C is the mean,
%and approximating A we get arcsin(y-C)/A=2*pi*fc*x + B

f1 = 2.3072e-05
A1 = 50
f2 = 10.1522e-3
A2 = 50
f3 = 8.2373e-07
A3 = 500
r = randn(size(d(:,1)))*10;
S1 = A1*sin(2*pi*f1*d(:,1)+0.027920);
S2 = A2*sin(2*pi*f2*d(:,1)+0.027920);
S3 = A3*sin(2*pi*f3*d(:,1)+0.027920);
%plot(d(:,1),S1+S2+S3+r + mean(d(:,2)),
%     d(:,1),d(:,2));
signalFreq = psd(d(:,1),S1+S2+S3+r);
loglog(signalFreq(:,1),sqrt(signalFreq(:,2)));
