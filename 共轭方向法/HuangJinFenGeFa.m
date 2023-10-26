%-----------黄金分割法---主函数-----------%
function [HJFGF_x, HJFGF_xf, HJFGF_n] = HuangJinFenGeFa(a,b,w)
    k=(5^(1/2)-1)/2;      %(5^(1/2)-1)/2约等于0.618
    c = a + (1-k) * (b-a);
    d = a + k * (b-a);
    n = 0;        %迭代次数统计
    %缩小区间到精度要求
    while norm(a-b) > w
        n = n + 1;
        if func(c) < func(d)
            a = a;
            b = d;
            d = c;
            c = a + (1-k) * (b-a);
        elseif func(c) > func(d)
            a = c;
            c = d;
            b = b;
            d = a + k * (b-a); 
        else
            a = c;
            b = d;
            c = a + (1-k) * (b-a);
            d = a + k * (b-a);      
        end
    end
    %比较区间端点值大小
    if func(a) < func(b)    
        HJFGF_x = a;        
        HJFGF_xf= func(a);
    else
        HJFGF_x = b;
        HJFGF_xf = func(b);
    end
    HJFGF_n = n;