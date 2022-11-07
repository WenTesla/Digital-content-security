%% PN 产生函数
function out = pn_gen(g, init, shift)
%function out = pn_gen(g, init, shift)
%g:generating ploynomial(msb, lsb)
%init:initial state
%shift:output selector
format = 1;
out_len = 0;
in_len = 0;
out = [];
%check parameter format, ether g2 = [1 0 0 0 0 0 1 0 1] or g1 = [8 2 0]
tp = max(g);
if tp == 1
    format = 2;%format of parameter
    in_len = length(g) - 1; 
else
    format = 1;
    in_len = g(1);
end
out_len = 2 ^ in_len - 1; %length of output
out = zeros(1, out_len);
for n = 1 : out_len
    out(n) = init(in_len);
    if format == 1
        tp = 0;
        for m = 2 : length(g)
            tp = mod((tp + init(g(m) + 1)), 2);%caculate new init(1)
            tp = mod((tp + init(in_len - g(m))), 2);%caculate new init(1)
        end
    else
        tp = init .* g(2 : (in_len + 1));
        tp = mod(sum(tp), 2);
    end
    init = [tp init(1 : (in_len - 1))];
end
for n = (shift - 1) : -1 : 0
    out = [out(2 : out_len), out(1)];
end

