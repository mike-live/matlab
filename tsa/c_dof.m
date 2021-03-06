function [v,Nb]=c_dof(w,N,n)
% C_DOF Calculates degrees of freedom
% v=c_dof(w,N,n)
% w = vector of weights as generated by matlab functions. 
% i.e. w = hann(10). This is assumed to be the length of the block to which
% the window will be applied 
% N = Length of original series 
% n = number of overlapping data points
%
% Notice the code does not round up DOF's or Derived number of segments.
% Uncomment proper lines to do otherwise.
%
% Percival and Walden, 1993. Spectral Analysis for Physical Applications. p.292
% 
% @Carlos Moffat, WHOI (2004)

Ns=length(w);
%n=Ns-n2;
%Nb=((N-n)/(Ns-n)) % Number of segments
Nb=fix((N-n)/(Ns-n)); % Number of segments
m=1:Nb-1;
w=w(:)/norm(w); % Assume window has been generated by matlab
w2=w*ones(1,length(w));
s=-(1+m*(Ns-n));
w2=full(spdiags(w2,s));
%v=(2*Nb/(1+2*(1-m/Nb)*abs((w'*w2)').^2));
v=fix(2*Nb/(1+2*(1-m/Nb)*abs((w'*w2)').^2));