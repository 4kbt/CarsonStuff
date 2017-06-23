%This function creates a coherent average, with period 'duration'
%for 'data', sampled at time 't', with binning of 'binSize'
function results = simpleCoherentAverage(t, data, duration, binSize)
	
	%compute a periodic clock
	tMod = mod(t,duration);

	%bookkeeping
	NBins = ceil(duration/binSize);

	%In which bin does each sample fall?
	%I'm doing this the fancy way to introduce you to some vectorization
	%It is harder to read, but it is much faster. 
	bIndex = ceil( tMod / binSize);

	%handle the perfect-mod corner case
	bIndex( bIndex == 0 ) = NBins;

	%error check on fanciness
	if(max(bIndex) > NBins | min(bIndex) < 1)
		error('Trouble in bin-index land');
	end

	%Getting ready to accumulate results (the lazy way)
	results = [];

	%walk the bin indices and compute quantities of interest.
	for binCounter = 1:NBins

		%create a logical index for any bins that match our counter.
		binMatch = (bIndex == binCounter);

		tm = mean( tMod(binMatch));
		ts = std(  tMod(binMatch));
		
		%The extra inclusion of a columnar : makes this work on
		%an arbitrary number of columns
		dm = mean( data(binMatch,:));
		ds = std(  data(binMatch,:));

		%How many elements in each computation?
		N = sum(binMatch);

		%accumulate results the lazy way
		results = [results ; tm dm ts ds N]; 
	end
end
