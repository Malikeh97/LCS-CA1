A_aircraft = [0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1; 0 0 -0.52 -0.0235 0 0; 0 0 0 0 -0.0235 0; 0 0 0 0 0 0];
B_aircraft = [0 0; 0 0; 0 0; 0.235 0; 0 0.235; 5.263 0];
C_aircraft = [1 0 0 0 0 0; 0 1 0 0 0 0];
D_aircraft = [0 0; 0 0];
aircraft = ss(A_aircraft, B_aircraft, C_aircraft, D_aircraft, ...
        'InputName', {'u1', 'u2'}, 'OutputName', {'x', 'y'}, 'StateName', {'x', 'y', 't', 'xx', 'yy', 'tt'}); 
[y,t,x] = step(aircraft);
figure(1);
for i = 1:6
    subplot(2,3,i);
    plot(t,x(:,i));
    xlabel('time')
    ylabel(strcat('x', num2str(i)));
end