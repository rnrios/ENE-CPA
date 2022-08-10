clear 
close all
clc

%%%% Q1 %%%

% syms l1 l2 l3 C
% L = [l1 l2 l3].';
% C = [0 0].';
% 
% A = [0 1 0;
%     -1 -1 1];
% 
% eqs = A*L == C;
% X = solve(eqs)
% 
% X.l1
% X.l2


%%%% Q1 %%%

syms l1 l2 l3 C
L = [l1 l2 l3].';
C = [0 0 0].';

A = [1 1 -1;
    -1 -1 1
    0 0 1];

eqs = A*L == C;
X = solve(eqs)

X.l1
X.l2
X.l2