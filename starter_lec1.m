clear; clc; % clear : �۾����� �ʱ�ȭ / clc : ���â �ʱ�ȭ
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
switch i % �ݺ��Ǵ� �ڵ尡 �ִµ�, ���� �ϳ��� �ٲ��ָ�Ǵ� ���. ������ ����ġ �ٲ��ִ� ��ó��.
    case 1.5
        b=2
    case 2
        b=3
    otherwise
        b=5
end


%linspace(a,b,n) %������, ����, ���� ����
x=linspace(0,5,6); % 0�� 5�� �����ؼ� 6���� ������ �ϹǷ�, 012345 ����
y=linspace(-1,1,5);

z=sin(x);
plot(x,z,'ko-')