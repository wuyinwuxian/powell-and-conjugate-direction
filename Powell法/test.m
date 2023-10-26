clc;
clear all;
close all;
x0 = [2;1];
E = 1e-8;
%-----------调用鲍威尔法-----------%
[BaoWeiErFa_x, BaoWeiErFa_xf, BaoWeiErFa_n] = BaoWeiErFa(E, x0);
fprintf('鲍威尔法：\n')
fprintf('极值点为：[%f, %f]\n',BaoWeiErFa_x)
fprintf('极值为：%f\n',BaoWeiErFa_xf)
fprintf('迭代次数为：%d\n\n',BaoWeiErFa_n)