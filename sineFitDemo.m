importUWAtmosData

d = d(1:(end-516),:); 

sineSignals

CS = S1+S2+S3+r+mean(d(:,2));

fitFreq = f2; % 1/86400;

[fitParams sigma residuals] = sineFitter(d(:,1), CS, fitFreq);

G = genSineSeed(d(:,1), fitFreq);

sineFit = G * fitParams;

PCS = psd(d(:,1), CS-mean(CS));
PFit = psd(d(:,1), sineFit - mean(sineFit));

loglog(PCS(:,1), sqrt(PCS(:,2)),PFit(:,1), sqrt(PFit(:,2)));


