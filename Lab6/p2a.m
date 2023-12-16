D=mod(22103132,4);
M=5+D;
a=zeros(2,1);
b=zeros(M,1);

for ii=0:M-1
    b(ii+1)=exp(-ii);
end

x=zeros(10,1);
x(1)=1;

% DTLTI(a,b,x,Ny)
y=DTLTI(a,b,x,10);

% stem(y);
% xlabel('n');
% ylabel('y[n]');


stem([0:4],b);
xticks([0:5])
xlabel('n');
ylabel('b[n]');
