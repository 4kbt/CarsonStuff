clear;
d = load('UWAtmosPressure.dat');

%Swap from Julian date to seconds
d(:,1) = d(:,1).* 86400;

%Switch to seconds since the beginning of the record. 
d(:,1) = d(:,1) - d(1,1);

%Data record includes a few gaps. This is a crude way to fill them in 
%in order to make a regular FFT possible.

%make some time, regularly sampled
t = d(1,1):60:d(end,1); t = t';

%interpolate the gaps, using the nearest actual sample.
dInterp = interp1(d(:,1), d(:,2), t, 'nearest');


d = [t dInterp];
