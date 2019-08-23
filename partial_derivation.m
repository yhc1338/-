clc
clear
l=1000;%离散分度
x1=linspace(0,10,l);%x坐标
y1=linspace(0,10,l);%y坐标
dx=x1(2)-x1(1);%微元
dy=y1(2)-y1(1);%微元
z=zeros(l,l);%初值
x=zeros(l,l);%初值
y=zeros(l,l);%初值
fx=zeros(l,l);%各点x方向偏导数  初值
fy=zeros(l,l);;%各点y方向偏导数 初值
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
%对比
for i=1:l
    for j=1:l
        z1(i,j)=x1(i)^2*y1(j)^2;
    end
end
mesh(z1)
