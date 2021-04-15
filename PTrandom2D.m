clear;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% constant %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nmatr = 50000;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% matrix  %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ei = [];
Er = [];
xr = [];
xi = [];
sr = [];
si = [];
for nm =1 : nmatr
   A = randn()+randn()*i;
   B = randn();
   C = conj(A);
   H = [A B; B C];
   e = eig(H);
   si = [si; abs(imag(e(1))-imag(e(2)))];
   sr = [sr; abs(real(e(1))-real(e(2)))];
   xi = [xi; imag(e(1));imag(e(2))];
   xr = [xr; real(e(1));real(e(2))];
   display(nm);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% plot  %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[a,b]=histnorm(xr,100);
plot(b,a,'b*-');
hold on;
[a,b]=histnorm(xi,100);
plot(b,a,'r+--');
axis([-5 5 0 0.5]);
xlabel('x');
ylabel('P(x)');
legend('Re(E)','Im(E)');
figure;

[a,b]=histnorm(sr,100);
plot(b,a,'b*-');
hold on;
[a,b]=histnorm(si,100);
plot(b,a,'r+--');
axis([0 5 0 0.3]);
xlabel('s');
ylabel('P(s)');
legend('Re(E)','Im(E)');
