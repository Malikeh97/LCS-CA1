[A,B,C,D] = linmod('model1');
aircraft_ss = ss(A, B, C, D);
[y,t,x] = step(aircraft_ss);
figure(2);
for i = 1:6
    subplot(2,3,i);
    plot(t,x(:,i));
    xlabel('time')
    ylabel(strcat('x', num2str(i)));
end