
%-----------------------------lec1---------------------------------
% ���� ���Ϸ� �����ϱ�
clear all;clc;
a = 100 ; b=200; c=300;
save variables.mat

% ����Ǿ� �ִ� variable ���Ͽ��� Ư�� ������ �ҷ�����
clear all;clc;

load variables.mat a c
d = 500;
save variables.mat d -append %������ ����Ǿ��ִ� ���Ͽ� d���� �߰��ؼ� �����ϰڴ�.
clear
load variables.mat

% Ư�������� clear�ϱ�
clear b c

% �����Լ�
sqrt(4)
exp(10)
format long %�̶����ʹ� Ư�� �Ҽ������� �ݿø��Ǵ� ���� �ƴ϶�, �� ��� ��Ÿ����. �� �� ��Ȯ�� ����� �ʿ��� �� ���
c= rand(2)
d = {1, [3 5], [1 2; 3 4]} % cell �迭�� �پ��� ������ �����͸� ���� ����

% ���п��� ������ ��
x = 1:2:10
format short
1:0.9:2

% ���� �ٷ��
clear all;clc;

x= 1:10;
y = x(4);
length(x);
x(end);
x(end-1);

x = 11:20;
y = x([4 6 10]); % x�� 4��°, 6��°, 10��° ���� ����

n = length(x)/2;
y = x(1:n);

% ������ �ִ� ���� ���ο� ������ �ٲٱ�
x(4) = 10;
x(4)  = 7*x(4);

x = [1 3 5 7]
x(6) = 10 % ����ִ� �ڸ��� 0���� �ڵ����� ä����

y = 1:3
x(3:5) = y % ��, ũ�Ⱑ ���ƾ���


%-------------------------------lec2----------------------------
clear all;clc;

% +,-, .*, ./ : ������ ���� ��ġ�� ������ ������ �����ִ� ���
%array operator
x=[1;2;3;4];
y=[5;6;7;8];
[x y x+y];

% vecterization : scalar�� ����ȭ. ���Ϳ� ����� ���ϸ� ������ ���� ���� ����� ��Ÿ��
t = 2*x
t = [2;2;2;2].*x
tt = 2+x % ������ ��������


x = [0 pi/2 pi 3*pi/2 2*pi];
y = sin(x) % sin�̶�� �Լ��� �� ���Ͱ��� ���ͼ� ����� ���ͷ� �������

% elementary math funtions
% doc elfun 


% [�ִ밪, �ִ밪�� �� index] = max(A)
clear all;clc;
A = [1 3 5 7;2 4 6 8]
[AA BB] = max(A)

% sort
x = [5;3;7;1]
sort(x)
[value index] = sort(x) % index�� sort�ϱ� ���� index���� ���ĵ� ������ ������


%scatter : �����͸� ������ ǥ��
%bar : ����׷���
% area : �������� ���� �κ��� ���� ĥ��
% histogram , plot
% stairs : ����� ���
clear all; clc;

x=linspace(0,10,11);
y=rand(1,11);

figure(100)
subplot(2,3,1)
plot(x,y,'ko-')
title('Plot')

subplot(2,3,2)
scatter(x,y)
title('Scatter')

subplot(2,3,3)
bar(x,y)
title('Bar')

subplot(2,3,4)
area(x,y)
title('Area')

subplot(2,3,5)
histogram(y)
title('histogram')

subplot(2,3,6)
stairs(x,y)
title('Stairs')

% []: concatenation operator
clear all; clc; close all;

A = [1 2 3; 4 5 6]
B = [1 2;3 4; 5 6]
%C = [1 2 3 ;4 5; 7 8 0] % �����Ϸ��� �迭�� ������ ��ġ���� �ʾƼ� ���� ��.. Nan������ ä���ָ� ��

C = [B; 7 8]
D = [C, [9;10;11;12]]


% elmat : ��İ� ���õǾ��ִ� �����Լ���
magic(3) %���� ���� �밢���� ���� ��� ���� ���
randi([10 15],6,4) % 6x4�迭 �ȿ� 10���� 15������ ������ �����ϰ� ��
A([1 2], [2 3]) % �ѹ��� �������� ���� �������� ���� ��


% ������ ��
% ����� ����, �E�� : ���� ũ���� ����̾���� ����
% ����� ���� AB : A ����� �� ������ B ����� �� ������ ���ƾ���.
A(:) % ��ľ��� ��� ���ҵ��� ����ȭ��Ų��. nx1��...


% �����
A = [1 2; 3 4]
inv(A)

% �׷��� �׸��� mesh, meshc, surf, surfc, contour, contour3
clear all; clc; close all;

[X,Y] = meshgrid(1:0.5:10.1:20);
Z = sin(X) +cos(Y);

figure(100)
subplot(2,3,1)
mesh(X,Y,Z)
title('mesh')

subplot(2,3,2)
surf(X,Y,Z)
title('surf')

subplot(2,3,3)
surfc(X,Y,Z)
title('Surfc')

subplot(2,3,4)
contour(X,Y,Z)
title('Contour')

subplot(2,3,5)
contour3(X,Y,Z)
title('contour3')


% ��� ũ�� ���� reshape
clear all; clc; close all;

A = randi([1 10],2,3);
reshape(A, 3,[])
