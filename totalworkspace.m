function y=totalworkspace(v,a,x1,x2,x3)
W=[0 0 98 0 0 0]';

b=1;
C=[];

A1=[a*cos((pi/3)-(v/2)) a*sin((pi/3)-(v/2)) 0]';
A2=[a*cos((pi/3)+(v/2)) a*sin((pi/3)+(v/2)) 0]';
A3=[a*cos((pi)-(v/2)) a*sin(pi-(v/2)) 0]';
A4=[a*cos(pi+(v/2)) a*sin(pi+(v/2)) 0]';
A5=[a*cos(((5*pi)/3)-(v/2)) a*sin(((5*pi)/3)-(v/2)) 0]';
A6=[a*cos(((5*pi)/3)+(v/2)) a*sin(((5*pi)/3)+(v/2)) 0]';   

O1B1=[b*cos(v/2) b*sin(v/2) 0]';
O1B2=[b*cos(((2*pi)/3)-(v/2)) b*sin(((2*pi)/3)-(v/2)) 0]';
O1B3=[b*cos(((2*pi)/3)+(v/2)) b*sin(((2*pi)/3)+(v/2)) 0]';
O1B4=[b*cos(((4*pi)/3)-(v/2)) b*sin(((4*pi)/3)-(v/2)) 0]';
O1B5=[b*cos(((4*pi)/3)+(v/2)) b*sin(((4*pi)/3)+(v/2)) 0]';
O1B6=[b*cos(-v/2) b*sin(-v/2) 0]';
for c=-1:0.05:1
    for d=-1:0.05:1
        for h0=1
            P=[c d h0]';
R =[cos(x3)*cos(x2),-sin(x3)*cos(x1)+cos(x3)*sin(x2)*sin(x1),sin(x3)*sin(x1)+cos(x3)*sin(x2)*cos(x1);
cos(x2)*sin(x3),cos(x1)*cos(x3)+sin(x1)*sin(x2)*sin(x3),-cos(x3)*sin(x1)+cos(x1)*sin(x2)*sin(x3);-sin(x2),cos(x2)*sin(x1),cos(x1)*cos(x2)];
u1=(R*O1B1+P-A1)/norm(R*O1B1+P-A1);
u2=(R*O1B2+P-A2)/norm(R*O1B2+P-A2);
u3=(R*O1B3+P-A3)/norm(R*O1B3+P-A3);
u4=(R*O1B4+P-A4)/norm(R*O1B4+P-A4);
u5=(R*O1B5+P-A5)/norm(R*O1B5+P-A5);
u6=(R*O1B6+P-A6)/norm(R*O1B6+P-A6);

l1=norm(A1-P-R*O1B1);
l2=norm(A2-P-R*O1B2);
l3=norm(A3-P-R*O1B3);
l4=norm(A4-P-R*O1B4);
l5=norm(A5-P-R*O1B5);
l6=norm(A6-P-R*O1B6);
M1=cross(R*O1B1,u1);
M2=cross(R*O1B2,u2);
M3=cross(R*O1B3,u3);
M4=cross(R*O1B4,u4);
M5=cross(R*O1B5,u5);
M6=cross(R*O1B6,u6);
U=[u1 u2 u3 u4 u5 u6];
M=[M1 M2 M3 M4 M5 M6];
J=[U;M];
DJ=det(J);
if DJ~=0
T=J\W;
if T>0
    IN=inv(J);
    C=[C;c d h0];
    POO=size(C,1);
    y=POO;
   
end
end
        end
    end
end

