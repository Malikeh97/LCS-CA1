k2 = 135000;
b2 = 1400;
m2 = 49.2;
k1 = (3000-1000)*rand + 1000;
b1 = (4000-1000)*rand + 1000;
m1 = 466.5;

a4 = (k1*k2)/(m1*m2); 
a3 = (((b1*k2)/(m1*m2))+((b2*k1)/(m1*m2)));
a2 = ((k1/m2)+(k2/m1)+((b1*b2)/(m1*m2))+(k1/m1));
a1 = ((b1/m2)+(b2/m2)+(b1/m1));
bb4 = 0;
bb3 = 0;
bb2 = -k2/m2;
bb1 = -b2/m2;

A = [0 1 0 0; 0 0 1 0; 0 0 0 1; -a4 -a3 -a2 -a1];
B = [0;0;0;1];
C = [bb4 bb3 bb2 bb1];
D = 0;

susp_ss = ss(A,B,C,D);
subplot(2,1,1);
step(susp_ss);
subplot(2,1,2);
impulse(susp_ss);


