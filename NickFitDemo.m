d = transpose(1:1:200000);

addpath('mlib/');

sineSignals

CS = S1+S2+S3+r;

fitFreq = f2; % 1/86400;

[fitParams sigma residuals] = sineFitter(d(:,1), CS, fitFreq);

G = genSineSeed(d(:,1), fitFreq);

sineFit = G * fitParams;

PCS = psd(d(:,1), CS-mean(CS));
PFit = psd(d(:,1), sineFit - mean(sineFit));

loglog(PCS(:,1), sqrt(PCS(:,2)),PFit(:,1), sqrt(PFit(:,2)));

[pnb pns pnf pntime] = peakFitter3Chunk2(d(:,1), CS, 9e-3,11e-3, 10000);

