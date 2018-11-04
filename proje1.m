clc;
clear;
A= [ 0 1 0 0 0 0
    -4.7059 -.0882 0 0 1.3588 0
    0 0 0 1 0 0
    0 0 0 -5 1.617 4.5
    0 0 0 0 -.9091 0
    0 0 0 0 0 -1
    ];
B=[0 0
   0 0
   0 0
   0 0
   1 0
   0 .8
    ];
C=[1 0 0 0 0 0;
    0 0 1 0 0 0;
    ];
D=zeros(2,2);
sys = ss(A,B,C,D);
tf(sys)
%Ghesmate 1:--------------------------
%s=tf('s');
syms s;
G= [(1.359/(s^3+0.9973*s^2+4.786*s+4.278)) 0;
    (1.617/(s^3+5.909*s^2+4.546*s)) (3.6/(s^3+6*s^2+5*s));
    ];
%Ghesmate 2:---------------------------
pzmap(sys);
%Ghesmate 3:---------------------------
J = jordan(A);
disp('Jordan Matrix of A is:');
disp(J);
%Ghesmate 4:---------------------------
F=(s*eye(6,6)-A);
phi=ilaplace(F);
syms t;
f= expm(A*t);
disp('Transition Matrix is:');
disp(f);
%Ghesmate 6:---------------------------
 Co=ctrb(A,B); %Matrix of Controlpaziri
 rCo=rank(Co);  %Rank Control
 Ob=obsv(A,C);  %Matrix of Royatpaziri
 rOb=rank(Ob); %Rank Royat
 disp('Matrix of Controlpaziri:');
 disp(Co);
 disp('Rank of Controlpaziri Matrix:');
 disp(rCo);
 disp('It is Controlable since it is Full-rank.')
  disp('Matrix of Royatpaziri:');
 disp(Co);
 disp('Rank of Royatpaziri Matrix:');
 disp(rCo);
 disp('It is Royatable since it is Full-rank.')
 %Ghesmate 7:-----------------------------
if isstable(G(1,1))
    disp('G(1,1) is Stable')
else
    disp('G(1,1) is not Stable')
end
if isstable(G(1,2))
    disp('G(1,2) is Stable')
else
    disp('G(1,2) is not Stable')
end
if isstable(G(2,1))
    disp('G(2,1) is Stable')
else
    disp('G(2,1) is not Stable')
end
if isstable(G(2,2))
    disp('G(2,2) is Stable')
else
    disp('G(2,2) is not Stable')
end
%ghesmate 8:------------------------------------------
 e=eig(A);
 disp('Eigenvalues of A are:');
 disp(e);
 %Ghesmate emtiazi:-----------------------------------
p=[-8;     % Ghotbhaye desire 
    -8;
    -7;
    -5;
    -11;
    -9;];
K=place(A,B,p);   % Baraye Halgheye feedback dar simulink