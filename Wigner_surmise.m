
clear all

close all
%%% Wigner surmise for $\beta =1,2,4$
p1 = @(s) pi.*s.*exp(-s.^2.*pi/4)/2;
p2 = @(s) 32.*(s.^2)/((pi).^2).*exp(-4.*(s.^2)/(pi));
p4 = @(s) 2^(18)/((3^6).*((pi)^3)).*s^4.*exp(-s.^2.*64/(9.*pi));
%%% Number of matrices
Nmatr = 100000
%%% null lists for spcings of nearest-neighbor eigenvalues
x1 = [];
x2 = [];
x4 = [];
%%% Generate the matrix and calculate the eigenvalues ??to get the eigenvalue spacing
for nm = 1:Nmatr
    M = randn(2);
    M = (M+M')/2;
    x1 = [x1; abs(diff(eig(M)))];
end
for nm = 1:Nmatr
    M = randn(2)+i*randn(2);
    M = (M+conj(M.'))/2
    x2 = [x2; abs(diff(eig(M)))];
end
for nm = 1:Nmatr
   A = (randn(3) + i*randn(3));
   B = (randn(3) + i*randn(3));
   M = [A B; -conj(B) conj(A)]; 
   M = (M + M')/2; 
   E = eig(M);
   x4 = [x4; abs(E(3)-E(1))];
end
%%%unfolding
x1 = x1/mean(x1(:));
x2 = x2/mean(x2(:));
x4 = x4/mean(x4(:));
%%%ploting
fplot(p1,[0 5],'LineWidth',1.1)
hold on
fplot(p2,[0 5],'LineWidth',1.1)
hold on
fplot(p4,[0 5],'LineWidth',1.1)
hold on
[b,a] = histnorm(x1,50);
plot(a,b,'.' ,'MarkerSize', 12)
[b,a] = histnorm(x2,50);
plot(a,b,'.' ,'MarkerSize', 12)
[b,a] = histnorm(x4,50);
plot(a,b,'.' ,'MarkerSize', 12)
