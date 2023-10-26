function [GongEFangXiangFa_x, GongEFangXiangFa_xf, GongEFangXiangFa_n] = GongEFangXiangFa(E, X0)
    n = length(X0);     %��ȡx0��ά��
    m = 0;              %��������ͳ��
    %���巽����Ϊ�������洢�ľ���
    D = zeros(n,n);     %����ά��n����һ��1��n�еķ�����������
    for i = 1:n
        D(i, i) = 1;     %�ѵ�nλ��Ϊ1
    end
    
    k = 1;
    while 1
        m = m + 1;
        %��X0����n�������ֻ�һά�����õ�Xr
        X0_s = X0; 
        for i = k:k-1+n
            Xr = YiWeiSouSuo(X0_s, D(:,i), E);
            X0_s = Xr;
        end
        %fprintf('Xr = [%f, %f]\n',Xr)
        %��Xrһά�����õ�X1
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