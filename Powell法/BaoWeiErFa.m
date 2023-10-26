%-----------鲍威尔法---主函数-----------%
function [BaoWeiErFa_x, BaoWeiErFa_xf, BaoWeiErFa_n] = BaoWeiErFa(E, X0)
    n = length(X0);     %获取x0的维数
    m = 0;              %迭代次数统计
    %定义方向作为列向量存储的矩阵
    D = zeros(n,n);     %根据维数n定义一个1行n列的方向向量基础
    for i = 1:n
        D(i, i) = 1;     %把第n位置为1
    end
    
    %求X0的函数值
    F_X0 = func(X0);
    
    while 1
        m = m + 1;
        %从X0经过n次坐标轮换一维搜索得到X1
        X0_s = X0;
        FDiff_max = 0;
        for i = 1:n
            [X1, F_X1] = YiWeiSouSuo(X0_s, D(:,i), E);
            FDiff = func(X0_s) - func(X1);          %计算相邻两点函数值的差
            if FDiff > FDiff_max                    %找出函数值最大下降量
                FDiff_max = FDiff;
                FDiff_max_n = i;
            end
            X0_s = X1;
        end
        %求反射点
        Xr = 2 * X1 - X0;
        F_Xr = func(Xr);

        if (F_Xr < F_X0) && ((F_X0 + F_Xr - 2*F_X1) * (F_X0 - F_X1 - FDiff_max)^2  < 0.5 * (F_X0 - F_Xr))
            %改变方向
            %将FDiff_max_n后面的数整体往前一位移动一个
            for i = FDiff_max_n+1:n
                D(:,i-1) = D(:,i);
            end
            %将新方向放到最后一位
            D(:, n) =  X1 - X0;
            %求下一轮的起始点
            [X0_1, F_X0_1] = YiWeiSouSuo(X1, X1 - X0, E);
        else
            %不改变方向，取Xr与X1中函数值较小的为下一轮起点
            if F_Xr < F_X1
                X0_1 = Xr;
                F_X0_1 = F_Xr;
            else
                X0_1 = X1;
                F_X0_1 = F_X1;
            end
        end
        
        if norm(X1-X0) < E
            break
        else
            X0 = X0_1;
            F_X0 = F_X0_1;
        end
    end
        
    BaoWeiErFa_x = X0_1;
    BaoWeiErFa_xf = F_X0_1;
    BaoWeiErFa_n = m;  