clc;
clear all;
close all;
x0 = [0;0];
E = 1e-8;
%-----------���ù����-----------%
[GongEFangXiangFa_x, GongEFangXiangFa_xf, GongEFangXiangFa_n] = GongEFangXiangFa(E, x0);
fprintf('����򷨣�\n')
fprintf('��ֵ��Ϊ��[%f, %f]\n',GongEFangXiangFa_x)
fprintf('��ֵΪ��%f\n',GongEFangXiangFa_xf)
fprintf('��������Ϊ��%d\n\n',GongEFangXiangFa_n)