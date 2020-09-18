
clear all

close all

%%% Distribution of the ratio of consecutive level spacings P(r)
%%% P(r)=1/Z*((r+r.^2).^B)/((1+r+r.^2).^(1+(3/2).^B))
B = 1; %\beta=1,2,4
Z = 8/27; %Z_{\beta}=8/27,4*pi/(81.*sqrt(3)),4*pi/(729.*sqrt(3))
p1 = @(r) 27/8*(r+r.^2)/((1+r+r.^2).^(1+3/2));
p2 = @(r) 1/(4*pi/(81.*sqrt(3)))*((r+r.^2).^2)/((1+r+r.^2).^(1+3/2*2));
p3 = @(r) 1/(4/729.*(pi)/(sqrt(3))).*((r+r.^2).^4)/((1+r+r.^2).^(1+(3/2).*4));
p4 = @(r) 1/((1+r).^2);
%%% number of matrices
Nmatr = 100000;

x1 = [];
x2 = [];
x3 = [];
x4 = [];
for nm = 1:Nmatr
    M = randn(3);
    M = (M+M')/2;
    [V,D] = eig(M);
    H=diag(D);
    r1 = H(2)-H(1);
    r2 = H(3)-H(2);
    if((r1/r2)<25)
        x1 = [x1;r1/r2];
    end
end


for nm = 1:Nmatr
    M = randn(3)+i*randn(3);
    M = (M+conj(M.'))/2

    %a1 = randn(1);
    %b1 = randn(1);
    %c1 = randn(1);
    %d1 = randn(1)+i*randn(1);
    %e1 = randn(1)+i*randn(1);
    %f1 = randn(1)+i*randn(1);
    %M = [a1 d1 e1;conj(d1) b1 f1; conj(e1) conj(f1) c1];
    [V,D] = eig(M);
    H=diag(D);
    r1 = H(2)-H(1);
    r2 = H(3)-H(2);
     if (r1/r2)<25
        x2 = [x2;r1/r2];
     end
end

for nm = 1:Nmatr
   A = (randn(3) + i*randn(3));
   B = (randn(3) + i*randn(3));
   M = [A B; -conj(B) conj(A)]; 
   M = (M + M')/2; 
   E = eig(M);
   r1 = E(5)-E(3);
   r2 = E(3)-E(1);
    if (r1/r2)<25
    x3=[x3;abs(r1/r2)];
    end
end




for nm = 1:Nmatr
    r1 = exprnd(1);
    r2 = exprnd(1);
    if (r1/r2)<25
        x4 = [x4;abs(r1/r2)];
    end
end

%%% Plot of P(r)
fplot(p1,[0 15],'LineWidth',1.1,'Color','b')

hold on

fplot(p2,[0 15],'LineWidth',1.1,'Color','m')

hold on
fplot(p3,[0 15],'LineWidth',1.1,'Color','m')

hold on

fplot(p4,[0 15],'LineWidth',1.1,'Color','r')

hold on
%%%

%%% Normalized spacing histogram

[b,a] = histnorm(x1,100);

plot(a,b,'.' ,'MarkerSize', 12,'MarkerFaceColor','b')

[b,a] = histnorm(x2,100);

plot(a,b,'.' ,'MarkerSize', 12,'MarkerFaceColor','m')
[b,a] = histnorm(x3,100);

plot(a,b,'.' ,'MarkerSize', 12,'MarkerFaceColor','r')
[b,a] = histnorm(x4,100);

plot(a,b,'.' ,'MarkerSize', 12,'MarkerFaceColor','r')

axis([0,5;0,1.5]); 
ax = gca;

ax.FontSize = 14;

ax.Title.String = 'Distribution of the ratio of consecutive level spacings $P(r)$';

ax.Title.FontSize = 18;

ax.XLabel.String = '$r$';

ax.YLabel.String = '$p(r)$';

ax.XLabel.FontSize = 18;

ax.YLabel.FontSize = 18;

ax.XLabel.Interpreter = 'LaTex'; 

ax.YLabel.Interpreter = 'LaTex';
