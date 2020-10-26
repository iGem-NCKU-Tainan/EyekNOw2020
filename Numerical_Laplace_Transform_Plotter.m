function Numerical_Laplace_Transform_Plotter

syms x;
syms s;
%% Explanation
%{
Laplace Transform of TF = SolLT(inf)-SolT(0)
but we cannot use inf to get the result, MATLAB cannot calculate that.
However, we can type in large n to estimate the real result.

For Example: 

figure;
LapTF = SolLT(10000)-SolLT(0);
fplot(LapTF, [0,20]);
title('Simulation');

figure;
RealLap = laplace(1,x,s);
fplot(RealLap, [0,20]);
title('Real');
%}

%% Making Estimation on the Real Solution
%{
We can type in numerous small n to see how the function changes, in order
to guess the form of Laplace transform of TF. After making assumption,
setting n as infinity, we can get the result. 

Below is an Example: 
%}

figure;
for k=1:1:10
    fplot(SolLT(k)-SolLT(0),[0,20]);
    hold on;
end
title('Laplace transform in different n');
xlabel('s');
ylabel('SolLT(k)-SolLT(0)');

end

function AnsLT = SolLT(n)
%% Input the Parameters Needed for Ding Laplace Transform
syms s;
syms x;
TF(x) = 1 + 0*x; %Function that needs to be transformed
ind = 100; %For integration accuracy, higher means more accuracy
IC = 2; %Initial Value of the integration

if n > 0
    AnsLT = SolLT(n-1) + (TF(n/ind))*exp(-(n/ind)*s)*(1/ind);
else
    AnsLT = IC;
end

end



