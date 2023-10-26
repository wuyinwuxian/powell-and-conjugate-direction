%-----------��������---������-----------%
function [BaoWeiErFa_x, BaoWeiErFa_xf, BaoWeiErFa_n] = BaoWeiErFa(E, X0)
    n = length(X0);     %��ȡx0��ά��
    m = 0;              %��������ͳ��
    %���巽����Ϊ�������洢�ľ���
    D = zeros(n,n);     %����ά��n����һ��1��n�еķ�����������
    for i = 1:n
        D(i, i) = 1;     %�ѵ�nλ��Ϊ1
    end
    
    %��X0�ĺ���ֵ
    F_X0 = func(X0);
    
    while 1
        m = m + 1;
        %��X0����n�������ֻ�һά�����õ�X1
        X0_s = X0;
        FDiff_max = 0;
        for i = 1:n
            [X1, F_X1] = YiWeiSouSuo(X0_s, D(:,i), E);
            FDiff = func(X0_s) - func(X1);          %�����������㺯��ֵ�Ĳ�
            if FDiff > FDiff_max                    %�ҳ�����ֵ����½���
                FDiff_max = FDiff;
                FDiff_max_n = i;
            end
            X0_s = X1;
        end
        %�����
        Xr = 2 * X1 - X0;
        F_Xr = func(Xr);

        if (F_Xr < F_X0) && ((F_X0 + F_Xr - 2*F_X1) * (F_X0 - F_X1 - FDiff_max)^2  < 0.5 * (F_X0 - F_Xr))
            %�ı䷽��
            %��FDiff_max_n�������������ǰһλ�ƶ�һ��
            for i = FDiff_max_n+1:n
                D(:,i-1) = D(:,i);
            end
            %���·���ŵ����һλ
            D(:, n) =  X1 - X0;
            %����һ�ֵ���ʼ��
            [X0_1, F_X0_1] = YiWeiSouSuo(X1, X1 - X0, E);
        else
            %���ı䷽��ȡXr��X1�к���ֵ��С��Ϊ��һ�����
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