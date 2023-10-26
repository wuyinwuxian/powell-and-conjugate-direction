%-----------�ƽ�ָ---������-----------%
function [HJFGF_x, HJFGF_xf, HJFGF_n] = HuangJinFenGeFa(a,b,w)
    k=(5^(1/2)-1)/2;      %(5^(1/2)-1)/2Լ����0.618
    c = a + (1-k) * (b-a);
    d = a + k * (b-a);
    n = 0;        %��������ͳ��
    %��С���䵽����Ҫ��
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
    %�Ƚ�����˵�ֵ��С
    if func(a) < func(b)    
        HJFGF_x = a;        
        HJFGF_xf= func(a);
    else
        HJFGF_x = b;
        HJFGF_xf = func(b);
    end
    HJFGF_n = n;