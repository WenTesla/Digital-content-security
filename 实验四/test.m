% 1 select cover audio
[fname, pname] = uigetfile('*.wav', 'Select cover audio');
sourcename = strcat(pname, fname); 
s = wavread(sourcename)';
s_len = length(bits);
% 2 generate msg to be embedded
frag = 256;
msg_len = floor(s_len / frag);
msg = randsrc(1, msg_len, [0 1]);
% 3 generate PN
degree = 7;
pn0 = 2 * pn_gen([degree 6 0], [zeros(1, degree - 1) 1], 0) -1;
pn1 = 2 * pn_gen([degree 6 0], [zeros(1, degree - 1) 1], 1) -1;
% 4 embed msg
atten = 0.005;
bld = hide_ds(frag, msg, s, atten, pn0, pn1);
% 5 save the stegoed-audio
audiowrite(bld, 8e+3, 'hide.wav');
% 6 select stegoed-audio
[fname, pname] = uigetfile('*.wav', 'Select stegoed-audio');
sourcename = strcat(pname, fname); 
steg = audiowrite(sourcename)';
% 7 extract msg
out = dh_ds(frag, steg, pn0, pn1);
% 8 compute ebr
fid = 1;
ebr = sum(abs(msg - out)) / s_len;
fprintf(fid, 'ebr:%f\n', ebr);
