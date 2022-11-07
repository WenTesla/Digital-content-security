%% 隐藏算法
function o = hide_ds(fragment, data, s, atten, pn0, pn1)
[row, col] = size(s);
if(row > col)
    s = s';
end
i = 1;
n = min(floor(length(s) / fragment), length(data));
o = s;
len = length(pn0);
base = fragment - len + 1;
for i = 1 : n
    st = (i - 1) * fragment + 1;
    ed = i * fragment;
    tmp = dct(s(st:ed));
    atten1 = atten * max(abs(tmp));
    if data(i) == 1
        tmp(base:fragment) = tmp(base:fragment) + atten1 * pn1;
    else
        tmp(base:fragment) = tmp(base:fragment) + atten1 * pn0;
    end
    o(st : ed) = idct(tmp);
end
