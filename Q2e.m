k2 = 135000;
b2 = 1400;
m2 = 49.2;
k1 = (3000-1000)*rand + 1000;
b1 = (4000-1000)*rand + 1000;
m1 = 466.5;
s = tf('s');
G2 = (-m1*b2*s^3-m1*k2*s^2)/((m1*s^2+b1*s+k1)*(m2*s^2+(b1+b2)*s+(k1+k2))-(b1*s+k1)*(b1*s+k1));
num = [-b2/m2 -k2/m2 0 0];
den = [1 ((b1/m2)+(b2/m2)+(b1/m1)) ((k1/m2)+(k2/m2)+((b1*b2)/(m1*m2))+(k1/m1)) (((b1*k2)/(m1*m2))+((b2*k1)/(m1*m2))) (k1*k2)/(m1*m2)];
[A,B,C,D] = tf2ss(num,den);
csys = ss(A,B,C,D);
%subplot(2,1,1);
[y,t,x] = step(csys);
figure(1);
for i = 1:4
    subplot(2,2,i);
    plot(t,x(:,i));
    xlabel('time')
    ylabel(strcat('x', num2str(i)));
end
%subplot(2,1,2);
[y,t,x] = impulse(csys);
figure(2);
for i = 1:4
    subplot(2,2,i);
    plot(t,x(:,i));
    xlabel('time')
    ylabel(strcat('x', num2str(i)));
end