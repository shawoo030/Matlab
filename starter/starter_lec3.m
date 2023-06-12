clear all; clc;

%----------2변수 함수 그래프 (meshgrid, mesh) : 행렬이용-----------
% [X,y] = meshgrid(X min : X max, y min: y max)
[X,Y] = meshgrid(-2:0.1:2, -2:0.1:2);
Z =X.*exp(-X.^2-Y.^2);
%figure; mesh(Z) % 이렇게 X, Y를 안넣어주면 x,y가 index값으로 들어가게 됨.
figure; mesh(X,Y,Z)


%----------2변수 함수 그래프 (meshgrid, mesh) : for문 이용-----------
clear all; clc;
x=linspace(-2,2,41);
y=linspace(-2,2,21);
[X,Y] = meshgrid(x,y);

for i=1:41
    for j = 1:21
        z(i,j) = x(i)*exp(-x(i)^2-y(j)^2);
    end
end

meshc(X,Y,z') % for문을 돌 때, i에 대해 먼저 수행하므로 행렬이 만들어질  41x21이 됨...
% 따라서 X와 Y와의 행렬크기와 맞추어주기 위해 transpose해야함
% meshc는 등고선까지 그려줌


%----------contour그래프 (contour, contourf, contour3)------------
clear all; clc;  close all;

x=-2:0.1:2;
y=-2:0.1:2;
[X,Y] = meshgrid(x, y);
Z = X.*exp(-X.^2-Y.^2);

figure(100)
subplot(1,3,1)
mesh(x,y,Z)

subplot(1,3,2)
contour(x,y,Z,20) % 20개의 contour를 보겠다.

subplot(1,3,3)
contour3(x,y,Z,20)

%----------벡터장(vector field) quiver, quiver3 ------------------
clear all; clc;  close all;

% 점 (x,y)에서 점 (p,q)로의 벡터 그리기 ==> quiver(x,y,p,q)
quiver(0,0,1,1,2); % 마지막 칸에는 scale값을 넣을 수 있음. scale=1이면 원래의 값으로 표시되고, 2이면 2배가 돼서 화살표가 그려짐
quiver3(0,0,0,1,1,1,1)


%---------------------그래디언트 gradient ------------------ 
% 기울기가 가장 가파르게 변하는 곳으로의 방향
clear all; clc;  close all;

x = -1:0.1:1;
y = -1:0.1:1;

[X,Y] = meshgrid(x,y);
z = X.^2.*Y;

[px,py] = gradient(z);
quiver(X,Y,px,py,1);
grid on


clear all; clc;  close all;

[x,y] = meshgrid(-2:0.2:2);
z= x.*exp(-x.^2-y.^2);

figure(100)
subplot(1,2,1)
mesh(x,y,z)

subplot(1,2,2)
[px,py] = gradient(z);
contour(x,y,z)
hold on;
quiver(x,y,px,py);
