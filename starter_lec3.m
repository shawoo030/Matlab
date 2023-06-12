clear all; clc;

%----------2���� �Լ� �׷��� (meshgrid, mesh) : ����̿�-----------
% [X,y] = meshgrid(X min : X max, y min: y max)
[X,Y] = meshgrid(-2:0.1:2, -2:0.1:2);
Z =X.*exp(-X.^2-Y.^2);
%figure; mesh(Z) % �̷��� X, Y�� �ȳ־��ָ� x,y�� index������ ���� ��.
figure; mesh(X,Y,Z)


%----------2���� �Լ� �׷��� (meshgrid, mesh) : for�� �̿�-----------
clear all; clc;
x=linspace(-2,2,41);
y=linspace(-2,2,21);
[X,Y] = meshgrid(x,y);

for i=1:41
    for j = 1:21
        z(i,j) = x(i)*exp(-x(i)^2-y(j)^2);
    end
end

meshc(X,Y,z') % for���� �� ��, i�� ���� ���� �����ϹǷ� ����� ������� �� 41x21�� ��...
% ���� X�� Y���� ���ũ��� ���߾��ֱ� ���� transpose�ؾ���
% meshc�� ������� �׷���


%----------contour�׷��� (contour, contourf, contour3)------------
clear all; clc;  close all;

x=-2:0.1:2;
y=-2:0.1:2;
[X,Y] = meshgrid(x, y);
Z = X.*exp(-X.^2-Y.^2);

figure(100)
subplot(1,3,1)
mesh(x,y,Z)

subplot(1,3,2)
contour(x,y,Z,20) % 20���� contour�� ���ڴ�.

subplot(1,3,3)
contour3(x,y,Z,20)

%----------������(vector field) quiver, quiver3 ------------------
clear all; clc;  close all;

% �� (x,y)���� �� (p,q)���� ���� �׸��� ==> quiver(x,y,p,q)
quiver(0,0,1,1,2); % ������ ĭ���� scale���� ���� �� ����. scale=1�̸� ������ ������ ǥ�õǰ�, 2�̸� 2�谡 �ż� ȭ��ǥ�� �׷���
quiver3(0,0,0,1,1,1,1)


%---------------------�׷����Ʈ gradient ------------------ 
% ���Ⱑ ���� ���ĸ��� ���ϴ� �������� ����
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
