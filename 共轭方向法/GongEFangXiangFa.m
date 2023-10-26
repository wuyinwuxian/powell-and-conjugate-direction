function [GongEFangXiangFa_x, GongEFangXiangFa_xf, GongEFangXiangFa_n] = GongEFangXiangFa(E, X0)
    n = length(X0);     %获取x0的维数
    m = 0;              %迭代次数统计
    %定义方向作为列向量存储的矩阵
    D = zeros(n,n);     %根据维数n定义一个1行n列的方向向量基础
    for i = 1:n
        D(i, i) = 1;     %把第n位置为1
    end
    
    k = 1;
    while 1
        m = m + 1;
        %从X0经过n次坐标轮换一维搜索得到Xr
        X0_s = X0; 
        for i = k:k-1+n
            Xr = YiWeiSouSuo(X0_s, D(:,i), E);
            X0_s = Xr;
        end
        %fprintf('Xr = [%f, %f]\n',Xr)
        %从Xr一维搜索得到X1
        D(:,n+k) = Xr - X0;
        X1 = YiWeiSouSuo(Xr, D(:,n+k), E);
        %fprintf('X1 = [%f, %f]\n',X1)
        if norm(X1-X0) < E
            break
        else
            k = k + 1;
            X0 = X1;
        end
    end  
        
GongEFangXiangFa_x = X1;
GongEFangXiangFa_xf = func(X1);
GongEFangXiangFa_n = m; 