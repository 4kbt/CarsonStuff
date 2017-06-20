%Transform to fit data
z=asin((d(:,2)-mean(d(:,2)))/50);

%Adding ones for nonzero intercept
m=length(d(:,1));
X=[ones(m,1), d(:,1)];
%Using the normal equation: theta=inv(X'*X)*X'*y 
theta = (pinv(X'*X))*X'*z;
%plots the fit
plot(X(:,2),X*theta,
     d(:,1),z      );
theta(2)%This should be the frequency
theta(1)%This should be the angle offset