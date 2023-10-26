%-----------进退法---主函数-----------%
function [JT_a, JT_b, JT_c] = JinTuiFa(x0,a,d)      %x0为初值，a为初始步长，d为方向
    %计算x1
    x1 = x0 + a * d;
    %前进后退标志符，n=1意味着上一次是前进
    n=1;
    %判断前进还是后退运算
    if func(x1) > func(x0)
        JT_c = x1;
        [JT_a, JT_b]=Back(x0,x1,a,n,d);
    else
        JT_a = x0;
        [JT_b, JT_c]=Front(x0,x1,a,n,d);
    end
%-----------后退运算---子函数-----------%
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
        [B_a, B_b] = Back(x0,x1,a,n,d);     %递归
    else
        B_a = x2;
        B_b = x1;
    end
%-----------前进运算---子函数-----------%
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