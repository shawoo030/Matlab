
%-----------------------------lec1---------------------------------
% 변수 파일로 저장하기
clear all;clc;
a = 100 ; b=200; c=300;
save variables.mat

% 저장되어 있는 variable 파일에서 특정 변수만 불러오기
clear all;clc;

load variables.mat a c
d = 500;
save variables.mat d -append %기존에 저장되어있는 파일에 d값만 추가해서 저장하겠다.
clear
load variables.mat

% 특정변수만 clear하기
clear b c

% 내장함수
sqrt(4)
exp(10)
format long %이때부터는 특정 소수점에서 반올림되는 것이 아니라, 더 길게 나타내줌. 좀 더 정확한 계산이 필요할 때 사용
c= rand(2)
d = {1, [3 5], [1 2; 3 4]} % cell 배열로 다양한 형태의 데이터를 저장 가능

% 증분에서 주의할 점
x = 1:2:10
format short
1:0.9:2

% 벡터 다루기
clear all;clc;

x= 1:10;
y = x(4);
length(x);
x(end);
x(end-1);

x = 11:20;
y = x([4 6 10]); % x의 4번째, 6번째, 10번째 값만 저장

n = length(x)/2;
y = x(1:n);

% 기존에 있는 값을 새로운 값으로 바꾸기
x(4) = 10;
x(4)  = 7*x(4);

x = [1 3 5 7]
x(6) = 10 % 비어있는 자리는 0으로 자동으로 채워줌

y = 1:3
x(3:5) = y % 단, 크기가 같아야함


%-------------------------------lec2----------------------------
clear all;clc;

% +,-, .*, ./ : 각각의 같은 위치의 값끼리 연산을 취해주는 경우
%array operator
x=[1;2;3;4];
y=[5;6;7;8];
[x y x+y];

% vecterization : scalar의 벡터화. 벡터에 상수를 곱하면 벡터의 곱과 같은 결과가 나타남
t = 2*x
t = [2;2;2;2].*x
tt = 2+x % 덧셈도 마찬가지


x = [0 pi/2 pi 3*pi/2 2*pi];
y = sin(x) % sin이라는 함수에 각 벡터값이 들어와서 결과도 벡터로 만들어줌

% elementary math funtions
% doc elfun 


% [최대값, 최대값의 행 index] = max(A)
clear all;clc;
A = [1 3 5 7;2 4 6 8]
[AA BB] = max(A)

% sort
x = [5;3;7;1]
sort(x)
[value index] = sort(x) % index는 sort하기 전의 index값을 정렬된 순서로 보여줌


%scatter : 데이터를 점으로 표현
%bar : 막대그래프
% area : 데이터의 안쪽 부분의 색을 칠함
% histogram , plot
% stairs : 계단형 모양
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
%C = [1 2 3 ;4 5; 7 8 0] % 결합하려는 배열의 차원이 일치하지 않아서 오류 남.. Nan값으로 채워주면 됨

C = [B; 7 8]
D = [C, [9;10;11;12]]


% elmat : 행렬과 관련되어있는 내장함수들
magic(3) %가로 세로 대각선의 합이 모두 같은 행렬
randi([10 15],6,4) % 6x4배열 안에 10부터 15까지의 정수가 랜덤하게 들어감
A([1 2], [2 3]) % 한번에 여러개의 값을 가져오고 싶을 때


% 주의할 점
% 행렬의 덧셈, 뺼셈 : 같은 크기의 행렬이어야지 가능
% 행렬의 곱은 AB : A 행렬의 열 개수와 B 행렬의 행 개수가 같아야함.
A(:) % 행렬안의 모든 원소들을 벡터화시킨다. nx1로...


% 역행렬
A = [1 2; 3 4]
inv(A)

% 그래프 그리기 mesh, meshc, surf, surfc, contour, contour3
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


% 행렬 크기 변경 reshape
clear all; clc; close all;

A = randi([1 10],2,3);
reshape(A, 3,[])
