clear; clc; % clear : 작업공간 초기화 / clc : 명령창 초기화
a=1;
b=2;
c=a+b;

for x = 0:0.5:1
      a=2^x;
end

for k=5:-2:1
       b=k
   
end

if  a<2
elseif a<1
end

while a<4
    a=a+1
end

i = 1;
switch i % 반복되는 코드가 있는데, 변수 하나만 바꿔주면되는 경우. 리모콘 스위치 바꿔주는 것처럼.
    case 1.5
        b=2
    case 2
        b=3
    otherwise
        b=5
end


%linspace(a,b,n) %시작점, 끝점, 점의 개수
x=linspace(0,5,6); % 0과 5를 포함해서 6개를 찍어줘야 하므로, 012345 나옴
y=linspace(-1,1,5);

z=sin(x);
plot(x,z,'ko-')