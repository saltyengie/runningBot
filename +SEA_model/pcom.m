function pcom = pcom(params,x,z,p)
global flags

g = params.g;

m1 = params.m1;
m2 = params.m2;
m3 = params.m3;
m4 = params.m4;
m5 = params.m5;
m6 = params.m6;
m7 = params.m7;

if flags.optimize_mw
  mw = x.mw;
else
  mw = params.mw;
end

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

d2q1 = z.ddxb;
d2q2 = z.ddyb;
d2q3 = z.ddthb;
d2q4 = z.ddlw;
d2q5 = z.ddth1;
d2q6 = z.ddth2;
d2q7 = z.ddth3;
d2q8 = z.ddth4;
d2q9 = z.ddth5;
d2q10 = z.ddth6;

%PCOM
%    PCOM = PCOM(A1,A2,A3,A4,A5,A6,A7,C1,C2,L1,L2,L4,L5,L7,M1,M2,M3,M4,M5,M6,M7,MW,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10)

%    This function was generated by the Symbolic Math Toolbox version 8.7.
%    27-Nov-2023 16:39:05

t2 = cos(q3);
t3 = sin(q3);
t4 = q3+q5;
t5 = q3+q8;
t12 = -c1;
t13 = -c2;
t14 = -q4;
t28 = m1+m2+m3+m4+m5+m6+m7;
t6 = cos(t4);
t7 = cos(t5);
t8 = q6+t4;
t9 = q9+t5;
t10 = sin(t4);
t11 = sin(t5);
t25 = a3+t12;
t26 = a6+t13;
t27 = l7+t14;
t29 = 1.0./t28;
t15 = cos(t8);
t16 = cos(t9);
t17 = q7+t8;
t18 = q10+t9;
t19 = sin(t8);
t20 = sin(t9);
t21 = l1.*t6;
t22 = l4.*t7;
t23 = l1.*t10;
t24 = l4.*t11;
pcom = [t29.*(m2.*(q1+t21+a2.*t15)+m5.*(q1+t22+a5.*t16)+m1.*(q1+a1.*t6)+m4.*(q1+a4.*t7)+m7.*(q1+a7.*t2)+mw.*(q1+t2.*t27)+m3.*(q1+t21+l2.*t15+t25.*cos(t17))+m6.*(q1+t22+l5.*t16+t26.*cos(t18))),t29.*(m3.*(q2+t23+l2.*t19+t25.*sin(t17))+m6.*(q2+t24+l5.*t20+t26.*sin(t18))+m2.*(q2+t23+a2.*t19)+m5.*(q2+t24+a5.*t20)+m1.*(q2+a1.*t10)+m7.*(q2+a7.*t3)+m4.*(q2+a4.*t11)+mw.*(q2+t3.*t27))];
