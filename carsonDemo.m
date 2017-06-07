%Make some time; make it in column-vectors
t = 1:1000000; t =t';

%Make a sine wave
s = sin(2*pi * t / 300);

%Make a sine wave at another frequency
c = sin(2*pi * t / 1000);

%Make some random noise
r = randn(size(s))*50;

%Synthesize a signal out of the above
S  = s+c+r;

%Make a periodogram
P = psd(t,S);

%Make a noise-free periodogram
N = psd(t, s+c);

%Plot 'em!
loglog(P(:,1), sqrt(P(:,2)), N(:,1), sqrt(N(:,2)))

pause

%Looking at a little bit of torsion balance data
d = load('shortCut.dat');

d(:,1) = d(:,1) - d(1,1);
d(:,2) = d(:,2) - mean(d(:,2));

anglePower = psd(d(:,1), d(:,2));

loglog(anglePower(:,1), sqrt(anglePower(:,2)));

xlabel('frequency (Hz)');
ylabel('angle spectral amplitude (rad/sqrt(Hz))');
title('A short power spectrum from DarkEP');

