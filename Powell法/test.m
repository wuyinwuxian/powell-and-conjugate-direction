clc;
clear all;
close all;
x0 = [2;1];
E = 1e-8;
%-----------���ñ�������-----------%
[BaoWeiErFa_x, BaoWeiErFa_xf, BaoWeiErFa_n] = BaoWeiErFa(E, x0);
fprintf('����������\n')
fprintf('��ֵ��Ϊ��[%f, %f]\n',BaoWeiErFa_x)
fprintf('��ֵΪ��%f\n',BaoWeiErFa_xf)
fprintf('��������Ϊ��%d\n\n',BaoWeiErFa_n)