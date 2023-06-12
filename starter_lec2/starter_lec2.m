clear all; clc;

mod(13,4); % ������ ���� ��ȯ
real(3+2i); % 2i�� ���, 3�� �Ǽ�. ���⼭ �Ǽ� �κ��� �������
imag(3+2i); % ����κ��� ���� ��ȯ
%A ~=B % A�� B�� �ٸ���?

x = linspace(0,2*pi,100);
y=sin(x);
plot(x,y,'--rs','linewidth',2,... % ...�� ���ָ� ���� �ʹ� ����� �� �ٹٲ��� ���� �� ����
'markeredgecolor','k',...
'markersize',10);

%------------inline function ���-----------------------------------
f=inline('x^5 + 3*x - 1', 'x') % ���� ���ְ�, �������� � �� �������� �˷���� ��
f(2);

%-------function ����� (script �ϳ� �� ������ֱ�)------------------------
multiMAT(x);

%-------------eval fucntion ���-----------------------------------
f = 'x^5 + 3*x -1';
x=2;
eval(f); % inline���� ������ : ���� �Ĵ�� ������ְ�, ������ ���� ���� ���� ��������� ��. inline�� �׳� ���������� �ٷιٷ� �־��� �� �ִ�.

%--------�־��� ������ �����ϴ� index ã�� (find)-------------------------
x= [1 2 3 5 8];
y = [0 2 1  4 9];
find(x<=y)
length(find(x<=y)) % �̸� �����ϴ� x�� ������ �?

%-------n�� ���׽� ���ϱ� (polyfit, ployval)--------------------------------
clear all; clc; close all;

x = [-1 1 3 5];
y = [2 -4 1 3];
p=polyfit(x,y, length(x)-1) %polyfit(x��ǥ, y��ǥ, ���׽� ����) / x,y�� ������ ���׽��� �����
xx = linspace(-1,5,100);
yy=polyval(p,xx); % ��� ���׽��� ���� ã��
plot(x,y, 'ro', xx,yy,'k-')

%----------��������� (fopen, fclose, fprintf)-------------------------------
clear all; clc; close all;

% fp ���� / test.m�̶�� FileOpen �����ְ�, write�� �Ŵ�.
fp = fopen('test.m','w');
% fp ���Ͽ� 1�� 2��� ���� %d�� �Է�
fprintf(fp, '%d %d \n', 1,2);
fprintf(fp, '%f %f \n', 3.5,4.5);
fprintf(fp, '%e %e \n', 100,1000);
fclose(fp); % fopen�� fclose�� ��Ʈ��

a = load('test.m')


%------MATLAB���� �׷��� �׸��� (plot, subplot,title...)------------------------
% clf : close figure : �����ش�
% close all : figure â�� �ݴ´�.
% figure(100) : 100���� ���� figureâ�� ����.
% hold on : �������� �׸��� ���ļ� �׸��� ���� ��
% hold off
clear all; clc; close all;


x = [-1 1 3 5];
y = [2 -4 1 3];
p=polyfit(x,y, length(x)-1) 
xx = linspace(-1,5,100);
yy=polyval(p,xx); 
plot(yy,'k-') % ���� xx���� ������ �־����� ������, xx�� index���� 100�� x��ǥ�� ����.
hold on
plot(x,y, 'ro')

% example
clear all; clc; close all;
X = linspace(0,10,50);
Y1 = sin(X);
Y2 = cos(X);
Y3 = 1+sin(X);

figure(100);
subplot(1,3,1) % 1�� 3���� ������ ù��° ���� �׸� �׸���
plot(X,Y1,'ro-')  % red, ���׶��, �Ǽ�
subplot(1,3,2) 
plot(X,Y2,'b*-')  
subplot(1,3,3) 
plot(X,Y3,'gd--')  

figure(200);
plot(X,Y1,'ko--') ; hold on;
plot(X,Y2,'r*:')  
plot(X,Y3,'gd-')  

% title �ֱ�
title('sin / cos graph')
xlabel('x value')
ylabel('y value')
legend('sin','cos') % ������ ��� ���� �� ������ ��� ���� �־���
grid on %���� �׷��� 
axis([5 8 0 1]) % x�� 5~8 ����, y�� 0-1���� ������




%---------axis ���� (axis square, axis image, axis equal)----------------------------
clear all; clc; close all;

t = linspace(0,2*pi, 100);
x = 3*cos(t);
y = 2*sin(t);

subplot(1,3,1)
plot(x,y)
axis image % ���� �̹��� ����, boxũ�⸦ ���� �̹��� ũ���.. �̹����� �� ���¸� �ľ��ϴµ� ���� ����

subplot(1,3,2)
plot(x,y)
axis equal % ���� �̹��� ����, boxũ�⸦ 3:4:4 ������ ��Ÿ��

subplot(1,3,3)
plot(x,y)
axis square % ���� �̹����� �����ϸ鼭 box�� ũ�⸦ ������ 1:1:1 ������ ��Ÿ��


%----------------------3���� �׷��� (plot3) ----------------------------
clear all; clc; close all;

t = 0:0.01:10;
tt = linspace(0,10,1001);

x = cos(3*t);
y = sin(3*t);
z = t.^2;
plot3(x,y,z,'k-')
