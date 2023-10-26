clc;
clear all;
close all;
x0 = [0;0];
E = 1e-8;
%-----------调用共轭方向法-----------%
[GongEFangXiangFa_x, GongEFangXiangFa_xf, GongEFangXiangFa_n] = GongEFangXiangFa(E, x0);
fprintf('共轭方向法：\n')
fprintf('极值点为：[%f, %f]\n',GongEFangXiangFa_x)
fprintf('极值为：%f\n',GongEFangXiangFa_xf)
fprintf('迭代次数为：%d\n\n',GongEFangXiangFa_n)