clc
clear
l=1000; % step
x1=linspace(0,10,l); % x axis
y1=linspace(0,10,l); % y axis
dx=x1(2)-x1(1); % delta x 
dy=y1(2)-y1(1); % delta y 
z=zeros(l,l); % initial
x=zeros(l,l); % initial
y=zeros(l,l); % initial
fx=zeros(l,l); % partial derivative x and initial
fy=zeros(l,l); % partial derivative y and initial
for i=2:l
    z(1,i)=z(1,i-1)+(fx(1,i-1)+(4*x1(1,i-1)*y1(1))*dx)*dx;
    fx(1,i)=fx(1,i-1)+(4*x1(i-1)*y1(1))*dx;
end
for i=2:l
    z(i,1)=z(i-1,1)+(fy(i-1,1)+(4*x1(1)*y1(i-1))*dy)*dy;
    fy(1,i)=fy(1,i-1)+(4*x1(1)*y1(i-1))*dx;
end
for i=2:l
    for j=2:l
        z(i,j)=z(i-1,j-1)+fx(i,j-1)*dx+fy(i-1,j)*dy;
        fx(i,j)=fx(i,j-1)+4*x1(i)*y1(j-1)*dx;
        fy(i,j)=fy(i-1,j)+4*x1(i-1)*y1(j)*dy;
    end
end
mesh(z)
figure
% comparing
for i=1:l
    for j=1:l
        z1(i,j)=x1(i)^2*y1(j)^2;
    end
end
mesh(z1)
