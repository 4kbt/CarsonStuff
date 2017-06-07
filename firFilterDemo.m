clear
more off

%Make some time
t = 1:100000; t= t';

%Make some noise
r = randn(size(t));

R = psd(t,r);

loglog(R(:,1), sqrt(R(:,2)));

A = 0; 

filtered = zeros(size(t));
averaged = zeros(size(t));

N = 10;

for ctr = 1:(rows(t)- N-1)

	A = 0.9*A + 0.1*r(ctr);

	filtered(ctr) = A;

	averaged(ctr) = mean(r(ctr:ctr+(N-1)));

end


f = fir1(10,0.2);
F = filter(f,1,r);

fAwesome = fir1(100,[0.02,0.2]);
iAwesome = filter(fAwesome, 1,r);

FAwesome = psd(t,iAwesome);
FirFiltered = psd(t,F);

Filtered = psd(t,filtered);
Averaged = psd(t,averaged);

[ButterA, ButterB] = butter(4, 0.01);

FButter = filter(ButterA, ButterB, r);

FilteredButter = psd(t, FButter);

loglog(R(:,1), sqrt(R(:,2)), 
	Filtered(:,1)   , sqrt(Filtered   (:,2)),
	Averaged(:,1)   , sqrt(Averaged   (:,2)),
	FirFiltered(:,1), sqrt(FirFiltered(:,2)),
	FAwesome(:,1)   , sqrt(FAwesome   (:,2)),
	FilteredButter(:,1), sqrt(FilteredButter(:,2))
	);
