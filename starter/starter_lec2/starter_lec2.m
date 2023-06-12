clear all; clc;

mod(13,4); % 나머지 값을 반환
real(3+2i); % 2i는 허수, 3은 실수. 여기서 실수 부분을 출력해줌
imag(3+2i); % 허수부분의 값을 반환
%A ~=B % A와 B랑 다른가?

x = linspace(0,2*pi,100);
y=sin(x);
plot(x,y,'--rs','linewidth',2,... % ...을 해주면 줄이 너무 길어질 때 줄바꿈을 해줄 수 있음
'markeredgecolor','k',...
'markersize',10);

%------------inline function 사용-----------------------------------
f=inline('x^5 + 3*x - 1', 'x') % 식을 써주고, 마지막에 어떤 게 변수인지 알려줘야 함
f(2);

%-------function 만들기 (script 하나 더 만들어주기)------------------------
multiMAT(x);

%-------------eval fucntion 사용-----------------------------------
f = 'x^5 + 3*x -1';
x=2;
eval(f); % inline과의 차이점 : 식은 식대로 만들어주고, 변수의 값을 내가 따로 설정해줘야 함. inline은 그냥 변수값으로 바로바로 넣어줄 수 있다.

%--------주어진 조건을 만족하는 index 찾기 (find)-------------------------
x= [1 2 3 5 8];
y = [0 2 1  4 9];
find(x<=y)
length(find(x<=y)) % 이를 만족하는 x의 개수는 몇개?

%-------n차 다항식 구하기 (polyfit, ployval)--------------------------------
clear all; clc; close all;

x = [-1 1 3 5];
y = [2 -4 1 3];
p=polyfit(x,y, length(x)-1) %polyfit(x좌표, y좌표, 다항식 차수) / x,y를 지나는 다항식을 얻어줌
xx = linspace(-1,5,100);
yy=polyval(p,xx); % 어떠한 다항식의 값을 찾음
plot(x,y, 'ro', xx,yy,'k-')

%----------파일입출력 (fopen, fclose, fprintf)-------------------------------
clear all; clc; close all;

% fp 변수 / test.m이라는 FileOpen 열어주고, write할 거다.
fp = fopen('test.m','w');
% fp 파일에 1과 2라는 값을 %d에 입력
fprintf(fp, '%d %d \n', 1,2);
fprintf(fp, '%f %f \n', 3.5,4.5);
fprintf(fp, '%e %e \n', 100,1000);
fclose(fp); % fopen과 fclose는 세트다

a = load('test.m')


%------MATLAB으로 그래프 그리기 (plot, subplot,title...)------------------------
% clf : close figure : 지워준다
% close all : figure 창을 닫는다.
% figure(100) : 100값을 갖는 figure창을 띄운다.
% hold on : 여러개의 그림을 겹쳐서 그리고 싶을 때
% hold off
clear all; clc; close all;


x = [-1 1 3 5];
y = [2 -4 1 3];
p=polyfit(x,y, length(x)-1) 
xx = linspace(-1,5,100);
yy=polyval(p,xx); 
plot(yy,'k-') % 만약 xx값을 변수로 넣어주지 않으면, xx의 index값이 100이 x좌표로 들어간다.
hold on
plot(x,y, 'ro')

% example
clear all; clc; close all;
X = linspace(0,10,50);
Y1 = sin(X);
Y2 = cos(X);
Y3 = 1+sin(X);

figure(100);
subplot(1,3,1) % 1행 3열로 나눠서 첫번째 열에 그림 그리기
plot(X,Y1,'ro-')  % red, 동그라미, 실선
subplot(1,3,2) 
plot(X,Y2,'b*-')  
subplot(1,3,3) 
plot(X,Y3,'gd--')  

figure(200);
plot(X,Y1,'ko--') ; hold on;
plot(X,Y2,'r*:')  
plot(X,Y3,'gd-')  

% title 넣기
title('sin / cos graph')
xlabel('x value')
ylabel('y value')
legend('sin','cos') % 여러개 곡선이 있을 때 각각의 곡선의 제목 넣어줌
grid on %격자 그려줌 
axis([5 8 0 1]) % x는 5~8 까지, y는 0-1까지 보여줌




%---------axis 보정 (axis square, axis image, axis equal)----------------------------
clear all; clc; close all;

t = linspace(0,2*pi, 100);
x = 3*cos(t);
y = 2*sin(t);

subplot(1,3,1)
plot(x,y)
axis image % 원래 이미지 유지, box크기를 원래 이미지 크기로.. 이미지의 원 상태를 파악하는데 가장 유용

subplot(1,3,2)
plot(x,y)
axis equal % 원래 이미지 유지, box크기를 3:4:4 비율로 나타냄

subplot(1,3,3)
plot(x,y)
axis square % 원래 이미지를 변경하면서 box의 크기를 무조건 1:1:1 비율로 나타냄


%----------------------3차원 그래프 (plot3) ----------------------------
clear all; clc; close all;

t = 0:0.01:10;
tt = linspace(0,10,1001);

x = cos(3*t);
y = sin(3*t);
z = t.^2;
plot3(x,y,z,'k-')
