function Jc2 = Jc2(params,x)
global flags
g = params.g;

m1 = params.m1;
m2 = params.m2;
m3 = params.m3;
m4 = params.m4;
m5 = params.m5;
m6 = params.m6;
m7 = params.m7;



I1 = params.i1;
I2 = params.i2;
I3 = params.i3;
I4 = params.i4;
I5 = params.i5;
I6 = params.i6;
I7 = params.i7;

l1 = params.l1;
l2 = params.l2;
l3 = params.l3;
l4 = params.l4;
l5 = params.l5;
l6 = params.l6;
l7 = params.l7;

a1 = params.a1;
a2 = params.a2;
a3 = params.a3;
a4 = params.a4;
a5 = params.a5;
a6 = params.a6;
a7 = params.a7;

c1 = params.c1;
c2 = params.c2;

q1 = x.xb;
q2 = x.yb;
q3 = x.thb;
q4 = x.lw;
q5 = x.th1;
q6 = x.th2;
q7 = x.th3;
q8 = x.th4;
q9 = x.th5;
q10 = x.th6;

dq1 = x.dxb;
dq2 = x.dyb;
dq3 = x.dthb;
dq4 = x.dlw;
dq5 = x.dth1;
dq6 = x.dth2;
dq7 = x.dth3;
dq8 = x.dth4;
dq9 = x.dth5;
dq10 = x.dth6;

%JC2
%    JC2 = JC2(L4,L5,Q3,Q8,Q9)

%    This function was generated by the Symbolic Math Toolbox version 8.7.
%    27-Nov-2023 16:39:09

t2 = q3+q8;
t3 = cos(t2);
t4 = q9+t2;
t5 = sin(t2);
t6 = cos(t4);
t7 = sin(t4);
t8 = l4.*t3;
t9 = l4.*t5;
t10 = l5.*t6;
t11 = l5.*t7;
t12 = -t9;
t13 = -t11;
t14 = t8+t10;
t15 = t12+t13;
Jc2 = reshape([1.0,0.0,0.0,0.0,1.0,0.0,t15,t14,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t15,t14,1.0,t13,t10,1.0,0.0,0.0,1.0],[3,10]);
