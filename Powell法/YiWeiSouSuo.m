%-----------整合一维搜索---子函数-----------%  
function [YiWeiSouSuo_x, YiWeiSouSuo_fx] = YiWeiSouSuo(Start, Dir, E)
    [JT_a, JT_b, JT_c] = JinTuiFa(Start, 0.01, Dir);
    [HJFGF_x, HJFGF_f, HJFGF_n] = HuangJinFenGeFa(JT_a, JT_c, E);
    YiWeiSouSuo_x = HJFGF_x;
    YiWeiSouSuo_fx = HJFGF_f;