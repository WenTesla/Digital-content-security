%提取算法
function out = dh_ds(fragment, in, pn0, pn1)
%out = dh_ceps_one_pn(d0, d1, fragment, in, exp, win_type, fft_len, data, s, pn)
%decode using cepstrum
%d0:delay 0
%d1:delay 1
%fragment:fragment
%in:blendation
%exp:weight exponent
%win_type:type of window
%fft_len:length of fft
%data:original bit
%s:origial voice
%pn : pn sequnces
[row, col] = size(in);
if(row > col)
    in = in';
end
i = 1;
len = floor(length(in) / fragment);
out = [];
len_pn = length(pn0);%length of pn
base = fragment - len_pn + 1;
for i = 1 : len
    st = (i - 1) * fragment + 1;
    ed = i * fragment;
    p = dct(in(st : ed));
    t0 = sum(p(base:fragment) .* pn0);
    t1 = sum(p(base:fragment) .* pn1);
    if t1 > t0
        out(i) = 1;
    else
        out(i) = 0;
    end
end
