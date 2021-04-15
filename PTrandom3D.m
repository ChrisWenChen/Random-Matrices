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
   C = randn();
   D = randn();
   E = randn();
   F = conj(A);
   H = [A B C; D E D; C B F];
   e = eig(H);
   si = [si; abs(imag(e(1))-imag(e(2)));abs(imag(e(2))-imag(e(3)))];
   sr = [sr; abs(real(e(1))-real(e(2))); abs(real(e(2))-real(e(3)))];
   xi = [xi; imag(e(1));imag(e(2));imag(e(3))];
   xr = [xr; real(e(1));real(e(2));;real(e(3))];
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
axis([0 5 0 0.5]);
xlabel('s');
ylabel('P(s)');
legend('Re(E)','Im(E)');
