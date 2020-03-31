% Alejandro Jimenez Rocha - sai993

%You'll notice GoodPlot and GoodPlotFreq aren't in the Basebandgen folder!
%BasebandGen Script
aa=0;
bb=1;
vzero=0.1;
hinit=[ 1+1i, 0.2-0.1i, 0.7, 0.25+0.15i];
pulseP=[0.05, 0.1, 0.15, 0.25, 0.5, 0.25, 0.15, 0.1, 0.05];
a=BasebandGen(hinit,vzero, pulseP, aa, bb);
b=BasebandGen();

xin=[0,0,1,0,0,1,1,0,1];
a=RunBasebandGen(a,xin);


% Feeding it different args each iteration to differentiate them.
% Title, X-axis and Y-axis, the type of plot I want, the number of the plot
% (1-3), and the object created above.

GP2("Title1", "X1", "Y1", "real", 1, a); 
GP2("Title2", "X2", "Y2", "complex", 2, a);
GP2("Title3", "X3", "Y3", "freq", 3, a);