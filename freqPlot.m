
d(:,2) = d(:,2) - mean(d(:,2));
D=psd(d(:,1),d(:,2));
loglog(D(:,1),sqrt(D(:,2)));
xlabel('Frequency (Hz)');
ylabel('Amplitude (mb/sqrt(Hz))');
title('Frequency Plot');