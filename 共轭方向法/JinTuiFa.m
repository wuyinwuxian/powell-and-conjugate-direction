%-----------���˷�---������-----------%
function [JT_a, JT_b, JT_c] = JinTuiFa(x0,a,d)      %x0Ϊ��ֵ��aΪ��ʼ������dΪ����
    %����x1
    x1 = x0 + a * d;
    %ǰ�����˱�־����n=1��ζ����һ����ǰ��
    n=1;
    %�ж�ǰ�����Ǻ�������
    if func(x1) > func(x0)
        JT_c = x1;
        [JT_a, JT_b]=Back(x0,x1,a,n,d);
    else
        JT_a = x0;
        [JT_b, JT_c]=Front(x0,x1,a,n,d);
    end
%-----------��������---�Ӻ���-----------%
function [B_a, B_b] = Back(x0,x1,a,n,d)
    if n == 1
        n = 0;
    else
        a = 2 * a;
    end
    x2 = x0 - a * d;
    if func(x2) < func(x0)
        x1 = x0;
        x0 = x2;
        [B_a, B_b] = Back(x0,x1,a,n,d);     %�ݹ�
    else
        B_a = x2;
        B_b = x1;
    end
%-----------ǰ������---�Ӻ���-----------%
function [F_a, F_b] = Front(x0,x1,a,n,d)
    if n == 0
        n = 1;
    else
        a = 2 * a;
    end
    x2 = x1 + a * d;
    if func(x2) < func(x1)
        x0 = x1;
        x1 = x2;
        [F_a, F_b] = Front(x0,x1,a,n,d);
    else
        F_a = x0;
        F_b = x2;
    end